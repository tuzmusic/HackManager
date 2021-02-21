import { CmdType } from './shared';

export default class Command {
  protected lines: string[] = [];
  
  constructor(private type: CmdType, protected value: string) {}
  
  public getLines = () => [...this.lines];
  
  protected addLine = (line: string, comment?: string) => this.lines.push(line.padEnd(12) + (comment ? `// ${ comment }` : ''));
  
  protected move = {
    to: {
      // "@SP"
      stackPointer: (comment = 'move to stack pointer') => this.addLine('@SP', comment),
      // "@i"
      variableOrValue: (v: string | number, comment = '') => this.addLine(`@${ v }`, comment),
      topOfStack: (comment = 'MOVE TO TOP OF STACK') => {
        // often we'll move after popping, so we're already at SP
        if (this.lines.length > 1 && this.lines[this.lines.length - 1].startsWith('M=M-1')) {
          this.move.using.currentMemoryValue.asAddress(comment);
        } else {
          this.move.to.stackPointer(comment);
          this.move.using.currentMemoryValue.asAddress();
        }
      }
    },
    using: {
      storedValue: {
        // A=D
        asAddress: (comment = '') => this.addLine('A=D', comment)
      },
      currentMemoryValue: {
        // A=M;
        // mainly used after moving to stack pointer, to move to top of stack
        asAddress: (comment = 'move to top of stack') => this.addLine('A=M', comment)
      },
    }
  };
  protected writeThe = {
    storedValue: {
      // M=D
      toMemoryAtCurrentAddress: (comment = 'write value of D to current location') => this.addLine('M=D', comment)
    }, valueProvided: {
      // M=D
      toMemoryAtCurrentAddress: (value: string, comment = '') =>
        this.addLine('M=' + value, comment),
      toTopOfStack: {
        // used, for example, in OperationCommand, when the if chain ends by
        // incrementing the stack pointer after all types of operations
        withoutIncrementingStackPointer: (value: string, comment = '') => {
          this.move.to.topOfStack(comment);
          this.writeThe.valueProvided.toMemoryAtCurrentAddress(value); // M=value
        }
      }
    }
  };
  protected storeThe = {
    // D=M
    memoryValue: (comment = 'store current memory value in D') => this.addLine('D=M', comment),
    // D=i
    constantValue: (val: string) => {
      this.move.to.variableOrValue(val);
      this.storeThe.currentAddress();
    },
    // D=A
    currentAddress: (comment = 'store the current address as a value') =>
      this.addLine('D=A', comment),
    // implements "D = *SP"
    topStackValue: (comment = '') => {
      this.move.to.topOfStack(comment);
      this.storeThe.memoryValue('store the top stack value into D');
    }
  };
  
  protected push = (): void => { throw Error('not implemented'); };
  
  protected pop = (): void => { throw Error('not implemented'); };
  
  // *SP=*i
  protected readonly pushVariable = (variable: string) => {
    this.move.to.variableOrValue(variable);
    this.storeThe.memoryValue();
    this.incrementStackPointer();
  };
  
  // *i=*SP
  protected readonly popVariable = (variable: string) => {
    this.storeThe.topStackValue();
    this.move.to.variableOrValue(variable);
    this.writeThe.storedValue.toMemoryAtCurrentAddress();
    this.decrementStackPointer();
  };
  
  // "@SP, M=M+1"
  protected incrementStackPointer = (comment = 'increment stack pointer') => {
    this.move.to.stackPointer(comment);
    this.addLine('M=M+1',); // increment the value at the stack pointer
  };
  
  protected pushThe = {
    storedValue: {
      // "\*SP=*addr"
      ontoStack: (comment = 'PUSH TEMP VALUE TO TOP OF STACK') => {
        this.move.to.topOfStack(comment);
        this.writeThe.storedValue.toMemoryAtCurrentAddress(); // write stored value to top of stack
        this.incrementStackPointer();
      }
    },
    valueAtCurrentAddress: {
      // "@SP, M=M+1"
      ontoStack: (comment = 'PUSH MEMORY VALUE TO TOP OF STACK') => {
        this.storeThe.memoryValue(); // D=M
        this.move.to.topOfStack(comment);
        this.writeThe.storedValue.toMemoryAtCurrentAddress(); // M=D
        this.incrementStackPointer();
      }
    },
    valueProvided: {
      ontoStack: (value: string, comment = `PUSH "${ value } TO TOP OF STACK"`) => {
        this.move.to.topOfStack(comment);
        this.writeThe.valueProvided.toMemoryAtCurrentAddress(value); // M=value
        this.incrementStackPointer();
      }
    }
  };
  
  // "@SP; M=M-1"
  protected decrementStackPointer = (comment = 'decrement stack pointer') => {
    this.move.to.stackPointer(comment);
    this.addLine('M=M-1'); // decrement the value at the stack pointer
  };
}
