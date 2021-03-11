import { PushPopCommand } from './PushPopCommand';

export class TempCommand extends PushPopCommand {
  get tempValue(): string {return (parseInt(this.value) + 5).toString();}
  
  push = (): void => {
    this.move.to.variableOrValue(this.tempValue);
    this.pushThe.valueAtCurrentAddress.ontoStack();
  };
  
  pop = (): void => {
    this.decrementStackPointer();
    this.storeThe.topStackValue();
    this.move.to.variableOrValue(this.tempValue);
    this.writeThe.storedValue.toMemoryAtCurrentAddress();
  };
}