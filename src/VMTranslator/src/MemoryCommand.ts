import Command from './Command';

export class MemoryCommand extends Command {
  getLines = () => {
    if (!this.lines.length) this[this.type]();
    return [...this.lines];
  };
  
  protected push = (): void => { throw Error('not implemented'); };
  
  protected pop = (): void => { throw Error('not implemented'); };
}