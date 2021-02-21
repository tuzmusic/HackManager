import Command from './Command';
import { CmdType } from './shared';

export type PointerValue = '0' | '1'

export class PointerCommand extends Command {
  dest: 'THIS' | 'THAT';
  
  constructor(type: CmdType, value: PointerValue) {
    super(type, value);
    this.dest = this.value === '0' ? 'THIS' : 'THAT';
    this[type]();
  }
  
  push = () => {
    this.addLine('@' + this.dest);
    this.storeThe.memoryValue();
    this.pushThe.storedValue.ontoStack();
  };
  
  pop = () => {
    this.decrementStackPointer();
    this.storeThe.topStackValue();
    this.addLine('@' + this.dest);
    this.writeThe.storedValue.toMemoryAtCurrentAddress();
  };
}