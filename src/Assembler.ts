import { AssemblerInterface } from './Interfaces';
import * as fs from 'fs';
import { SymbolTable } from './SymbolTable';
import { AssemblyParser } from './AssemblyParser';

export const Assembler: AssemblerInterface = class {
  static assembleText(text: string): string {
    let lines = text.split('\n');
    const table = new SymbolTable();
    
    // The absolute optimum would be to read in one line at a time.
    // I just really don't feel like figuring that out, with readline etc.
    // Instead, I'll save all the lines in an array,
    // and then modify that array in place on both passes.
    // And anyway you need to do two passes.
    
    // first pass pt1: clear empty lines and comments
    lines = lines
      // first pass pt1: clear empty lines
      .filter(line => line.trim() != '')
      // first pass pt2: clear comment lines
      .filter(line => !line.trim().startsWith('//'))
      // remove inline comments
      .map(line => line.split('//')[0].trim());
    
    let currentLine = 0;
    
    // first pass pt2: parse markers
    lines.forEach(line => {
      if (!line.startsWith('(')) {
        currentLine++;
      } else {
        table.add(line.slice(1, -1), currentLine);
      }
    });
    
    // remove markers
    lines = lines.filter(line => !line.startsWith('('));
    
    // convert lines to machine code
    lines = lines.map(line => new AssemblyParser(line, table).instruction.getMachineCode());
    return lines.join('\n');
  }
  
  static assemble(filepath: string): void {
    const assembled = this.assembleText(fs.readFileSync(filepath).toString());
    const newFilePath = filepath.replace('asm', 'hack');
    console.log('Creating', newFilePath.split('/').pop());
    fs.writeFileSync(newFilePath, assembled);
    console.log('Done');
  }
};

