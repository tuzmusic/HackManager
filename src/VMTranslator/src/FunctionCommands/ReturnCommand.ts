import VMCommand from '../Commands/VMCommand';
import { CallStack } from './CallStack';

/*
Implementation:
FRAME = LCL         // FRAME is a temporary variable
RET = *(FRAME-5)    // put return address in a temp variable
                    // get what we PUSHED in "push return address"! (the value STORED THERE)
                    // BUT IF WE HAVE A LABEL WE DON'T NEED THIS!!!!!! WHAT THE FUCK!?!?!!?
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
  
    // on top-level function, there is nothing to return to
    if (CallStack.isEmpty()) return;
  
    // TODO: this breaks SimpleFunction (3/6/21)
    // const label = CallStack.generateReturnLabel();
    // this.jumpUnconditionallyTo(label, `goto ${ label }`);
  
    CallStack.popFunction();
  }
  
  private saveReturnAddress() {
    this.addLine('@LCL', '>>> store LCL as FRAME');
    this.storeThe.memoryValue('store value of LCL');
    this.at_sign('FRAME', 'access FRAME variable (VME uses @R13)');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('save FRAME=LCL');
  
    this.addLine('@5', '>>> save RET');
    this.addLine('A=D-A', 'move to location of retAddr');
    this.storeThe.memoryValue('store the value of retAddr');
    // this.addLine('D=D-A', 'RET=FRAME-5');
    this.at_sign('RET', 'create/access RET variable (VME uses @R14)');
    this.addLine('M=D', 'write the value of retAddr to RET');
  }
  
  // pop return value to ARG[0]
  private popReturnValue() {
    this.decrementStackPointer('>>> store (pop) top stack value to ARG[0]');
    this.storeThe.topStackValue();
    this.move.to.variableOrValue('ARG');
    this.move.using.currentMemoryValue.asAddress('move to ARG');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('store return value in ARG[0]');
  }
  
  private restoreCallerStackPosition() {
    this.addLine('D=A', '>>> restore caller\'s SP. (in prev step, A=ARG)');
    this.addLine('@SP');
    this.addLine('M=D+1', 'point SP to ARG+1 (one past returned value)');
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
  
  private goToReturn() {
    // todo: this may or may not be needed? I'm honestly not sure if the
    //  return address is just about moving around the assembly code, or
    //  about actually changing values in the system (A, SP, etc)
    this.at_sign('RET', '>>> move to the return address, to restore control to caller');
    // this.goto(CallStack.generateReturnLabel(), '>>> move to the return address, to restore control to caller');
    this.addLine('A=M', 'prepare to jump to address stored in RET');
    this.addLine('0;JMP');
  }
}