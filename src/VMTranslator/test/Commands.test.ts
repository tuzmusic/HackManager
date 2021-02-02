import LocationCommand from '../src/LocationCommand';
import { MemorySegment } from '../src/shared';
import ConstantCommand from '../src/ConstantCommand';
import arrayContaining = jasmine.arrayContaining;

describe('All Commands', () => {
  
  describe('Location Commands', () => {
    describe('push', () => {
      test('push local 8', () => {
        const lines = new LocationCommand('push', MemorySegment.Local, 8).getLines();
        
        expect(lines).toEqual(arrayContaining([
          '@LCL',
          'D=A',
          '@8',
          'D=D+A',
          'A=D',
          'D=M',
          '@SP',
          'A=M',
          'M=D',
          '@SP',
          'M=M+1',
        ]));
        
      });
    });
  });
  describe('ConstantCommand', () => {
    describe('push', () => {
      test('push constant 17', () => {
        const lines = new ConstantCommand('push', 17).getLines();
        
        expect(lines).toEqual(arrayContaining([
          '@17',
          'D=A',
          '@SP',
          'A=M',
          'M=D',
          '@SP',
          'M=M+1',
        ]));
      });
    });
  });
});
