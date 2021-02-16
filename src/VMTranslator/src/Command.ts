import { CmdType } from './shared';

export default class Command {
  protected lines: string[] = [];
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
  protected writeThe = {
    storedValue: {
      // M=D
      toMemoryAtCurrentAddress: () => this.lines.push('M=D')
    }
  };
  protected storeThe = {
    // D=M
    memoryValue: () => this.lines.push('D=M'),
    // D=i
    constantValue: (val: string) => {
      this.move.to.variableOrValue(val);
      this.storeThe.currentAddress();
    },
    // D=A
    currentAddress: () => this.lines.push('D=A'),
    // implements "D = *SP"
    topStackValue: () => {
      this.move.to.topOfStack();
      this.storeThe.memoryValue();
    }
  };
  protected pushThe = {
    storedValue: {
      // "\*SP=*addr"
      ontoStack: () => {
        this.move.to.topOfStack();
        this.writeThe.storedValue.toMemoryAtCurrentAddress(); // write stored value to top of stack
        this.incrementStackPointer();
      }
    },
    valueAtCurrentAddress: {
      // "@SP, M=M+1"
      ontoStack: () => {
        this.storeThe.memoryValue(); // D=M
        this.move.to.topOfStack();
        this.writeThe.storedValue.toMemoryAtCurrentAddress(); // M=D
        this.incrementStackPointer();
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
