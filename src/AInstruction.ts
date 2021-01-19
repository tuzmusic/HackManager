import { AInstructionInterface, InstructionType } from './Interfaces';
import { SymbolTable } from './SymbolTable';
import { AssemblerInstruction } from './AssemblerInstruction';

export class AInstruction extends AssemblerInstruction implements AInstructionInterface {
  constructor(public readonly line: string, private table: SymbolTable) {
    super(InstructionType.A);

    /* CREATE MACHINE CODE */

    // remove leading @
    this.line = line.slice(1);
    const _line = this.line;
    let num = parseInt(_line);

    if (isNaN(num)) {             // if the line is a symbol (not a number),
      num = this.table.getValueFor(_line); // look up the symbol and use its value

      if (num === undefined) { // if it's not in the symbol table, store (and use) its value
        this.table.add(_line);
        num = this.table.getValueFor(_line); // the value is the next empty slot.}
      }

    }
    // translate number to a 15-bit binary and add the opcode
    this.machineCode = '0' + num.toString(2).padStart(15, '0');
  }
}
