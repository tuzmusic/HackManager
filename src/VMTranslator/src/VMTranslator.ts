import TranslatorParser from './TranslatorParser';
import { HackTask } from '../../common/HackTask';

export class VMTranslator extends HackTask {
  
  static inExtension = 'vm';
  static outExtension = 'asm';
  static taskName = 'Translator';
  
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
  
    // translate each line
    const translations: string[][] = [];
    let prevLine: string;
    let prevTranslation: string[];
    for (const currentLine of linesToTranslate) {
      let currentTranslation = [`// ${ currentLine }`];
  
      currentTranslation.push(...TranslatorParser.parseLine(currentLine).getLines());
  
      if (prevLine && prevTranslation)
        currentTranslation = this.optimize(currentLine, prevLine, currentTranslation, prevTranslation);
  
      // currentTranslation.push(''); // blank line at end
      translations.push(currentTranslation);
      translations.push(['']);
  
      prevLine = currentLine;
      prevTranslation = currentTranslation;
    }
  
    // add ending loop
    translations.push([
      '(INFINITE_LOOP)',
      '@INFINITE_LOOP',
      '0;JMP'
    ]);
  
    return translations.flat().join('\n');
  }
  
  // after translations have been created, modify them in place
  private static optimize = (currentLine: string, prevLine: string, currentTranslation: string[], prevTranslation: string[]): string[] => {
    const optimizations = {
      // "push constant" ends with incrementing the stack, and an OperationCommand starts with decrementing the stack.
      // optimize those lines away.
      stackFlipping() {
        if (currentLine.split(' ').length === 1 && prevLine.startsWith('push constant')) {
          // remove the incrementing from the "push constant" translation
          prevTranslation.pop();
          prevTranslation.pop();
          
          // remove the decrementing (translation[2]) from the Operation command,
          // leaving "go to stack pointer" and "move to top of stack"
          currentTranslation = currentTranslation.filter((_, index) => index !== 2);
          
          // fix the comment
          currentTranslation[1] = currentTranslation[1].replace(new RegExp('(//)(.*)'), '$1 move to top of stack' +
            ' (already points to our operand)');
        }
      }
    };
    
    Object.values(optimizations).forEach(op => op());
    return currentTranslation;
  };
}