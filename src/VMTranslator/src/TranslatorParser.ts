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

const specialSegments = {
  'constant': ConstantCommand,
  'static': StaticCommand,
  'pointer': PointerCommand
};
type SpecialSegment = keyof typeof specialSegments

const flowCommands = {
  'label': LabelCommand,
  'if-goto': IfGotoCommand,
  'goto': GotoCommand
};
type FlowCommand = keyof typeof flowCommands

export default class TranslatorParser {
  public parseLine(line: string): VMCommand {
    const parts = line.split(' ');
    const [first, second] = parts;
    
    switch (parts.length) {
      case 1: // handle operations (add, sub, etc)
        return new OperationCommand(first as OperationCmd);
      
      case 2: // handle program flow commands
        return new flowCommands[first as FlowCommand](second);
      
      case 3: // handle push/pop commands
        const [type, segment, value] = parts as [CmdType, MemorySegment | SpecialSegment, string];
        if (segment in specialSegments) // handle "special segments"
          return new specialSegments[segment as SpecialSegment](type, value);
        else // handle all the various segments
          return new LocationCommand(type, segment as MemorySegment, value);
    }
  }
}