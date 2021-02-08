import TranslatorParser from '../src/TranslatorParser';
import { BinaryArithmeticCommand, BinaryCommand } from '../src/BinaryArithmeticCommand';
import { mocked } from 'ts-jest/utils';

// the file
jest.mock('../src/BinaryArithmeticCommand', () => {
  return ({
    // the class
    BinaryArithmeticCommand: jest.fn().mockImplementation(() => {
      return ({
        // the class members
        BinaryArithmeticCommand: (c: BinaryCommand) => {}
      });
    })
  });
});

describe('Translator Parser', () => {
  const MockBinary = mocked(BinaryArithmeticCommand, true);
  
  beforeEach(() => {
    // MockBinary.mockClear();
  });
  it('calls the constructor', () => {
    const cmd = new TranslatorParser('add');
    expect(MockBinary).toHaveBeenCalledTimes(1);
  });
  
});