import VMCommand from '../Commands/VMCommand';

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
    // *ARG = pop()        // reposition the return value for the caller
    this.popReturnValue();
    // SP = ARG+1          // restore the SP of the caller
    this.restoreCallerStackPosition();
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
    this.writeThe.storedValue.toMemoryAtCurrentAddress();
  }
  
  private saveReturnAddress() {
    // retrieve the return address, which was stored by the caller at LCL-5
    this.addLine('@LCL', '>>> store return address (RET), for later');
    this.addLine('D=M', 'store its address');
    this.addLine('@5');
    this.addLine('D=D-A', 'subtract 5, to get the location of the return address');
    this.addLine('A=D', 'move to location of return address');
    this.addLine('D=M', 'store return address');
    this.addLine('@RET', 'create/access RET variable');
    this.addLine('M=D', 'write the return address to RET');
  }
  
  private restoreCallerStackPosition() {
    this.addLine('D=A+1', '>>> restore caller\'s SP. (in prev step, A=ARG)');
    this.addLine('@SP');
    this.addLine('M=D', 'point SP to ARG+1 (one past returned value)');
  }
  
  private goToReturn() {
    this.addLine('@RET', '>>> move to the return address, to restore control to caller');
    this.addLine('A=M',);
  }
  
  private restoreCallerFrame() {
    /* this.addLine('@LCL', '');
     this.addLine('D=M', '');
     this.addLine('@SP', '');
     this.addLine('M=D-1', 'point SP to LCL-1 (saved "THAT")');
     this.addLine('A=M', 'move to saved "THAT"');
     this.addLine('D=M', 'store saved "THAT"');
     this.addLine('@THAT')
     this.addLine('M=D', 'restore saved "THAT"')
     
     this.decrementStackPointer('point SP to LCL-2 (saved "THIS")');*/
    
    /*
        this.addLine('@LCL', '');
        this.addLine('A=M-1', 'move to LCL-1: saved "THAT"');
        this.addLine('D=M', 'store saved "THAT"');
        this.addLine('@THAT', '');
        this.addLine('M=D', 'restore saved "THAT"');
    */
    
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
    }
    // this.addLine('', '');
    // this.addLine('', '');
    // this.addLine('', '');
  }
}