import { AssemblyParser } from '../src/AssemblyParser';
import { InstructionType } from '../src/Interfaces';
import { SymbolTable } from '../src/SymbolTable';
import { AInstruction } from '../src/AInstruction';
import { CInstruction } from '../src/CInstruction';

describe('AssemblyParser', () => {
  let table: SymbolTable;
  beforeEach(() => table = new SymbolTable());
  describe('A Instruction', () => {
    it('throwsIfComments', () => {
      expect(() => new AssemblyParser('@R3 // plus some comments', table).instruction).toThrow();
    });
    it('parsesAInstructionType', () => {
        // parse an a instruction and test its instruction type
        const p = new AssemblyParser('@1', table);
        expect(p.instruction.getInstructionType()).toEqual(InstructionType.A);
      },
    );
    it('parsesBuiltInConstants', () => {
        const parser = new AssemblyParser('@R3', table).instruction;
        const a = parser as AInstruction;
        expect(a.line).toEqual('R3');
      },
    );
    it('parsesNumericConstant', () => {
        const parser = new AssemblyParser('@15', table).instruction;
        const a = parser as AInstruction;
        expect(a.line).toEqual('15');
      },
    );
    it('parsesVariable', () => {
      const parser = new AssemblyParser('@abc', table).instruction;
      const a = parser as AInstruction;
      expect(a.line).toEqual('abc');
    });
  });
  
  describe('C Instruction', () => {
    it('throwsIfComments', () => {
        expect(() => new AssemblyParser('A=D-1;JMP // plus some comments', table).instruction).toThrow();
      },
    );
    it('parsesCInstructionTypeFull', () => {
        // parse an a C and test its instruction type
        const parser = new AssemblyParser('A=D-1;JMP', table).instruction;
        expect(parser.getInstructionType()).toEqual(InstructionType.C);
        
        const c = parser as CInstruction;
        expect(c.dest).toEqual('A');
        expect(c.comp).toEqual('D-1');
        expect(c.jump).toEqual('JMP');
      },
    );
    it('parsesCInstructionTypeNoJump', () => {
        // parse an a C and test its instruction type
        const parser = new AssemblyParser('D=D+M', table).instruction;
        expect(parser.getInstructionType()).toEqual(InstructionType.C);
        
        const c = parser as CInstruction;
        expect(c.dest).toEqual('D');
        expect(c.comp).toEqual('D+M');
        expect(c.jump).toEqual('');
      },
    );
    it('parsesCInstructionTypeNoDest', () => {
      // parse an a C and test its instruction type
      const parser = new AssemblyParser('A&M;JMP', table).instruction;
      expect(parser.getInstructionType()).toEqual(InstructionType.C);
      
      const c = parser as CInstruction;
      expect(c.dest).toEqual('');
      expect(c.comp).toEqual('A&M');
      expect(c.jump).toEqual('JMP');
    });
  });
  
});

