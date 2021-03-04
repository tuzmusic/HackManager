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
    // *ARG = pop()        // reposition the return value for the caller
    // SP = ARG+1          // restore the SP of the caller
    // THAT = *(FRAME-1)   // restore the THAT of the caller
    // THIS = *(FRAME-2)   // restore the THIS of the caller
    // ARG = *(FRAME-3)    // restore the ARG of the caller
    // LCL = *(FRAME-4)    // restore the LCL of the caller
    // goto RET            // go to the return address in caller's code (stored above)
  }
  
}