import VMCommand from '../Commands/VMCommand';
import { CallStack } from './CallStack';

/*
Implementation:
FRAME = LCL         // FRAME is a temporary variable
RET = *(FRAME-5)    // put return address in a temp variable
*ARG = pop()        // reposition the return value for the caller
SP = ARG+1          // restore the SP of the caller
THAT = *(FRAME-1)   // restore the THAT of the caller
THIS = *(FRAME-2)   // restore the THIS of the caller
ARG = *(FRAME-3)    // restore the ARG of the caller
LCL = *(FRAME-4)    // restore the LCL of the caller
goto RET            // go to the return address in caller's code (stored above)
* */

export class ReturnCommand extends VMCommand {
  
  constructor() {
    super();
    // FRAME = LCL         // FRAME is a temporary variable
    // RET = *(FRAME-5)    // put return address in a temp variable
    this.saveReturnAddress();
    this.addLine('');
    // *ARG = pop()        // reposition the return value for the caller
    this.popReturnValue();
    this.addLine('');
    // SP = ARG+1          // restore the SP of the caller
    this.restoreCallerStackPosition();
    this.addLine('');
    // THAT = *(FRAME-1)   // restore the THAT of the caller
    // THIS = *(FRAME-2)   // restore the THIS of the caller
    // ARG = *(FRAME-3)    // restore the ARG of the caller
    // LCL = *(FRAME-4)    // restore the LCL of the caller
    this.restoreCallerFrame();
    // goto RET            // go to the return address in caller's code (stored above)
    this.goToReturn();
  }
  
  // pop return value to ARG[0]
  private popReturnValue() {
    this.decrementStackPointer('>>> store (pop) top stack value to ARG[0]');
    this.storeThe.topStackValue();
    this.move.to.variableOrValue('ARG');
    this.move.using.currentMemoryValue.asAddress('move to ARG');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('store return value in ARG[0]');
  }
  
  private saveReturnAddress() {
    // retrieve the return address, which was stored by the caller at LCL-5
    this.addLine('@LCL', '>>> store return address (RET), for later');
    this.addLine('D=M', 'store the LCL pointer address');
    this.addLine('@5');
    this.addLine('D=D-A', 'subtract 5, to get the location of the return address');
    this.addLine('@RET', 'create/access RET variable');
    this.addLine('M=D', 'write the return address to RET');
  }
  
  private restoreCallerStackPosition() {
    this.addLine('D=A', '>>> restore caller\'s SP. (in prev step, A=ARG)');
    this.addLine('@SP');
    this.addLine('M=D+1', 'point SP to ARG+1 (one past returned value)');
  }
  
  private goToReturn() {
    // todo: this may or may not be needed? I'm honestly not sure if the
    //  return address is just about moving around the assembly code, or
    //  about actually changing values in the system (A, SP, etc)
    // this.addLine('@RET', '>>> move to the return address, to restore control to caller');
    // this.addLine('A=M',);
  
    // on top-level function, there is nothing to return to
    if (!CallStack.isEmpty()) return;
  
    // TODO: this breaks SimpleFunction (3/6/21)
    const label = CallStack.generateReturnLabel();
    this.jumpUnconditionallyTo(label, `goto ${ label }`);
  
    CallStack.popFunction();
  }
  
  private restoreCallerFrame() {
    const segments = ['THAT', 'THIS', 'ARG', 'LCL'];
    
    for (let i = 0; i < segments.length; i++) {
      this.addLine('@LCL', `>>> restoring saved "${ segments[i] }"`);
      this.addLine('A=M-1', `move to LCL-${ i + 1 }: saved "${ segments[i] }"`);
      
      // decrement A
      for (let j = 0; j < i; j++)
        this.addLine('A=A-1');
      
      // restore
      this.addLine('D=M', `store saved "${ segments[i] }"`);
      this.addLine(`@${ segments[i] }`, '');
      this.addLine('M=D', `restore saved "${ segments[i] }"`);
      this.addLine('',);
    }
  }
}