import Command from './Command';
import { CmdType, MemorySegment } from './shared';

export default class LocationCommand extends Command {
  constructor(private segment: MemorySegment, type: CmdType, value: number) {
    super(type, value);
    this[type]();
  }
  
  // write value at segment+offset to the top of the stack
  push = (): void => {
    // addr=segment+i
    this.moveToSegmentOffset();
    // *SP=*addr
    this.placeValueAtAddressOnStack();
    // SP++
    this.incrementStack();
  };
  
  // `addr=LCL+i, *SP=*addr, SP++`
  
  // addr=seg+i (move to offset)
  private moveToSegmentOffset = () => {
    const offset = this.value;
    this.moveTo(this.segment); // @segment
    this.storeCurrentAddress(); // D=A
    this.moveTo(offset); // @i
    this.addValueOfAddressToStoredValue(); // D=D+A
    this.moveUsingStoredValueAsAddress(); // A=D
  };
}