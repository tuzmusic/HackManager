import { AssemblyParser, CInstruction } from '../src/Classes';
import { InstructionType } from '../src/Interfaces';
import { SymbolTable } from '../src/SymbolTable';
import { AInstruction } from '../src/AInstruction';

describe('AssemblyParser', () => {
  let table: SymbolTable;
  beforeEach(() => table = new SymbolTable());
  describe('A Instruction', () => {
    it("removesComments", () => {
        const ptr = new AssemblyParser("@R3 // plus some comments", table).instruction;
        const a = ptr as AInstruction;
        expect(a.line).toEqual("R3");
      },
    );
    it("parsesAInstructionType", () => {
        // parse an a instruction and test its instruction type
        const p = new AssemblyParser("@1", table);
        expect(p.instruction.instructionType).toEqual(InstructionType.A);
      },
    );
    it("parsesBuiltInConstants", () => {
        const ptr = new AssemblyParser("@R3", table).instruction;
        const a = ptr as AInstruction;
        expect(a.line).toEqual("R3");
      },
    );
    it("parsesNumericConstant", () => {
        const ptr = new AssemblyParser("@15", table).instruction;
        const a = ptr as AInstruction;
        expect(a.line).toEqual("15");
      },
    );
    it("parsesVariable", () => {
      const ptr = new AssemblyParser("@abc", table).instruction;
      const a = ptr as AInstruction;
      expect(a.line).toEqual("abc");
    });
  });

  describe('C Instruction', () => {
    it("removesComments", () => {
        // parse an a C and test its instruction type
        const ptr = new AssemblyParser("A=D-1;JMP // plus some comments", table).instruction;
        expect(ptr.instructionType).toEqual(InstructionType.C);

        const c = ptr as CInstruction;
        expect(c.dest).toEqual("A");
        expect(c.comp).toEqual("D-1");
        expect(c.jump).toEqual("JMP");
      },
    );
    it("parsesCInstructionTypeFull", () => {
        // parse an a C and test its instruction type
        const ptr = new AssemblyParser("A=D-1;JMP", table).instruction;
        expect(ptr.instructionType).toEqual(InstructionType.C);

        const c = ptr as CInstruction;
        expect(c.dest).toEqual("A");
        expect(c.comp).toEqual("D-1");
        expect(c.jump).toEqual("JMP");
      },
    );
    it("parsesCInstructionTypeNoJump", () => {
        // parse an a C and test its instruction type
        const ptr = new AssemblyParser("D=D+M", table).instruction;
        expect(ptr.instructionType).toEqual(InstructionType.C);

        const c = ptr as CInstruction;
        expect(c.dest).toEqual("D");
        expect(c.comp).toEqual("D+M");
        expect(c.jump).toEqual("");
      },
    );
    it("parsesCInstructionTypeNoDest", () => {
      // parse an a C and test its instruction type
      const ptr = new AssemblyParser("A&M;JMP", table).instruction;
      expect(ptr.instructionType).toEqual(InstructionType.C);

      const c = ptr as CInstruction;
      expect(c.dest).toEqual("");
      expect(c.comp).toEqual("A&M");
      expect(c.jump).toEqual("JMP");
    });
  });

});

