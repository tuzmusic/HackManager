import { SymbolTable } from '../src/SymbolTable';
import { AInstruction } from '../src/AInstruction';

let table: SymbolTable;
describe('AInstruction', () => {

  beforeEach(() => {
    table = null;
    table = new SymbolTable();
  });

  const parsedA = (line: string) => new AInstruction(line, table).getMachineCode();

  xit("numericalConstant", () => {
      expect(parsedA("@16")).toEqual("0000000000010000");
      expect(parsedA("@01")).toEqual("0000000000000001");
      expect(parsedA("@10")).toEqual("0000000000001010");
      expect(parsedA("@96")).toEqual("0000000001100000");
      expect(parsedA("@1200")).toEqual("0000010010110000");
    },
  );
  xit("predefinedSymbol", () => {
      expect(parsedA("@R10")).toEqual("0000000000001010");
      expect(parsedA("@SCREEN")).toEqual("0100000000000000");
    },
  );
  it("existingCustomSymbol", () => {
      const newKey = "abc";
      table.add(newKey);
      expect(parsedA(`@${ newKey }`)).toEqual("0000000000010000");
    },
  );
  it("newCustomSymbol", () => {
    const newKey = "abc";
    expect(table.getValueFor(newKey)).toBeUndefined();
    // first instance of @abc; add to table at next free spot (16)
    expect(parsedA(`@${ newKey }`)).toEqual("0000000000010000");
    // abc exists, line should be the same
    expect(parsedA(`@${ newKey }`)).toEqual("0000000000010000");
  });

});
