import { CmdType } from './shared';

export default class Command {
  protected lines: string[] = [];
  add = {
    valueOfAddress: {
      // D=D+A
      toStoredValue: () => this.lines.push('D=D+A')
    },
    storedValue: {
      // M=M+D
      toMemoryValue: () => this.lines.push('M=M+D')
    }
  };
  protected move = {
    to: {
      // "@SP"
      stackPointer: () => this.lines.push('@SP'),
      // "@i"
      variableOrValue: (v: string | number) => this.lines.push(`@${ v }`),
    },
    using: {
      storedValue: {
        // A=D
        asAddress: () => this.lines.push('A=D')
      },
      currentMemoryValue: {
        // A=M;
        // mainly used after moving to stack pointer, to move to top of stack
        asAddress: () => this.lines.push('A=M')
      },
    }
  };
  protected write = {
    storedValue: {
      // M=D
      toMemoryAtCurrentAddress: () => this.lines.push('M=D')
    }
  };
  protected store = {
    // D=M
    memoryValue: () => this.lines.push('D=M'),
    // D=i
    constantValue: (val: number) => {
      this.move.to.variableOrValue(val);
      this.store.currentAddress();
    },
    // D=A
    currentAddress: () => this.lines.push('D=A'),
    // D = *SP
    topStackValue: () => {
      this.move.to.stackPointer();
      this.move.using.currentMemoryValue.asAddress();
      this.store.memoryValue();
    }
  };
  protected place = {
    storedValue: {
      // "*SP=*addr"
      ontoStack: () => {
        this.move.to.stackPointer();
        this.move.using.currentMemoryValue.asAddress(); // move to the value stored in the stack pointer (top of stack)
        this.write.storedValue.toMemoryAtCurrentAddress(); // write stored value to top of stack
      }
    },
    valueAtCurrentAddress: {
      // "@SP, M=M+1"
      ontoStack: () => {
        this.store.memoryValue(); // D=M
        this.move.to.stackPointer(); // @SP
        this.move.using.currentMemoryValue.asAddress(); // A=M
        this.write.storedValue.toMemoryAtCurrentAddress(); // M=D
      }
    },
  };
  
  constructor(private type: CmdType, protected value: number) {}
  
  public getLines = () => [...this.lines];
  
  protected push = (): void => { throw Error('not implemented'); };
  
  protected pop = (): void => { throw Error('not implemented'); };
  
  // *SP=*i
  protected readonly pushVariable = (variable: string) => {
    this.move.to.variableOrValue(variable);
    this.store.memoryValue();
    this.incrementStack();
  };
  
  // *i=*SP
  protected readonly popVariable = (variable: string) => {
    this.store.topStackValue();
    this.move.to.variableOrValue(variable);
    this.write.storedValue.toMemoryAtCurrentAddress();
    this.decrementStack();
  };
  
  // "@SP, M=M+1"
  protected incrementStack = () => {
    this.move.to.stackPointer();
    this.lines.push('M=M+1'); // increment the value at the stack pointer
  };
  
  // "@SP; M=M-1"
  protected decrementStack = () => {
    this.move.to.stackPointer();
    this.lines.push('M=M-1'); // decrement the value at the stack pointer
  };
}
