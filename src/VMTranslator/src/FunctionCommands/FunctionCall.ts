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
    this.addLine('\n\t// execution continues (after function return)...');
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
    /**
     * Neither the VM code or assembly code recurs. Only the execution recurs.
     * So there should actually not be a label for each recursion, but only
     * a label for each *return point*.
     * This VM/ASM flow should only occur *once* for each label, in the code.
     *
     * Remember, it's not entirely clear from the VM Emulator what happens.
     * That's what we're working to figure out. And we'll do that by hypothesizing,
     * not getting too attached, and seeing what works.
     */
  
    /**
     * what we are doing is STORING, ON THE STACK, a record of where we
     * will need to return to. Again, we're storing it ON THE STACK.
     *
     * What is it we're storing on the stack?
     * It has to be an address, IN THE ASSEMBLY CODE.
     * The address of a label. (not the address where the label is stored!)
     *
     * How do we get the address of a label?
     * The Assembler creates it using the symbol table.
     * So we need to get the address of the label, after the label is created.
     */
  
    /* Create the label. (whatever$label) will take us to the location of a new label */
    // use the CallStack-generated label. Since it doesn't matter what the actual
    // label is, right?
    this.at_sign(this.returnLabel);
    /* Push the address of the label onto the stack!
    * As a result, the return command will find the address of the label (retAddr)
    * on the stack, and jump to it.
    *
    * THIS DOES SEEM WEIRD, since it seems like we'll never actually use the label again???
    * Sure we'll place the label later ––– WAIT A MINUTE! @label doesn't tell use where the
    * label is if there's no (label) first, right?!?!?!
    * ANSWER: the assembler parses the markers on the first pass.
    * This doesn't seem very system-agnostic, but it should work.
    * */
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