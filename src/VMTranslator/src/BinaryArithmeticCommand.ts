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
export type BinaryCalculationCommand =
  | 'add'
  | 'sub'
export type BinaryComparisonCommand =
  | 'eq'
  | 'gt'
  | 'lt'

// Stack-based arithmetic is a simple matter: the two top elements are popped
// from the stack, the required operation is performed on them, and the result
// is pushed back onto the stack.
export class BinaryArithmeticCommand extends Command {
  lines: string[] = [];
  /**
   * operate on top two elements of the stack.
   * Y (*SP) stored in D
   * X (*[SP-1]) "prepped" as M.
   * @private
   */
  private calculations = {
    // X+Y
    add: () => this.lines.push('D=M+D'),
    // X-Y
    sub: () => this.lines.push('D=M-D'),
  };
  private comparisons = {
    // X == Y ? -1 : 0
    eq: () => {
      
      this.lines.push('D=D-M');
      this.lines.push('D=D-M');
      
    },
    // X > Y ? -1 : 0
    gt: () => {},
    // X < Y ? -1 : 0
    lt: () => {}
  };
  
  // OPERANDS HAVE ALREADY BEEN PUSHED ONTO THE STACK!!!
  constructor(command: BinaryCalculationCommand | BinaryComparisonCommand) {
    super('push', ''); // dummy arguments! we just want access to all the helper commands.
    this.prepareStack();
    
    // perform the operation, storing the result in temp memory (D)
    // this.calculations[command as BinaryCalculationCommand]();
    
    const calculation = this.calculations[command as BinaryCalculationCommand];
    if (calculation) {
      calculation();
      return;
    }
    
    /* "push" result (stored in D) to stack */
    // replacing the value at the stack pointer
    // (the first operand) with the result of the operation.
    this.pushThe.storedValue.ontoStack();
  }
  
  private prepareStack() {
    // the operands are on the stack.
    // in VM parlance, they will be popped. However, PUSHING AND POPPING ARE AN ABSTRACTION
    // and don't actually exist! on the low level of our actual implementation, all we care
    // about is that the correct values are in the correct memory locations by the end, and
    // that the stack pointer is pointing to the "top of the stack". we don't care about any
    // leftover unused values. no need to "actually pop" (i.e. remove popped things)
    
    // after the push commands that prepare for these commands,
    // the SP points to one beyond the stored operands.
    // so, "reset" the pointer
    this.decrementStackPointer();
    
    /* store SECOND operand in D */
    this.storeThe.topStackValue();
    
    /* prep FIRST operand as M */
    this.decrementStackPointer();
    this.move.to.topOfStack();
  }
}
