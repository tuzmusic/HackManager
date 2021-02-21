import Command from './Command';
import { BinaryCalculationCommand, OperationCommand } from './OperationCommand';
import { ConstantCommand } from './ConstantCommand';
import { CmdType, MemorySegment } from './shared';
import { LocationCommand } from './LocationCommand';
import StaticCommand from './StaticCommand';
import { PointerCommand, PointerValue } from './PointerCommand';

export default class TranslatorParser {
  public readonly command: Command;
  
  static parseLine(line: string): Command {
    const parts = line.split(' ');
    
    if (parts.length === 1) {
      return new OperationCommand(parts[0] as BinaryCalculationCommand);
    }
    
    if (parts.length === 3) {
      const [type, segment, value] = parts;// as [CmdType, MemorySegment, string];
      if (segment === 'constant') {
        return new ConstantCommand(type as CmdType, value);
      }
      if (segment === 'static') {
        return new StaticCommand(type as CmdType, value);
      }
      if (segment === 'pointer') {
        return new PointerCommand(type as CmdType, value as PointerValue);
      }
      return new LocationCommand(type as CmdType, segment as MemorySegment, value);
    }
  }
}