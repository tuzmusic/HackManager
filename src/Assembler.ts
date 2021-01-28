import { AssemblerInterface } from './Interfaces';
import * as fs from 'fs';

export const Assembler: AssemblerInterface = class {
  static assemble(filepath: string): void {
    
    const content = fs.readFileSync(filepath).toString();
    
    fs.writeFileSync(filepath.replace('asm', 'hack'), content);
  }
};

