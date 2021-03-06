import VMCommand from './VMCommand';
import TranslatorParser from '../TranslatorParser';

/**
 * operate on top two values on the stack.
 * Y (*SP) stored in D
 * X (*[SP-1]) "prepped" as M.
 */
const calculations = {
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
const unaries = {
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
const comparisons = {
  // X == Y ? -1 : 0
  eq: 'D;JEQ',
  // X > Y ? -1 : 0
  gt: 'D;JGT',
  // X < Y ? -1 : 0
  lt: 'D;JLT',
};

export type UnaryCalculationCommand = keyof typeof unaries
export type BinaryCalculationCommand = keyof typeof calculations
export type BinaryComparisonCommand = keyof typeof comparisons

export type OperationCmd = BinaryCalculationCommand | BinaryComparisonCommand | UnaryCalculationCommand;

export class OperationCommand extends VMCommand {
  lines: string[] = [];
  
  // OPERANDS HAVE ALREADY BEEN PUSHED ONTO THE STACK!!!
  constructor(private cmd: OperationCmd) {
    super();
    
    const [unary, calculation] = [unaries[cmd as UnaryCalculationCommand],
      calculations[this.cmd as BinaryCalculationCommand]];
    
    if (!unary) this.prepareY(); // pop Y into D (SP--)
    
    this.prepareX(); // prep X for M; maintain SP
    
    // these commands write the result into the X position:
    if (unary) {
      this.addLine(unary, `perform unary operation: ${ cmd }`);
    } else if (calculation) {
      this.addLine(calculation, `perform binary operation: ${ cmd }`);
    } else {
      this.handleComparison(this.cmd as BinaryComparisonCommand);
    }
    
    // finish off the push
    this.incrementStackPointer();
  }
  
  private handleComparison(command: BinaryComparisonCommand) {
    const comparison = comparisons[command];
    const markerNum = `${ TranslatorParser.ifBoolCounter++ }`;
    const marker = (...parts: string[]): string => parts.concat(markerNum).join('_');
  
    this.addLine('D=M-D', 'store X-Y in D for comparison');
    // prepare jump location
    this.addJumpDestination(marker('IF_TRUE'));
  
    // set up the comparison (compare D to 0), which will jump if true
    this.addLine(comparison, `perform comparison: ${ command }`);
  
    // NOTE that all the @'s that manage the conditional jumps mean that we always
    // have to manually move to the top of the stack before we write to memory
  
    // TODO: Optimize
    //  Have a single if true/false spot, that uses memory locations and temp storage
    //  to manage where 0/-1 is written to, and where we jump back to at the end of the
    //  conditional.
  
    // if false, store 0 in D
    this.addLabel(marker('IF_FALSE')); // not actually used, but a helpful road sig)n
    this.writeThe.valueProvided.toTopOfStack.withoutIncrementingStackPointer('0');
    this.jumpUnconditionallyTo(marker('END_IF'));
    // this.addLine('0;JMP');
  
    // add the marker for true
    this.addLabel(marker('IF_TRUE'));
    this.writeThe.valueProvided.toTopOfStack.withoutIncrementingStackPointer('-1');
  
    // marker for endif
    this.addLabel(marker('END_IF'));
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
