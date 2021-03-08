import TranslatorParser from './TranslatorParser';
import { HackTask } from '../../common/HackTask';
import { VMBootstrapper } from './Commands/VMBootstrapper';
import * as fs from 'fs';

export class VMTranslator extends HackTask {
  
  static inExtension = 'vm';
  static outExtension = 'asm';
  static taskName = 'Translator';
  
  static processPath(pathString: string): void {
    super.processPath(pathString);
    
    if (fs.lstatSync(pathString).isDirectory()) {
      // TODO: do this better!
      // add bootstrap code to final file
      const all = fs.readFileSync(this.outPath);
      fs.writeFileSync(this.outPath,
        [VMBootstrapper.getBootstrapCode(), all].flat().join('\n')
      );
    }
  }
  
  static processText(text: string): string {
    // The absolute optimum would be to read in one line at a time.
    // I just really don't feel like figuring that out, with readline etc.
    // Instead, I'll save all the lines in an array, and keep mutating it in place.
    
    const linesToTranslate = text.split('\n')
      // remove empty lines
      .filter(line => line.trim() != '')
      // remove comment lines
      .filter(line => !line.trim().startsWith('//'))
      // remove inline comments
      .map(line => line.split('//')[0].trim());
    
    const translations: string[][] = [];
    
    // start with bootstrap code
    // TODO: this breaks SimpleFunction (3/6/21)
    // translations.push(VMBootstrapper.getBootstrapCode());
    
    // translate each line
    let prevLine: string;
    let prevTranslation: string[];
    for (const currentLine of linesToTranslate) {
      let currentTranslation = [`// ${ currentLine }`];
      
      currentTranslation.push(...new TranslatorParser().parseLine(currentLine).getLines());
      
      if (prevLine && prevTranslation)
        currentTranslation = this.optimize(currentLine, prevLine, currentTranslation, prevTranslation);
      
      translations.push(currentTranslation);
      
      prevLine = currentLine;
      prevTranslation = currentTranslation;
    }
  
    // add a blank line between each source command
    translations.forEach(t => t.push(''));
  
    // add ending loop
    translations.push([
      '(INFINITE_LOOP)',
      '@INFINITE_LOOP',
      '0;JMP'
    ]);
  
    // fix function comments
    translations.forEach(tr => {
      if (tr[0].trim().startsWith('// function')) {
        tr[1] += '\t' + tr[0]; // add function comment to the marker
        tr.shift(); // and delete the original function comment
      }
    });
  
    return translations.flat() // get all lines
      .map(line => (line.startsWith('(') ? '' : '\t') + line) // indent all non-marker lines
      .join('\n');
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
}