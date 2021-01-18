export enum InstructionType { A, C }

export interface AssemblerInstructionInterface {
  machineCode: string;
  instructionType: InstructionType;
}

export interface AInstructionInterface  {
    line: string;
}

export interface CInstructionInterface  {
      dest: string;
      comp: string;
      jump: string;
}


export interface AssemblyParserInterface {
    instruction: AssemblerInstructionInterface;
}

export interface SymbolTableInterface {
  getValueFor: (entry: string) => number;
  add: (label: string, lineNum: number) => void;
}
