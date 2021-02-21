import Command from './Command';
import { CmdType } from './shared';
import { VMTranslator } from './VMTranslator';

export default class StaticCommand extends Command {
  constructor(type: CmdType, value: string) {
    super(type, value);
    this[type]();
  }
  
  addStaticLine = (comment = 'go to static slot') =>
    this.addLine(`@${ VMTranslator.filename }.${ this.value }`, comment);
  
  push = () => {
    // move to static slot
    this.addStaticLine();
    this.storeThe.memoryValue('store the static value in D');
    
    this.pushThe.storedValue.ontoStack('>> push it onto the stack <<');
  };
  
  pop = () => {
    // pop stack into D
    this.decrementStackPointer('move stack pointer back to the value to be popped');
    this.storeThe.topStackValue();
    // this.decrementStackPointer('SP-- to "pop" the stack');
    
    // write D into static
    this.addStaticLine();
    this.writeThe.storedValue.toMemoryAtCurrentAddress('and store the value there'); // M=D
  };
}