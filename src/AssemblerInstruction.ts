import { AssemblerInstructionInterface, InstructionType } from './Interfaces';

export class AssemblerInstruction implements AssemblerInstructionInterface {
  protected machineCode: string;

  constructor(private instructionType: InstructionType) {}

  getInstructionType = (): InstructionType => this.instructionType;
  getMachineCode = (): string => this.machineCode;
}
