import VMCommand from './Commands/VMCommand';
import { OperationCmd, OperationCommand } from './Commands/OperationCommand';
import { ConstantCommand } from './Commands/PushPopCommands/ConstantCommand';
import { CmdType, MemorySegment } from './shared';
import { LocationCommand } from './Commands/PushPopCommands/LocationCommand';
import { GotoCommand } from './Commands/ProgramFlow/GotoCommand';
import { IfGotoCommand } from './Commands/ProgramFlow/IfGotoCommand';
import { LabelCommand } from './Commands/ProgramFlow/LabelCommand';
import { ReturnCommand } from './FunctionCommands/ReturnCommand';
import { FunctionDeclaration } from './FunctionCommands/FunctionDeclaration';
import { FunctionCall } from './FunctionCommands/FunctionCall';
import { SmartCommand, smartCommands, SmartPushPopCommand } from './Commands/PushPopCommands/SmartPushPopCommand';

const parseTable = {
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
const { functionCommands, flowCommands, } = parseTable;
type FlowCommand = keyof typeof flowCommands
type FunctionCommand = keyof typeof functionCommands

export default class TranslatorParser {
  
  public parseLine(line: string, lineNum: number): VMCommand {
    const parts = line.split(' ');
    const [first, second, third] = parts;
  
    switch (parts.length) {
      case 1:
        return first === 'return'
          ? new ReturnCommand()
          : new OperationCommand(first as OperationCmd);
    
      case 2:
        return new flowCommands[first as FlowCommand](second + '.VM');
    }
  
    if (parts.length !== 3) throw Error('Invalid command (too many arguments)');
  
    if (first in functionCommands) {
      return new functionCommands[first as FunctionCommand](second, third, lineNum);
    }
  
    const [type, segment, value] = parts as [CmdType, 'constant' | SmartCommand | MemorySegment, string];
  
    if (segment === 'constant') {
      return new ConstantCommand(type, value);
    } else if (segment in smartCommands) {
      return new SmartPushPopCommand(type, smartCommands[segment as SmartCommand](value));
    } else {
      return new LocationCommand(type, segment as MemorySegment, value);
    }
  
  }
}