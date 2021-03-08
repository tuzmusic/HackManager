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
    this.pushReturnAddress(); // todo: what is this anyway???
  
    // push LCL              // Save LCL of the calling function
    // push ARG              // Save ARG of the calling function
    // push THIS             // Save THIS of the calling function
    // push THAT             // Save THAT of the calling function
    this.saveFrame();
  
    // ARG = SP-n-5          // reposition ARG (n = number of args)
    // LCL = SP              // reposition LCL
    this.repositionSegments();
  
    // go to the function
    this.jumpUnconditionallyTo(funcName, 'jump to the function');
    this.addLine('');
    // final step!
    this.addLabel(this.returnLabel, 'return point for the just-called function');
  }
  
  private saveFrame() {
    const segments = ['THAT', 'THIS', 'ARG', 'LCL'];
  
    for (let i = segments.length - 1; i >= 0; i--) {
      this.addLine(`@${ segments[i] }`, `>>> saving "${ segments[i] }"`);
      this.storeThe.memoryValue();
      this.pushThe.storedValue.ontoStack();
      this.addLine('');
    }
  }
  
  // THIS MAY BE NOTHING??
  private pushReturnAddress() {
    /*
    * "Push a label onto the stack. And later on I'm going to use the same label
    * as the label to which I'm going to return after the callee terminates."
    *
    * But what is it that we are pushing onto the stack????
    * */
  
    /* perhaps it's the SP value of the return label?
    * or is it pushing, like, ITS address? which is to say,
    * "this is where SP should be at the end of the function
    * */
  }
  
  private repositionSegments() {
    this.addLine('@SP', '>>> reposition: LCL = SP');
    this.addLine('D=M', 'store the stack pointer');
    this.addLine('@LCL');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('save SP to LCL');
  
    this.addLine(`@${ 5 + parseInt(this.argNum) }`, '>>> reposition ARG = SP-n-5');
    this.addLine('D=D-A', 'subtract from the stored SP: frame + num of args');
    this.addLine('@ARG');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('save SP-n-5 to ARG');
  }
}