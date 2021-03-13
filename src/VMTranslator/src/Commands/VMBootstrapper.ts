import VMCommand from './VMCommand';
import { FunctionCall } from '../FunctionCommands/FunctionCall';

export class VMBootstrapper extends VMCommand {
  private constructor() {
    super();
  
    this.addLine('// COMMAND #0A: BOOTSTRAP THE SYSTEM');
  
    // set the stack pointer
    this.storeThe.constantValue('256', 'set the start of the stack to addr 256');
    this.writeThe.storedValue.toLocationProvided('SP');
  
    this.addLine('');
    this.addLine('// COMMAND #0B: CALL Sys.init');
    this.addLinesFromCommand(FunctionCall, 'Sys.init', '0');
  }
  
  public static getBootstrapCode = (): string[] =>
    new VMBootstrapper().getLines();
}