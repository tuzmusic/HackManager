import { Assembler } from '../src/Assembler';
import { AssemblyParser } from '../src/AssemblyParser';
import { SymbolTable } from '../src/SymbolTable';
// import * as path from 'path';
// import * as fs from 'fs';
import arrayContaining = jasmine.arrayContaining;

let lines: string[] = [];
let result: string;

jest.mock('fs', () => ({
  readFileSync: () => ({ toString: () => lines.join('\n') }),
  writeFileSync: (filename: string, content: string) => result = content
}));

// const getAssembledLines = (lines: string[]): string[] => Assembler.assemble(lines.join('')).split('\n');

// trusting the implementation of parser and instructions,
// but this is an integration test anyway.
const getCorrectLines = (lines: string[]): string[] => {
  return lines.map(line => new AssemblyParser(line, new SymbolTable()).instruction.getMachineCode());
};

// when web

function assembledLines(): string[] {
  Assembler.assemble('xxx');
  return result.split('\n');
}


describe('Assembler', () => {
  describe('non-command lines', () => {
  
    it('stripsCommentsAndWhiteSpace', () => {
      lines = [
        '// a comment',
        ' ',
        ' ',
        '// another comment',
      ];
      expect(assembledLines()).toEqual(arrayContaining(['']));
    });
  
    it('removes markers (in parentheses)', () => {
      lines = [
        '(FIRST)', '(SECOND)'
      ];
      expect(assembledLines()).toEqual(arrayContaining(['']));
    });
    
    it('parses markers and jumps correctly', () => {
      lines = [
        '(FIRST)',
        '@SECOND', // line 0
        '(SECOND)',
        '@FIRST', // line 1
      ];
      expect(assembledLines()).toEqual(arrayContaining(getCorrectLines(['@1', '@0'])));
    });
  });
  
  test('Simple sequences of commands', () => {
    lines = [
      '@15',
      'D=A',
      '@R0',
      'A=0;JLE'
    ];
    expect(assembledLines()).toEqual(arrayContaining(getCorrectLines(lines)));
  });
  
  xdescribe('Test files', () => {
    // todo
  });
});
