import VMCommand from '../VMCommand';

export class IfGotoCommand extends VMCommand {
  constructor(label: string) {
    super();
    // pop top of stack, store it in D
    this.popStack.toTempStorage();
    // set jump destination
    this.move.to.variableOrValue(label);
    // jump if popped value is not zero
    this.addLine('D;JNE');
  }
}