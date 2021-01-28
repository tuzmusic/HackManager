import { Assembler } from '../src/Assembler';
import { AssemblyParser } from '../src/AssemblyParser';
import { SymbolTable } from '../src/SymbolTable';
import * as path from 'path';
import * as fs from 'fs';
import arrayContaining = jasmine.arrayContaining;

jest.mock('fs', () => ({
  readFileSync: (filename: string) => {
    console.log(filename);
    return {
      toString: () => 'returned string'
    };
  },
  writeFileSync: (filename: string, content: string) => {
    console.log(filename);
  }
}));

// const getAssembledLines = (lines: string[]): string[] => Assembler.assemble(lines.join('')).split('\n');

// trusting the implementation of parser and instructions,
// but this is an integration test anyway.
const getCorrectLines = (lines: string[]): string[] => {
  return lines.map(line => new AssemblyParser(line, new SymbolTable()).instruction.getMachineCode());
};

// when web
const filename = path.resolve(__dirname, 'fixtures', 'testfile.asm');

function assembledLines(lines: string[]): string {
  // TODO: Mock the 'fs' module!
  //  *Somewhat* complicated since we need to mock it in the Assembler
  //  (stub readFileSync to return our "lines"), and then I guess
  //  we need to mock it in the test too. Perhaps a captured variable
  //  can be written for the Assembler's call to writeFileSync and then
  //  we simply test that (and the tests don't need to use fs at all).
  // fs.writeFileSync(filename, lines.join('\n'));
  Assembler.assemble(filename);
  // const file = fs.readFileSync(filename.replace('asm', 'hack'));
  // const contents = file.toString();
  return 'contents';
}

function deleteFiles(): void {
  // fs.unlinkSync(filename);
  // fs.unlinkSync(filename.replace('asm', 'hack'));
}

describe('Assembler', () => {
  afterEach(deleteFiles);
  describe('non-command lines', () => {
    
    it.only('stripsCommentsAndWhiteSpace', () => {
      const lines = [
        '// a comment',
        ' ',
        ' ',
        '// another comment',
      ];
      expect(assembledLines(lines)).toEqual(arrayContaining(['']));
    });
    
    it('removes markers (in parentheses)', () => {
      const lines = [
        '(FIRST)', '(SECOND)'
      ];
      expect(assembledLines(lines)).toEqual(arrayContaining(['']));
    });
    
    it('parses markers and jumps correctly', () => {
      const lines = [
        '(FIRST)',
        '@SECOND', // line 0
        '(SECOND)',
        '@FIRST', // line 1
      ];
      expect(assembledLines(lines)).toEqual(arrayContaining(['@1', '@0']));
    });
  });
  
  test('Simple sequences of commands', () => {
    const lines = [
      '@15',
      'D=A',
      '@R0',
      'A=0;JLE'
    ];
    expect(assembledLines(lines)).toEqual(arrayContaining(getCorrectLines(lines)));
  });
  
  xdescribe('Test files', () => {
    // todo
  });
});
