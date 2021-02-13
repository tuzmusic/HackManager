import Command from './Command';
import { BinaryArithmeticCommand, BinaryCommand } from './BinaryArithmeticCommand';
import { ConstantCommand } from './ConstantCommand';
import { CmdType, MemorySegment } from './shared';
import { LocationCommand } from './LocationCommand';

export default class TranslatorParser {
  public readonly command: Command;
  
  static parseLine(line: string): Command {
    const parts = line.split(' ');
    
    if (parts.length === 1) {
      return new BinaryArithmeticCommand(parts[0] as BinaryCommand);
    }
    
    if (parts.length === 3) {
      const [type, segment, value] = parts;// as [CmdType, MemorySegment, string];
      if (segment === 'constant') {
        return new ConstantCommand(type as CmdType, value);
      }
      return new LocationCommand(type as CmdType, segment as MemorySegment, value);
    }
  }
}