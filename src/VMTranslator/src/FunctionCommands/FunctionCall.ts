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
  
  constructor(private funcName: string, private argNum: string, private lineNum: number) {
    super();
    CallStack.pushFunction(funcName);
    this.returnLabel = CallStack.generateReturnLabel();
  
    // push return-address   // using label declared below
    this.pushReturnAddress(); // SP++
  
    // push LCL              // Save LCL of the calling function
    // push ARG              // Save ARG of the calling function
    // push THIS             // Save THIS of the calling function
    // push THAT             // Save THAT of the calling function
    this.saveFrame(); // SP += 4
  
    // ARG = SP-n-5          // reposition ARG (n = number of args)
    // LCL = SP              // reposition LCL
    this.repositionSegments();
  
    // go to the function
    this.jumpUnconditionallyTo(funcName, 'jump to the function');
    this.addLine('');
    // final step!
    this.addLabel(this.returnLabel, 'return point for the just-called function');
    this.addLine('\n\t// execution continues (after called function returns)...');
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
  
  private pushReturnAddress() {
    /* Create the label. (whatever$label) will take us to the location of a new label */
    this.move.to.variableOrValue(this.returnLabel);
  
    /* Push the address of the label onto the stack!
    * As a result, the return command will find the address of the label (retAddr)
    * on the stack, and jump to it. */
    this.storeThe.currentAddress('D=retAddr');
    this.pushThe.storedValue.ontoStack('>>> push retAddr onto stack');
  }
  
  private repositionSegments() {
    this.addLine('@SP', '>>> reposition: LCL = SP');
    this.addLine('D=M', 'store the stack pointer (after pushing the retAddr & segments)');
    this.addLine('@LCL');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('save SP to LCL');
    this.addLine('', 'this should be 5 more than after pushing retAddr');
  
    this.addLine(`@${ 5 + parseInt(this.argNum) }`, '>>> reposition ARG = SP-n-5');
    this.addLine('D=D-A', 'subtract (frame + num of args) from the stored SP');
    this.addLine('@ARG');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('save SP-n-5 to ARG');
  }
}