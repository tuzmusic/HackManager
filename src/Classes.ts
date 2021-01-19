import {
  AssemblerInstructionInterface,
  AssemblyParserInterface,
  CInstructionInterface,
  InstructionType,
} from './Interfaces';
import { SymbolTable } from './SymbolTable';
import { AssemblerInstruction } from './AssemblerInstruction';

export class CInstruction extends AssemblerInstruction implements CInstructionInterface {
  // instructionType: InstructionType = InstructionType.C;
  // machineCode: string;

  constructor(
    public comp: string,
    public dest: string = "",
    public jump: string = "",
  ) {
    super(InstructionType.C);
  }
}

export class AssemblyParser implements AssemblyParserInterface {
  instruction: AssemblerInstructionInterface;
  constructor(private line: string, private table: SymbolTable) {}
}
