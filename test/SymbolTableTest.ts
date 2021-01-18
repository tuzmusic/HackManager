import { SymbolTable } from '../src/Classes';

describe('Symbol Table', () => {
  it("testInit", () => {
    expect(new SymbolTable().getValueFor("R1")).toEqual(1);
  });
  it("testAddAndGetMarker", () => {
      const table = new SymbolTable();
      table.add("line1", 1);
      table.add("line16", 16);
      table.add("line21", 21);

      expect(table.getValueFor("line1")).toEqual(1);
      expect(table.getValueFor("line16")).toEqual(16);
      expect(table.getValueFor("line21")).toEqual(21);
    },
  );
  it("testAddAndGetVariable", () => {
      const table = new SymbolTable();
      table.add("a");
      table.add("b");
      table.add("c");
      expect(table.getValueFor("a")).toEqual(16);
      expect(table.getValueFor("b")).toEqual(17);
      expect(table.getValueFor("c")).toEqual(18);
    },
  );
});
