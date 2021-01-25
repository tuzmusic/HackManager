import { AssemblerInterface } from './Interfaces';
import * as fs from 'fs';

export const Assembler: AssemblerInterface = class {
  static async assemble(filepath: string): Promise<void> {
    
    const content = await fs.readFileSync(filepath).toString();
    
    await fs.writeFileSync(filepath.replace('asm', 'hack'), content);
  }
};