import { StackCommand } from './StackCommand';

export class ConstantCommand extends StackCommand {
  // *SP = i; SP++
  protected push = () => {
    this.storeThe.constantValue(this.value);
    this.pushThe.storedValue.ontoStack(`>> push constant value (${ this.value }) onto stack <<`);
  };
  
  protected pop = () => {
    throw Error('Can\'t pop a constant!');
  };
}