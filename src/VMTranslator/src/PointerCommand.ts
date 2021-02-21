import Command from './Command';
import { CmdType } from './shared';

export class PointerCommand extends Command {
  
  constructor(type: CmdType, value: string) {
    super(type, value);
    this[type]();
  }
  
  addDestLine = () => this.addLine('@' + (this.value === '0' ? 'THIS' : 'THAT'));
  
  push = () => {
    this.addDestLine();
    this.storeThe.memoryValue();
    this.pushThe.storedValue.ontoStack();
  };
  
  pop = () => {
    this.decrementStackPointer();
    this.storeThe.topStackValue();
    this.addDestLine();
    this.writeThe.storedValue.toMemoryAtCurrentAddress();
  };
}