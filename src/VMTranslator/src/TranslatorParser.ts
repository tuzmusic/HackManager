import VMCommand from './Commands/VMCommand';
import { OperationCmd, OperationCommand } from './Commands/OperationCommand';
import { ConstantCommand } from './Commands/PushPopCommands/ConstantCommand';
import { CmdType, MemorySegment } from './shared';
import { LocationCommand } from './Commands/PushPopCommands/LocationCommand';
import StaticCommand from './Commands/PushPopCommands/StaticCommand';
import { PointerCommand, } from './Commands/PushPopCommands/PointerCommand';
import { GotoCommand } from './Commands/ProgramFlow/GotoCommand';
import { IfGotoCommand } from './Commands/ProgramFlow/IfGotoCommand';
import { LabelCommand } from './Commands/ProgramFlow/LabelCommand';

const typesBesidesLocationCmd = {
  'constant': ConstantCommand,
  'static': StaticCommand,
  'pointer': PointerCommand
};

const flowCommands = {
  'label': LabelCommand,
  'if-goto': IfGotoCommand,
  'goto': GotoCommand
};

export default class TranslatorParser {
  
  public parseLine(line: string): VMCommand {
    const parts = line.split(' ');
    
    const [firstPart] = parts;
    switch (parts.length) {
      case 1: // handle operations (add, sub, etc)
        return new OperationCommand(parts[0] as OperationCmd);
      
      case 2: // handle program flow commands
        return new flowCommands[firstPart as keyof typeof flowCommands](parts[1]);
      
      case 3: // handle push/pop commands
        const [type, segment, value] = parts as [CmdType, MemorySegment, string];
        
        // might be better to do something like:
        //  if (segment in Object.keys(typesBesidesLocationCmd)) ...
        // and then somehow loop LocationCommand in with that call?
        // best way might be to have segment be the *final* argument to LocationCommand ctor
        const commandBesidesLocationCmd = typesBesidesLocationCmd[segment as keyof typeof typesBesidesLocationCmd];
        
        if (commandBesidesLocationCmd)
          return new commandBesidesLocationCmd(type as CmdType, value, segment);
        else
          return new LocationCommand(type, value, segment);
      
    }
  }
}