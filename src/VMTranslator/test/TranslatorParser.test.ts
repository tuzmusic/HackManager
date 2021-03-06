import TranslatorParser from '../src/TranslatorParser';
import { BinaryCalculationCommand, OperationCommand } from '../src/Commands/OperationCommand';
import { mocked } from 'ts-jest/utils';
import { CmdType, MemorySegment } from '../src/shared';
import { ConstantCommand } from '../src/Commands/PushPopCommands/ConstantCommand';
import { LocationCommand } from '../src/Commands/PushPopCommands/LocationCommand';

jest.mock('../src/BinaryArithmeticCommand', () => // the file
  ({ // the class
    BinaryArithmeticCommand: jest.fn().mockImplementation(() => ({
      // the class members
      BinaryArithmeticCommand: (c: BinaryCalculationCommand) => { /**/ }
    }))
  }));

jest.mock('../src/ConstantCommand', () => // the file
  ({ // the class
    ConstantCommand: jest.fn().mockImplementation(() => ({
      // the class members
      ConstantCommand: (type: CmdType, value: number) => { /**/ }
    }))
  }));

jest.mock('../src/LocationCommand', () => // the file
  ({ // the class
    LocationCommand: jest.fn().mockImplementation(() => ({
      // the class members
      LocationCommand: (type: CmdType, segment: MemorySegment, value: number) => { /**/ }
    }))
  }));

describe('Translator Parser', () => {
  describe('BinaryArithmeticCommands', () => {
    const MockBinary = mocked(OperationCommand, true);
    
    beforeEach(() => MockBinary.mockClear());
    
    it('creates the correct arithemetic command', () => {
      TranslatorParser.parseLine('add');
      expect(MockBinary).toHaveBeenCalledWith('add');
    });
  });
  
  describe('ConstantCommands', () => {
    const MockConstant = mocked(ConstantCommand, true);
    
    beforeEach(() => MockConstant.mockClear());
  
    it('creates the correct constant command', () => {
      TranslatorParser.parseLine('push constant 17');
      expect(MockConstant).toHaveBeenCalledWith('push', '17');
    });
  });
  
  xdescribe('LocationCommands', () => {
    const MockLocation = mocked(LocationCommand, true);
    
    beforeEach(() => MockLocation.mockClear());
    
    it('creates the correct location command', () => {
      TranslatorParser.parseLine('pop local 17');
      expect(MockLocation).toHaveBeenCalledWith('pop', 'local', '17');
    });
  });
});
