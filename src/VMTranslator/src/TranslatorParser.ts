import VMCommand from './Commands/VMCommand';
import { OperationCmd, OperationCommand } from './Commands/OperationCommand';
import { ConstantCommand } from './Commands/PushPopCommands/ConstantCommand';
import { CmdType, cmdTypes, MemorySegment } from './shared';
import { LocationCommand } from './Commands/PushPopCommands/LocationCommand';
import StaticCommand from './Commands/PushPopCommands/StaticCommand';
import { PointerCommand, } from './Commands/PushPopCommands/PointerCommand';
import { GotoCommand } from './Commands/ProgramFlow/GotoCommand';
import { IfGotoCommand } from './Commands/ProgramFlow/IfGotoCommand';
import { LabelCommand } from './Commands/ProgramFlow/LabelCommand';
import { ReturnCommand } from './FunctionCommands/ReturnCommand';
import { FunctionDeclaration } from './FunctionCommands/FunctionDeclaration';
import { FunctionCall } from './FunctionCommands/FunctionCall';

const parseTable = {
  specialSegments: {
    'constant': ConstantCommand,
    'static': StaticCommand,
    'pointer': PointerCommand
  },
  flowCommands: {
    'label': LabelCommand,
    'if-goto': IfGotoCommand,
    'goto': GotoCommand
  },
  functionCommands: {
    'function': FunctionDeclaration,
    'call': FunctionCall
  }
};
const { functionCommands, flowCommands, specialSegments } = parseTable;
type FlowCommand = keyof typeof flowCommands
type SpecialSegment = keyof typeof specialSegments
type FunctionCommand = keyof typeof functionCommands

export default class TranslatorParser {
  static ifBoolCounter = 0;
  
  public parseLine(line: string, lineNum: number): VMCommand {
    const parts = line.split(' ');
    const [first, second, third] = parts;
  
    switch (parts.length) {
      case 1:
        return first === 'return'
          ? new ReturnCommand()
          : new OperationCommand(first as OperationCmd); // handle operations (add, sub, etc)
    
      case 2: // handle program flow commands
        return new flowCommands[first as FlowCommand](second);
    }
    
    if (parts.length !== 3) throw Error('Invalid command (too many arguments)');
    
    if (first in cmdTypes) { // handle push/pop commands
      const [type, segment, value] = parts as [CmdType, MemorySegment | SpecialSegment, string];
      if (segment in specialSegments) // handle "special segments"
        return new specialSegments[segment as SpecialSegment](type, value);
      else // handle all the various segments
        return new LocationCommand(type, segment as MemorySegment, value);
    }
    
    if (first in functionCommands) // handle function commands
      return new functionCommands[first as FunctionCommand](second, third, lineNum);
  }
}