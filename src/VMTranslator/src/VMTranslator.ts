import TranslatorParser from './TranslatorParser';
import { HackTask } from '../../common/HackTask';

export class VMTranslator extends HackTask {
  
  static inExtension = 'vm';
  static outExtension = 'asm';
  static taskName = 'Translator';
  
  static processText(text: string): string {
    // The absolute optimum would be to read in one line at a time.
    // I just really don't feel like figuring that out, with readline etc.
    // Instead, I'll save all the lines in an array,
    
    const filteredOrigLines = text.split('\n')
      // remove empty lines
      .filter(line => line.trim() != '')
      // remove comment lines
      .filter(line => !line.trim().startsWith('//'))
      // remove inline comments
      .map(line => line.split('//')[0].trim());
    // convert to assembly code
    const translatedLines = filteredOrigLines
      .map(line => {
        const lineArray = [
          `// ${ line }`,
          ...TranslatorParser.parseLine(line).getLines()
        ];
        return lineArray;
      }).flat();
    // join into a single string
    return translatedLines.join('\n');
  }
}