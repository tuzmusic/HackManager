import Command from './Command';

export type UnaryCalculationCommand = 'neg' | 'not'
export type BinaryCalculationCommand =
  | 'add'
  | 'sub'
  | 'and'
  | 'or'
export type BinaryComparisonCommand =
  | 'eq'
  | 'gt'
  | 'lt'

// Stack-based arithmetic is a simple matter: the two top elements are popped
// from the stack, the required operation is performed on them, and the result
// is pushed back onto the stack.
export class BinaryArithmeticCommand extends Command {
  lines: string[] = [];
  done = false;
  /**
   * operate on top two values on the stack.
   * Y (*SP) stored in D
   * X (*[SP-1]) "prepped" as M.
   */
  private calculations = {
    // X+Y
    add: () => this.lines.push('M=M+D'),
    // X-Y
    sub: () => this.lines.push('M=M-D'),
    // X&Y
    and: () => this.lines.push('M=M&D'),
    // X|Y
    or: () => this.lines.push('M=M|D'),
  };
  
  /**
   * operate on the value at *SP.
   * X (*[SP-1]) "prepped" as M.
   */
  private unary = {
    // -X
    neg: () => this.lines.push('D=-M'),
    // !X
    not: () => this.lines.push('D=!M')
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
  constructor(private command: BinaryCalculationCommand | BinaryComparisonCommand) {
    super('push', ''); // dummy arguments! we just want access to all the helper commands.
    
    const unary = this.unary[command as UnaryCalculationCommand];
    
    if (!unary) this.prepareY();
    
    this.prepareX();
    
    if (unary)
      unary();
    
    else {
      const calculation = this.calculations[this.command as BinaryCalculationCommand];
      
      // perform the operation, storing the result in temp memory (D)
      if (calculation)
        calculation();
      else
        this.handleComparison(this.command as BinaryComparisonCommand);
      
    }
    
    /* "push" result (stored in D) to stack */
    // replacing the value at the stack pointer
    // (the first operand) with the result of the operation.
    // this.pushThe.storedValue.ontoStack();
    this.incrementStackPointer();
    
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
  
  /* prep X as M */
  private prepareX() {
    // if unary, SP is at one past X
    // if binary, prepareY has moved SP to Y which is also one past X
    this.decrementStackPointer();
    this.move.to.topOfStack();
  }
  
  /* store Y in D */
  private prepareY() {
    // after the push commands that prepare for these commands,
    // the SP points to one beyond the stored operands.
    // so, "reset" the pointer to point to Y
    this.decrementStackPointer();
    this.storeThe.topStackValue();
  }
}
