export enum InstructionType { A, C }

export interface AssemblerInstructionInterface {
  getMachineCode(): string;
  getInstructionType(): InstructionType;
}

export interface AInstructionInterface {
  line: string;
}

export interface CInstructionInterface {
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

export interface ProcessorInterface {
  processFile: (filename: string) => void;
  processText: (text: string) => string;
  inExtension: string;
  outExtension: string;
}