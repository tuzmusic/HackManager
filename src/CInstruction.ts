import { AssemblerInstruction } from './AssemblerInstruction';
import { CInstructionInterface, InstructionType } from './Interfaces';
import { COMP_CODES, DEST_CODES, JUMP_CODES } from './constants';

export class CInstruction extends AssemblerInstruction implements CInstructionInterface {
  constructor(
    public comp: string,
    public dest: string = '',
    public jump: string = '',
  ) {
    super(InstructionType.C);
    
    this.machineCode = '111' + COMP_CODES[comp]// 'a' bit is already handled in the table
      + (dest ? DEST_CODES[dest] : '000')
      + (jump ? JUMP_CODES[jump] : '000');
  }
}