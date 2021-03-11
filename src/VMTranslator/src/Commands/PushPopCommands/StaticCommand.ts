import { VMTranslator } from '../../VMTranslator';
import { PushPopCommand } from './PushPopCommand';

export default class StaticCommand extends PushPopCommand {
  protected push = () => {
    // move to static slot
    this.addStaticLine();
    this.storeThe.memoryValue('store the static value in D');
    // push the value to the stack
    this.pushThe.storedValue.ontoStack('>> push it onto the stack <<');
  };
  
  protected pop = () => {
    // pop stack into D
    this.decrementStackPointer('move stack pointer back to the value to be popped');
    this.storeThe.topStackValue();
    
    // write D into static
    this.addStaticLine();
    this.writeThe.storedValue.toMemoryAtCurrentAddress('and store the value there'); // M=D
  };
  
  private addStaticLine = (comment = 'go to static slot') =>
    this.addJumpDestination(`${ VMTranslator.filename }.${ this.value }`, comment);
}