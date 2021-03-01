import VMCommand from './Commands/VMCommand';
import { OperationCmd, OperationCommand } from './Commands/OperationCommand';
import { ConstantCommand } from './Commands/PushPopCommands/ConstantCommand';
import { CmdType, cmdTypes, MemorySegment } from './shared';
import { LocationCommand } from './Commands/PushPopCommands/LocationCommand';
import StaticCommand from './Commands/PushPopCommands/StaticCommand';
import { PointerCommand, } from './Commands/PushPopCommands/PointerCommand';

class LabelCommand extends VMCommand {
  constructor(parts: string[]) {
    super();
    this.addLine(`(${ parts[1] })`);
  }
}

class GotoCommand extends VMCommand {}

class IfGotoCommand extends VMCommand {
  /**  The stack’s topmost value is popped; if the value is not zero,
   *   execution continues from the location marked by the label;
   *   otherwise, execution continues from the next command in the program.
   *   The jump destination must be located in the same function.
   */
  constructor(parts: string[]) {
    super();
    // pop top of stack, store it in D
    this.decrementStackPointer();
    this.storeThe.topStackValue();
    // set jump destination
    this.addLine(`@${ parts[1] }`);
    // jump if popped value is not zero
    this.addLine('D;JNE');
  }
}

const typesBesidesLocationCmd = {
  'constant': ConstantCommand,
  'static': StaticCommand,
  'pointer': PointerCommand
};

export default class TranslatorParser {
  private parts: string[];
  
  private get firstPart(): string {return this.parts[0];}
  
  public parseLine(line: string): VMCommand {
    this.parts = line.split(' ');
    const { parts } = this;
    const firstPart = parts[0];
    
    const flowCommands = {
      'label': LabelCommand,
      'if-goto': IfGotoCommand
    };
    
    const cmd = flowCommands[firstPart as keyof typeof flowCommands];
    if (cmd) {
      return new cmd(parts);
    }
    
    // handle operations (add, sub, etc)
    if (parts.length === 1)
      return new OperationCommand(parts[0] as OperationCmd);
    
    // handle push/pop commands
    if (firstPart in cmdTypes && parts.length === 3) {
      const [type, segment, value] = parts as [CmdType, MemorySegment, string];
      
      const commandBesidesLocationCmd = typesBesidesLocationCmd[segment as keyof typeof typesBesidesLocationCmd];
      
      if (commandBesidesLocationCmd)
        return new commandBesidesLocationCmd(type as CmdType, value);
      else
        return new LocationCommand(type, segment, value);
    }
  }
}