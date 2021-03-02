import VMCommand from '../VMCommand';
import { CmdType } from '../../shared';

// Base class for all push/pop commands
export class PushPopCommand extends VMCommand {
  constructor(protected type: CmdType, protected value: string, protected segment?: string) {
    super();
  }
  
  public getLines = () => {
    if (!this.lines.length) this[this.type]();
    return [...this.lines];
  };
  
  protected push = (): void => { throw Error('not implemented'); };
  
  protected pop = (): void => { throw Error('not implemented'); };
}