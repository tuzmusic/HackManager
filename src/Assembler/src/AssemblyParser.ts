import { AssemblerInstructionInterface, AssemblyParserInterface, } from './Interfaces';
import { SymbolTable } from './SymbolTable';
import { AInstruction } from './AInstruction';
import { CInstruction } from './CInstruction';

export class AssemblyParser implements AssemblyParserInterface {
  public readonly instruction: AssemblerInstructionInterface;
  
  constructor(private line: string, private table: SymbolTable) {
    // non-instruction lines should be handled BEFORE we get to the parser
    if (line.startsWith('(') || line.includes('//') || line.includes(' ')) {
      throw Error('Only actual instructions, without spaces, should be fed to the Parser.');
    }
    
    // a-instruction
    if (line.startsWith('@')) {
      this.instruction = new AInstruction(line.substr(1), table);
      return;
    }
    
    const {
      dest,
      comp,
      jump
    } = line.match(/(?<dest>[AMD]{1,3}=)?(?<comp>[01\-AMD!|+&><]{1,3})?(?<jump>;[A-Z]{3})?/).groups;
    
    this.instruction = new CInstruction(
      comp,
      (dest ?? '').slice(0, -1), // remove trailing "="
      (jump ?? '').slice(1) // remove leading ";"
    );
  }
}
