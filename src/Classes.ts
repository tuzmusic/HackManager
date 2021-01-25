import { AssemblerInstructionInterface, AssemblyParserInterface, } from './Interfaces';
import { SymbolTable } from './SymbolTable';

export class AssemblyParser implements AssemblyParserInterface {
  instruction: AssemblerInstructionInterface;
  constructor(private line: string, private table: SymbolTable) {}
}
