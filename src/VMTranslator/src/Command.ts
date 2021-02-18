import { CmdType } from './shared';

export default class Command {
  protected lines: string[] = [];
  
  constructor(private type: CmdType, protected value: string) {}
  
  public getLines = () => [...this.lines];
  
  protected addLine = (line: string, comment?: string) => this.lines.push(line + (comment ? `    // ${ comment }` : ''));
  
  protected move = {
    to: {
      // "@SP"
      stackPointer: (comment = '') => this.addLine('@SP', comment),
      // "@i"
      variableOrValue: (v: string | number) => this.addLine(`@${ v }`),
      topOfStack: (comment = '') => {
        this.move.to.stackPointer(comment || 'MOVE TO TOP OF STACK');
        this.move.using.currentMemoryValue.asAddress();
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
        asAddress: (comment = '') => this.addLine('A=M', comment)
      },
    }
  };
  protected writeThe = {
    storedValue: {
      // M=D
      toMemoryAtCurrentAddress: (comment = '') => this.addLine('M=D')
    }
  };
  protected storeThe = {
    // D=M
    memoryValue: (comment = '') => this.addLine('D=M', comment),
    // D=i
    constantValue: (val: string) => {
      this.move.to.variableOrValue(val);
      this.storeThe.currentAddress();
    },
    // D=A
    currentAddress: () => this.addLine('D=A', 'store the current address as a value'),
    // implements "D = *SP"
    topStackValue: (comment = '') => {
      this.move.to.topOfStack(comment || 'STORE THE TOP STACK VALUE INTO D');
      this.storeThe.memoryValue();
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
  protected incrementStackPointer = () => {
    this.move.to.stackPointer();
    this.addLine('M=M+1', 'increment stack pointer'); // increment the value at the stack pointer
  };
  
  protected pushThe = {
    storedValue: {
      // "\*SP=*addr"
      ontoStack: () => {
        this.move.to.topOfStack('PUSH TEMP VALUE TO TOP OF STACK');
        this.writeThe.storedValue.toMemoryAtCurrentAddress(); // write stored value to top of stack
        this.incrementStackPointer();
      }
    },
    valueAtCurrentAddress: {
      // "@SP, M=M+1"
      ontoStack: () => {
        this.storeThe.memoryValue(); // D=M
        this.move.to.topOfStack('PUSH MEMORY VALUE TO TOP OF STACK');
        this.writeThe.storedValue.toMemoryAtCurrentAddress(); // M=D
        this.incrementStackPointer();
      }
    },
  };
  
  // "@SP; M=M-1"
  protected decrementStackPointer = () => {
    this.move.to.stackPointer();
    this.addLine('M=M-1', 'decrement stack pointer'); // decrement the value at the stack pointer
  };
}
