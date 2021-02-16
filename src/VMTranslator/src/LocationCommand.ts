import Command from './Command';
import { CmdType, MemorySegment } from './shared';

export class LocationCommand extends Command {
  constructor(type: CmdType, private segment: MemorySegment, value: string) {
    super(type, value);
    this[type]();
  }
  
  // for performing stack arithmetic
  private add = {
    valueOfAddress: {
      // D=D+A
      toStoredValue: () => this.lines.push('D=D+A')
    },
    storedValue: {
      // M=M+D
      toMemoryValue: () => this.lines.push('M=M+D')
    }
  };
  
  // write value at segment+offset to the top of the stack
  push = (): void => {
    // addr=segment+i
    this.moveToSegmentOffset();
    // *SP=*addr
    this.pushThe.valueAtCurrentAddress.ontoStack();
    // SP++
    this.incrementStackPointer();
  };
  
  // `addr=LCL+i, *SP=*addr, SP++`
  
  // addr=seg+i (move to offset)
  private moveToSegmentOffset = () => {
    const offset = this.value;
    this.move.to.variableOrValue(this.segment); // @segment
    this.storeThe.currentAddress(); // D=A
    this.move.to.variableOrValue(offset); // @i
    this.add.valueOfAddress.toStoredValue(); // D=D+A
    this.move.using.storedValue.asAddress(); // A=D
  };
}