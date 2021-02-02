import { CmdType } from './shared';

export default class Command {
  protected lines: string[] = [];
  
  constructor(private type: CmdType, protected value: number) {}
  
  public getLines = () => [...this.lines];
  
  push = (): void => { throw Error('not implemented'); };
  pop = (): void => { throw Error('not implemented'); };
  
  // *SP=*i
  protected readonly pushVariable = (variable: string) => {
    this.moveTo(variable);
    this.storeMemoryValue();
    this.incrementStack();
  };
  
  protected storeTopStackValue = () => {
    this.moveToStackPointer();
    this.moveUsingCurrentMemoryValueAsAddress();
    this.storeMemoryValue();
  };
  
  protected readonly popVariable = (variable: string) => {
    this.storeTopStackValue();
    this.moveTo(variable);
    this.writeStoredValueToCurrentMemory();
    this.decrementStack();
  };
  
  // D=M
  protected storeMemoryValue = () => this.lines.push('D=M');
  
  // D=i
  protected storeConstantValue = (val: number) => {
    this.moveTo(val);
    this.storeCurrentAddress();
  };
  
  // D=D+A
  protected addValueOfAddressToStoredValue = () => this.lines.push('D=D+A');
  
  // D=A
  protected storeCurrentAddress = () => this.lines.push('D=A');
  
  // M=M+D
  protected addStoredValueToMemoryValue = () => this.lines.push('M=M+D');
  
  // "@SP"
  protected moveToStackPointer = () => this.lines.push('@SP');
  // "@i"
  protected moveTo = (variableOrValue: string | number) => this.lines.push(`@${ variableOrValue }`);
  
  // *SP=D
  protected placeStoredValueOnStack = () => {
    this.moveToStackPointer();
    this.moveUsingCurrentMemoryValueAsAddress(); // move to the value stored in the stack pointer (top of stack)
    this.writeStoredValueToCurrentMemory(); // write stored value to top of stack
  };
  
  // *SP=*addr
  protected placeValueAtAddressOnStack = () => {
    this.storeMemoryValue(); // D=M
    this.moveToStackPointer(); // @SP
    this.moveUsingCurrentMemoryValueAsAddress(); // A=M
    this.writeStoredValueToCurrentMemory(); // M=D
  };
  
  // "@SP, M=M+1"
  protected incrementStack = () => {
    this.moveToStackPointer();
    this.lines.push('M=M+1'); // increment the value at the stack pointer
  };
  
  // "@SP; M=M-1"
  protected decrementStack = () => {
    this.moveToStackPointer();
    this.lines.push('M=M-1'); // decrement the value at the stack pointer
  };
  
  // A=M
  
  // A=D
  protected moveUsingStoredValueAsAddress = () => this.lines.push('A=D');
  
  // mainly used after moving to stack pointer, to move to top of stack
  private moveUsingCurrentMemoryValueAsAddress = () => this.lines.push('A=M');
  
  // M=D
  private writeStoredValueToCurrentMemory = () => this.lines.push('M=D');
  
}
