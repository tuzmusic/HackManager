import LocationCommand from '../src/LocationCommand';
import { MemorySegment } from '../src/shared';
import arrayContaining = jasmine.arrayContaining;

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