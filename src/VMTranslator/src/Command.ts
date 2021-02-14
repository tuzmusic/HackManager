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
      topOfStack: () => {
        this.move.to.stackPointer();
        this.move.using.currentMemoryValue.asAddress();
      }
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
    constantValue: (val: string) => {
      this.move.to.variableOrValue(val);
      this.store.currentAddress();
    },
    // D=A
    currentAddress: () => this.lines.push('D=A'),
    // implements "D = *SP"
    topStackValue: () => {
      this.move.to.topOfStack();
      this.store.memoryValue();
    }
  };
  protected place = {
    storedValue: {
      // "\*SP=*addr"
      ontoStack: () => {
        this.move.to.topOfStack();
        this.write.storedValue.toMemoryAtCurrentAddress(); // write stored value to top of stack
      }
    },
    valueAtCurrentAddress: {
      // "@SP, M=M+1"
      ontoStack: () => {
        this.store.memoryValue(); // D=M
        this.move.to.topOfStack();
        this.write.storedValue.toMemoryAtCurrentAddress(); // M=D
      }
    },
  };
  
  constructor(private type: CmdType, protected value: string) {}
  
  public getLines = () => [...this.lines];
  
  protected push = (): void => { throw Error('not implemented'); };
  
  protected pop = (): void => { throw Error('not implemented'); };
  
  // *SP=*i
  protected readonly pushVariable = (variable: string) => {
    this.move.to.variableOrValue(variable);
    this.store.memoryValue();
    this.incrementStackPointer();
  };
  
  // *i=*SP
  protected readonly popVariable = (variable: string) => {
    this.store.topStackValue();
    this.move.to.variableOrValue(variable);
    this.write.storedValue.toMemoryAtCurrentAddress();
    this.decrementStackPointer();
  };
  
  // "@SP, M=M+1"
  protected incrementStackPointer = () => {
    this.move.to.stackPointer();
    this.lines.push('M=M+1'); // increment the value at the stack pointer
  };
  
  // "@SP; M=M-1"
  protected decrementStackPointer = () => {
    this.move.to.stackPointer();
    this.lines.push('M=M-1'); // decrement the value at the stack pointer
  };
}
