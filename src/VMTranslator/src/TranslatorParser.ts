import Command from './Command';
import { BinaryCalculationCommand, OperationCommand } from './OperationCommand';
import { ConstantCommand } from './ConstantCommand';
import { CmdType, MemorySegment } from './shared';
import { LocationCommand } from './LocationCommand';
import StaticCommand from './StaticCommand';
import { PointerCommand, } from './PointerCommand';

export default class TranslatorParser {
  public readonly command: Command;
  
  static parseLine(line: string): Command {
    const parts = line.split(' ');
  
    if (parts.length === 1)
      return new OperationCommand(parts[0] as BinaryCalculationCommand);
  
    const typesBesidesLocationCmd = {
      'constant': ConstantCommand,
      'static': StaticCommand,
      'pointer': PointerCommand
    };
  
    if (parts.length === 3) {
      const [type, segment, value] = parts as [CmdType, MemorySegment, string];
    
      const commandBesidesLocationCmd = typesBesidesLocationCmd[segment as keyof typeof typesBesidesLocationCmd];
    
      if (commandBesidesLocationCmd)
        return new commandBesidesLocationCmd(type as CmdType, value);
      else
        return new LocationCommand(type, segment, value);
    }
  }
}