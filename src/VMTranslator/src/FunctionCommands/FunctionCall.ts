import VMCommand from '../Commands/VMCommand';
import { CallStack } from './CallStack';

/*
Implementation:
  push return-address   // using label declared below
  push LCL              // Save LCL of the calling function
  push ARG              // Save ARG of the calling function
  push THIS             // Save THIS of the calling function
  push THAT             // Save THAT of the calling function
  ARG = SP-n-5          // reposition ARG (n = number of args)
  LCL = SP              // reposition LCL
  goto f                // jump to the function
(return-address)        // declare the label for the return address
* */

export class FunctionCall extends VMCommand {
  private readonly returnLabel: string;
  
  constructor(private funcName: string, private argNum: string) {
    super();
    CallStack.pushFunction(funcName);
    this.returnLabel = CallStack.generateReturnLabel();
  
    // push return-address   // using label declared below
    this.pushReturnAddress();
  
    // push LCL              // Save LCL of the calling function
    // push ARG              // Save ARG of the calling function
    // push THIS             // Save THIS of the calling function
    // push THAT             // Save THAT of the calling function
    this.saveFrame();
  
    // ARG = SP-n-5          // reposition ARG (n = number of args)
    // LCL = SP              // reposition LCL
    this.repositionSegments();
  
    // go to the function
    this.jumpUnconditionallyTo(this.returnLabel);
  
    // final step!
    this.addLabel(this.returnLabel, 'return point for the just-called function');
  }
  
  private saveFrame() {
    const segments = ['THAT', 'THIS', 'ARG', 'LCL'];
    
    for (let i = segments.length - 1; i <= 0; i--) {
      this.addLine(`@${ segments[i] }`, `>>> saving "${ segments[i] }"`);
      this.storeThe.memoryValue();
      this.pushThe.storedValue.ontoStack();
    }
  }
  
  // THIS MAY BE NOTHING??
  private pushReturnAddress() {
  
  }
  
  private repositionSegments() {
    this.addLine('@SP', '>>> reposition LCL & ARG');
    this.addLine('D=M', 'store the stack pointer');
    this.addLine('@LCL');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('save SP to LCL');
    
    this.addLine('@5');
    this.addLine('D=D-A', 'subtract 5 from the stored SP');
    this.addLine('@ARG');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('save SP-5 to ARG');
  }
}