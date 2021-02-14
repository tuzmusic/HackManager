import Command from './Command';
import { CmdType } from './shared';

export class ConstantCommand extends Command {
  constructor(type: CmdType, value: string) {
    super(type, value);
    this[type]();
  }
  
  // *SP = i; SP++
  push = () => {
    this.store.constantValue(this.value);
    this.place.storedValue.ontoStack();
    this.incrementStackPointer();
  };
  
  pop = () => {throw Error('Can\'t pop a constant!');};
}