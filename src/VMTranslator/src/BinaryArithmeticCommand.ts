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
   * operate on top two values on the stack.
   * Y (*SP) stored in D
   * X (*[SP-1]) "prepped" as M.
   */
  private calculations = {
    // X+Y
    add: () => this.lines.push('D=M+D'),
    // X-Y
    sub: () => this.lines.push('D=M-D'),
  };
  /**
   * Compare the top two values on the stack
   * Y (*SP) stored in D
   * X (*[SP-1]) "prepped" as M.
   */
  private comparisons = {
    // X == Y ? -1 : 0
    eq: () => this.lines.push('D;JEQ'),
    // X > Y ? -1 : 0
    gt: () => this.lines.push('D;JGT'),
    // X < Y ? -1 : 0
    lt: () => this.lines.push('D;JLT'),
  };
  
  // OPERANDS HAVE ALREADY BEEN PUSHED ONTO THE STACK!!!
  constructor(command: BinaryCalculationCommand | BinaryComparisonCommand) {
    super('push', ''); // dummy arguments! we just want access to all the helper commands.
    this.prepareStack();
    
    const calculation = this.calculations[command as BinaryCalculationCommand];
  
    if (calculation) {
      // perform the operation, storing the result in temp memory (D)
      // this.calculations[command as BinaryCalculationCommand]();
      calculation();
    } else {
      this.handleComparison(command as BinaryComparisonCommand);
    }
  
    /* "push" result (stored in D) to stack */
    // replacing the value at the stack pointer
    // (the first operand) with the result of the operation.
    this.pushThe.storedValue.ontoStack();
  }
  
  private handleComparison(command: BinaryComparisonCommand) {
    const trueMarker = `TRUE_${ Math.random() }`;
    
    // store X-Y in D for comparison
    this.calculations.sub();
    // prepare jump location
    this.lines.push(`@${ trueMarker }`);
    // set up the comparison, which will jump if true
    this.comparisons[command]();
    
    // if false, store 0 in D
    this.lines.push('D=0');
    
    // add the marker
    this.lines.push(`(${ trueMarker })`);
    this.lines.push('D=-1');
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
    
    // now we're pointing to the popped location
    // which is where we'll need to write the result
  }
}
