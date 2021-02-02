import Command from './Command';
import { CmdType } from './shared';

export default class ConstantCommand extends Command {
  constructor(type: CmdType, value: number) {
    super(type, value);
    this[type]();
  }
  
  // *SP = i; SP++
  push = () => {
    this.storeConstantValue(this.value);
    this.placeStoredValueOnStack();
    this.incrementStack();
  };
  
  pop = () => {throw Error('Can\'t pop a constant!');};
}