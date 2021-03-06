import { PushPopCommand } from './PushPopCommand';

export class ConstantCommand extends PushPopCommand {
  protected push = () => {
    this.storeThe.constantValue(this.value);
    this.pushThe.storedValue.ontoStack(`>> push constant value (${ this.value }) onto stack <<`);
  };
  
  protected pop = () => {
    throw Error('Can\'t pop a constant!');
  };
}