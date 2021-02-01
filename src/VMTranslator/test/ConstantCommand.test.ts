import ConstantCommand from '../src/ConstantCommand';
import arrayContaining = jasmine.arrayContaining;

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