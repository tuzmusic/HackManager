import { PushPopCommand } from './PushPopCommand';

export class PointerCommand extends PushPopCommand {
  protected push = () => {
    this.addDestLine();
    this.storeThe.memoryValue();
    this.pushThe.storedValue.ontoStack();
  };
  
  protected pop = () => {
    this.decrementStackPointer();
    this.storeThe.topStackValue();
    this.addDestLine();
    this.writeThe.storedValue.toMemoryAtCurrentAddress();
  };
  
  private addDestLine = () => this.addLine('@' + (this.value === '0' ? 'THIS' : 'THAT'));
}