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
    super('push', 0); // not used! dummy arguments! we just want access to all the helper commands.
    if (command === 'add') command = 'addOperation';
    
    // pop operands - store as variables
    this.popVariable(loc1);
    this.popVariable(loc2);
    
    // get and prepare to use the operands from memory
    this.move.to.variableOrValue(loc1); // @loc1
    this.store.memoryValue(); // D=M
    this.move.to.variableOrValue(loc2); // @loc2 (operation will use *loc2)
    
    this[command]();
    
    // push result (stored in D) to stack
    this.place.storedValue.ontoStack();
  }
  
  /**
   * @precondition: addends at top of stack
   * @postcondition: sum at top of stack; SP--
   */
  addOperation = () => {
    this.lines.push('D=M+D');
  };
  
  sub = () => {
  
  };
  
  eq = () => {
  
  };
  
  gt = () => {
  
  };
  
  lt = () => {
  
  };
}