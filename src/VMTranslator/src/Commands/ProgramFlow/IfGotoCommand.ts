import VMCommand from '../VMCommand';

export class IfGotoCommand extends VMCommand {
  /**  The stack’s topmost value is popped; if the value is not zero,
   *   execution continues from the location marked by the label;
   *   otherwise, execution continues from the next command in the program.
   *   The jump destination must be located in the same function.
   */
  constructor(label: string) {
    super();
    // pop top of stack, store it in D
    this.decrementStackPointer();
    this.storeThe.topStackValue();
    // set jump destination
    this.addLine(`@${ label }`);
    // jump if popped value is not zero
    this.addLine('D;JNE');
  }
}