import VMCommand from '../VMCommand';
import { CmdType } from '../../shared';

// Base class for all push/pop commands
export abstract class PushPopCommand extends VMCommand {
  constructor(protected type: CmdType, protected value: string) {
    super();
  }
  
  public getLines = () => {
    if (!this.lines.length)
      this[this.type]();
    
    return [...this.lines];
  };
  
  protected abstract push(): void;
  
  protected abstract pop(): void;
}

export abstract class SmartPushPopCommand extends PushPopCommand {
  protected abstract location(): string
  
  protected push = () => this.pushThe.valueAtLocation.ontoStack(this.location());
  
  protected pop = () => this.popStack.toAddress(this.location());
}