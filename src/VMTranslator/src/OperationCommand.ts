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
export class OperationCommand extends Command {
  static comparisonCounter = 0;
  lines: string[] = [];
  done = false;
  /**
   * operate on top two values on the stack.
   * Y (*SP) stored in D
   * X (*[SP-1]) "prepped" as M.
   */
  private calculations = {
    // X+Y
    add: 'M=M+D',
    // X-Y
    sub: 'M=M-D',
    // X&Y
    and: 'M=D&M',
    // X|Y
    or: 'M=M|D',
  };
  /**
   * operate on the value at *SP.
   * X (*[SP-1]) "prepped" as M.
   */
  private unary = {
    // -X
    neg: 'M=-M',
    // !X
    not: 'M=!M',
  };
  /**
   * Compare the top two values on the stack
   * Y (*SP) stored in D
   * X (*[SP-1]) "prepped" as M.
   */
  private comparisons = {
    // X == Y ? -1 : 0
    eq: 'D;JEQ',
    // X > Y ? -1 : 0
    gt: 'D;JGT',
    // X < Y ? -1 : 0
    lt: 'D;JLT',
  };
  
  // OPERANDS HAVE ALREADY BEEN PUSHED ONTO THE STACK!!!
  constructor(private command: BinaryCalculationCommand | BinaryComparisonCommand | UnaryCalculationCommand) {
    super('push', ''); // dummy arguments! we just want access to all the helper commands.
  
    const [unary, calculation] = [this.unary[command as UnaryCalculationCommand],
      this.calculations[this.command as BinaryCalculationCommand]];
  
    if (!unary) this.prepareY(); // pop Y into D (SP--)
  
    this.prepareX(); // prep X for M; maintain SP
  
    // these commands write the result into the X position:
    if (unary) {
      // this.move.to.topOfStack()
      this.addLine(unary, `perform unary operation: ${ command }`);
    } else if (calculation) {
      // this.move.to.topOfStack()
      this.addLine(calculation, `perform binary operation: ${ command }`);
    } else {
      this.handleComparison(this.command as BinaryComparisonCommand);
    }
  
    // finish off the push
    this.incrementStackPointer();
  }
  
  private handleComparison(command: BinaryComparisonCommand) {
    const comparison = this.comparisons[command];
    const markerNum = `${ OperationCommand.comparisonCounter++ }`;
    const marker = (...parts: string[]): string => parts.concat(markerNum).join('_');
    
    const source = (label: string) => `@${ marker(label) }`;
    const dest = (label: string) => `(${ marker(label) })`;
  
    this.addLine('D=M-D', 'store X-Y in D for comparison');
    // prepare jump location
    this.addLine(source('IF_TRUE'));
  
    // set up the comparison (compare D to 0), which will jump if true
    this.addLine(comparison, `perform comparison: ${ command }`);
  
    // NOTE that all the @'s that manage the conditional jumps mean that we always
    // have to manually move to the top of the stack before we write to memory
  
    // TODO: Optimize
    //  Have a single if true/false spot, that uses memory locations and temp storage
    //  to manage where 0/-1 is written to, and where we jump back to at the end of the
    //  conditional.
  
    // if false, store 0 in D
    this.addLine(dest('IF_FALSE')); // not actually used, but a helpful road sign
    this.writeThe.valueProvided.toTopOfStack.withoutIncrementingStackPointer('0');
    this.addLine(source('END_IF'));
    this.addLine('0;JMP');
  
    // add the marker for true
    this.addLine(dest('IF_TRUE'));
    this.writeThe.valueProvided.toTopOfStack.withoutIncrementingStackPointer('-1');
    
    // marker for endif
    this.addLine(dest('END_IF'));
  }
  
  /* prep X as M */
  private prepareX() {
    this.decrementStackPointer('"pop" X');
    this.move.to.topOfStack('PREPARE X (prep X "into" M – but don\'t pop just yet!)');
  }
  
  /* store Y in D */
  private prepareY() {
    // after the push commands that prepare for these commands,
    // the SP points to one beyond the stored operands.
    // so, "reset" the pointer to point to Y
    this.decrementStackPointer('pop back to Y, since binary op starts at 1 past Y');
    this.storeThe.topStackValue('PREPARE Y (pop Y into D)');
  }
}
