import Command from './Command';
/*
* add
* sub
* eq
* gt
* lt
* neg
* and
* or
* not
*
* */
export type BinaryCommand =
  | 'add'
  | 'sub'
  | 'eq'
  | 'gt'
  | 'lt'
  | 'addOperation'

const loc1 = 'loc1';
const loc2 = 'loc2';

// Stack-based arithmetic is a simple matter: the two top elements are popped
// from the stack, the required operation is performed on them, and the result
// is pushed back onto the stack.
export class BinaryArithmeticCommand extends Command {
  lines: string[] = [];
  
  // OPERANDS HAVE ALREADY BEEN PUSHED ONTO THE STACK!!!
  constructor(command: BinaryCommand) {
    super('push', ''); // not used! dummy arguments! we just want access to all the helper commands.
    if (command === 'add') command = 'addOperation'; // because the base class has a member called "add"
  
    // the operands are on the stack.
    // in VM parlance, they will be popped. However, PUSHING AND POPPING ARE AN ABSTRACTION
    // and don't actually exist! on the low level of our actual implementation, all we care
    // about is that the correct values are in the correct memory locations by the end. we
    // don't care about any leftover unused values. no need to "actually pop"
  
    /*  // get and prepare to use the operands from memory
      this.move.to.variableOrValue(loc1); // @loc1
      this.store.memoryValue(); // D=M
      this.move.to.variableOrValue(loc2); // @loc2 (operation will use *loc2)
    */
  
    // after the push commands that prepare for these commands,
    // the SP points to one beyond the stored operands.
  
    /* store SECOND operand in D */
    this.decrementStackPointer();
    this.store.topStackValue();
  
    /* prep FIRST operand as M */
    this.decrementStackPointer();
    this.move.to.topOfStack();
  
    // perform the operation, storing the result in temp memory (D)
    this[command]();
  
    /* "push" result (stored in D) to stack */
    // replacing the value at the stack pointer
    // (the first operand) with the result of the operation.
    this.place.storedValue.ontoStack();
    // "push" means incrementing the stack
    this.incrementStackPointer();
  }
  
  addOperation = () => {
    this.lines.push('D=M+D');
  };
  
  sub = () => {
    this.lines.push('D=M-D');
  };
  
  eq = () => {
  
  };
  
  gt = () => {
  
  };
  
  lt = () => {
  
  };
}