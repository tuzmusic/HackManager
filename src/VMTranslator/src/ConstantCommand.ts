import Command from './Command';
import { CmdType } from './shared';

export default class ConstantCommand extends Command {
  constructor(type: CmdType, value: number) {
    super(type, value);
    this[type]();
  }
  
  // *SP = i; SP++
  push = () => {
    this.store.constantValue(this.value);
    this.place.storedValue.ontoStack();
    this.incrementStack();
  };
  
  pop = () => {throw Error('Can\'t pop a constant!');};
}