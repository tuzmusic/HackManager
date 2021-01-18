import {
  AInstructionInterface,
  AssemblerInstructionInterface,
  AssemblyParserInterface,
  CInstructionInterface,
  InstructionType,
  SymbolTableInterface,
} from './Interfaces';

export class SymbolTable implements SymbolTableInterface {
  getValueFor = (entry: string): number => {};
  add = (label: string, lineNum: number = -1): void => {};
}

export class AssemblerInstruction implements AssemblerInstructionInterface {
  machineCode: string;
  instructionType: InstructionType;
}

export class AInstruction implements AInstructionInterface {
  // line: string;
  instructionType: InstructionType = InstructionType.A;
  machineCode: string;

  constructor(public line: string, private table: SymbolTable) {}
}

export class CInstruction implements CInstructionInterface {
  instructionType: InstructionType = InstructionType.C;
  machineCode: string;

  constructor(
    public comp: string,
    public dest: string = "",
    public jump: string = "",
  ) {}
}

export class AssemblyParser implements AssemblyParserInterface {
  instruction: AssemblerInstructionInterface;
  constructor(private line: string, private table: SymbolTable) {}
}
