import { AInstruction, CInstruction } from '../src/Classes';

describe('C Instructions', () => {
  const parsedC = (comp: string, dest: string = "", jump: string = "") =>
    new CInstruction(comp, dest, jump).machineCode;

  it("noJump", () => {
      // D=M
      expect(parsedC("M", "D")).toEqual("1111110000010000");
      // AD=1
      expect(parsedC("1", "AD")).toEqual("1110111111110000");
    },
  );
  it("noDest", () => {
      // 0;JMP
      expect(parsedC("0", "", "JMP")).toEqual("1110101010000111");
      // D+M;JEQ
      expect(parsedC("D+M", "", "JEQ")).toEqual("1111000010000010");
      // A;JLT
      expect(parsedC("A", "", "JLT")).toEqual("1110110000000100");
    },
  );
  it("fullInstruction", () => {
    // M=0;JMP
    expect(parsedC("0", "M", "JMP")).toEqual("1110101010001111");
    // A=D+M;JEQ
    expect(parsedC("D+M", "A", "JEQ")).toEqual("1111000010100010");
    // AD=A;JLT
    expect(parsedC("A", "AD", "JLT")).toEqual("1110110000110100");
  });

});
