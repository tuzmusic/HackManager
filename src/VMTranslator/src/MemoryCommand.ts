import Command from './Command';
import { CmdType } from './shared';

export class MemoryCommand extends Command {
  constructor(type: CmdType, value: string) {
    super(type, value);
    // this[type]();
  }
  
  getLines = () => {
    this[this.type]();
    return [...this.lines];
  };
  
  protected push = (): void => { throw Error('not implemented'); };
  
  protected pop = (): void => { throw Error('not implemented'); };
  
}