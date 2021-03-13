import TranslatorParser from './TranslatorParser';
import { HackTask } from '../../common/HackTask';
import { VMBootstrapper } from './Commands/VMBootstrapper';
import * as fs from 'fs';

export class VMTranslator extends HackTask {
  
  static inExtension = 'vm';
  static outExtension = 'asm';
  static taskName = 'Translator';
  
  static runningLineCount = 0;
  
  static processPath(pathString: string): void {
    super.processPath(pathString);
  
    // add bootstrap code if we started with a directory
    if (fs.lstatSync(pathString).isDirectory()) {
      // add bootstrap code into final file
      const codeLines = fs.readFileSync(this.outPath);
      fs.writeFileSync(this.outPath,
        [this.indentNonMarkerLines(VMBootstrapper.getBootstrapCode()), codeLines]
          .flat().join('\n')
      );
    }
    this.writeRawFile();
  }
  
  static processText(text: string): string {
    this.runningLineCount = 0;
    
    const linesToTranslate = text.split('\n')
      // remove empty lines
      .filter(line => line.trim() != '')
      // remove comment lines
      .filter(line => !line.trim().startsWith('//'))
      // remove inline comments
      .map(line => line.split('//')[0].trim());
  
    const translations: string[][] = [];
  
    // translate each line
    let prevLine: string;
    let prevTranslation: string[];
    for (let i = 0; i < linesToTranslate.length; i++) {
      const currentLine = linesToTranslate[i];
      let currentTranslation = [`// COMMAND #${ this.runningLineCount + 1 }: ${ currentLine }`];
  
      currentTranslation.push(...new TranslatorParser().parseLine(currentLine, ++this.runningLineCount).getLines());
  
      if (prevLine && prevTranslation)
        currentTranslation = this.optimize(currentLine, prevLine, currentTranslation, prevTranslation);
  
      translations.push(currentTranslation);
  
      prevLine = currentLine;
      prevTranslation = currentTranslation;
    }
  
    // add a blank line between each source command
    translations.forEach(t => t.push(''));
  
    // fix function comments
    translations.forEach(tr => {
      const actualCommand = tr[0].split(': ').pop().trim();
      const firstWord = actualCommand.split(' ')[0];
  
      if (['function', 'label'].includes(firstWord)) {
        tr[1] += '\t' + tr[0]; // add function comment to the marker
        tr.shift(); // and delete the original function comment
      }
    });
  
    return this.indentNonMarkerLines(translations.flat()).join('\n');
  }
  
  static writeRawFile(): void {
    // write raw file, for matching up line numbers
    const rawPath = this.outPath.replace(this.outExtension, 'raw.' + this.outExtension);
  
    let oldRawCount = 0;
  
    // get line count for previous
    try { oldRawCount = this.getFileLineCount(rawPath);} catch (e) { }
  
    const fullCode = fs.readFileSync(this.outPath).toString();
  
    // remove comments and blank lines
    const firstPass = fullCode.split('\n')
      .filter(line => line.trim()) // remove blank lines
      .map(line => line.trim());
  
    const secondPass: string[] = [];
  
    // include commands as comments
    firstPass.forEach((line, i) => {
      const nextLine = firstPass[i + 1];
      if (!nextLine) return;
      const nextLineParts = nextLine.split('// ');
      const cmdCommentParts = line.split('COMMAND #');
  
      if (cmdCommentParts.length > 1) {
        const commandInfo = `** ${ cmdCommentParts.pop() } **`;
        // add command info
        if (nextLineParts.length === 2) {
          const nextLineComment = nextLineParts.pop();
          firstPass[i + 1] = nextLine.padEnd(12).replace(nextLineComment, `${ commandInfo } (${ nextLineComment })`);
        } else {
          firstPass[i + 1] = nextLine.padEnd(12) + ' // ' + commandInfo;
        }
    
        // add artificial line break in prev line
        if (secondPass.length) {
          let lastLine = secondPass.pop();
          lastLine += ' - ' + (Array(128).fill(' ')).join('');
          secondPass.push(lastLine);
        }
      } else if (!line.startsWith('//') && !line.startsWith('(')) {
        secondPass.push(line);
      }
    });
  
    const rawCode = secondPass
      // Assembler removes (markers) when assembling machine code.
      // They still remain in the assembly code!
      // BUT the line numbers we want are actually to line up with the HACK code which DOESN'T have the markers
      .filter(line => !line.trim().startsWith('(')) // remove jump markers
      .join('\n');
  
    fs.writeFileSync(rawPath, rawCode);
    const newRawCount = this.getFileLineCount(rawPath);
  
    if (oldRawCount) {
      const lineDiff = newRawCount - oldRawCount;
      if (lineDiff > 0) console.log(lineDiff, 'lines added');
      if (lineDiff < 0) console.log(-1 * lineDiff, 'lines saved');
      if (lineDiff === 0) console.log('identical line count');
      // console.log(`Previous linecount: ${ oldRawCount }. New linecount: ${ newRawCount }`);
    }
  }
  
  private static getFileLineCount(filePath: string): number {
    return fs.readFileSync(filePath).toString().split('\n').length;
  }
  
  /**
   * after translations have been created, modify them in place.
   * <p>NOTE that `currentTranslation = currentTranslation.filter(fn)` does NOT modify the source in place.
   * @param currentLine
   * @param prevLine
   * @param currentTranslation
   * @param prevTranslation
   */
  private static optimize = (currentLine: string, prevLine: string, currentTranslation: string[], prevTranslation: string[]): string[] => {
    const optimizations = {
      // when the current command starts by decrementing the stack, but the previous command ended by incrementing
      // the stack, optimize away that stack manipulation.
      stackFlipping() {
        const prevLen = prevTranslation.length;
        
        const currentStartsWithDecrement = currentTranslation[1].startsWith('@SP')
          && currentTranslation[2].startsWith('M=M-1');
        
        const prevEndsWithIncrement = prevTranslation[prevLen - 2].startsWith('@SP')
          && prevTranslation[prevLen - 1].startsWith('M=M+1');
        
        if (currentStartsWithDecrement && prevEndsWithIncrement) {
          // if (currentLine.split(' ').length === 1 && prevLine.startsWith('push constant')) {
          // remove the incrementing from the "push constant" translation
          prevTranslation.pop();
          prevTranslation.pop();
  
          // remove the decrementing (translation[2]) from the current command,
          // leaving "go to stack pointer" and "move to top of stack"
          currentTranslation = currentTranslation.filter((_, index) => index !== 2);
  
          // fix the comment
          currentTranslation[1] = currentTranslation[1].replace(new RegExp('(//.*)'), '$1' +
            ' (SP decremented above)');
        }
      }
    };
    
    Object.values(optimizations).forEach(op => op());
    return currentTranslation;
  };
  
  private static indentNonMarkerLines(lines: string[]): string[] {
    return lines.map(line => (line.startsWith('(') ? '' : '\t') + line); // indent all non-marker lines
  }
}