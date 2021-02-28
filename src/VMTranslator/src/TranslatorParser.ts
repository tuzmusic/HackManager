import VMCommand from './Commands/VMCommand';
import { BinaryCalculationCommand, OperationCommand } from './Commands/OperationCommand';
import { ConstantCommand } from './Commands/PushPopCommands/ConstantCommand';
import { CmdType, MemorySegment } from './shared';
import { LocationCommand } from './Commands/PushPopCommands/LocationCommand';
import StaticCommand from './Commands/PushPopCommands/StaticCommand';
import { PointerCommand, } from './Commands/PushPopCommands/PointerCommand';

export default class TranslatorParser {
  public static parseLine(line: string): VMCommand {
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