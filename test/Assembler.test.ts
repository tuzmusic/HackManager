import { Assembler } from '../src/Assembler';
import { AssemblyParser } from '../src/AssemblyParser';
import { SymbolTable } from '../src/SymbolTable';
import arrayContaining = jasmine.arrayContaining;

const getAssembledLines = (lines: string[]): string[] => Assembler.assemble(lines.join('')).split('\n');

// trusting the implementation of parser and instructions,
// but this is an integration test anyway.
const getCorrectLines = (lines: string[]): string[] => {
  return lines.map(line => new AssemblyParser(line, new SymbolTable()).instruction.getMachineCode());
};

describe('Assembler', () => {
  describe('non-command lines', () => {
    
    it('stripsCommentsAndWhiteSpace', () => {
      const lines = [
        '// a comment',
        ' ',
        ' ',
        '// another comment',
      ];
      expect(getAssembledLines(lines)).toEqual(arrayContaining(['']));
    });
    
    it('removes markers (in parentheses)', () => {
      const lines = [
        '(FIRST)', '(SECOND)'
      ];
      expect(getAssembledLines(lines)).toEqual(arrayContaining(['']));
    });
    
    it('parses markers and jumps correctly', () => {
      const lines = [
        '(FIRST)',
        '@SECOND', // line 0
        '(SECOND)',
        '@FIRST', // line 1
      ];
      expect(getAssembledLines(lines)).toEqual(arrayContaining(['@1', '@0']));
    });
  });
  
  test('Simple sequences of commands', () => {
    const lines = [
      '@15',
      'D=A',
      '@R0',
      'A=0;JLE'
    ];
    expect(getAssembledLines(lines)).toEqual(arrayContaining(getCorrectLines(lines)));
  });
  
  xdescribe('Test files', () => {
  
  });
});
