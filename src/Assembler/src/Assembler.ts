import { SymbolTable } from './SymbolTable';
import { AssemblyParser } from './AssemblyParser';
import { HackTask } from '../../common/HackTask';

export class Assembler extends HackTask {
  static inExtension = 'asm';
  static outExtension = 'hack';
  static taskName = 'Assembler';
  
  static processText(text: string): string {
    // The absolute optimum would be to read in one line at a time.
    // I just really don't feel like figuring that out, with readline etc.
    // Instead, I'll save all the lines in an array,
    // and then modify that array in place on both passes.
    // And anyway you need to do two passes.
    
    const table = new SymbolTable();
    let currentLine = 0;
    
    return text.split('\n')
      // remove empty lines
      .filter(line => line.trim() != '')
      // remove comment lines
      .filter(line => !line.trim().startsWith('//'))
      // remove inline comments
      .map(line => line.split('//')[0].trim())
      // parse and remove markers
      .filter(line => {
        if (!line.startsWith('(')) return ++currentLine; // return true (include in filter)
        table.add(line.slice(1, -1), currentLine); // add marker to symbol table
        return false; // exclude from filter
      })
      // convert to machine code
      .map(line => new AssemblyParser(line, table).instruction.getMachineCode())
      // join into a single string
      .join('\n');
  }
}

