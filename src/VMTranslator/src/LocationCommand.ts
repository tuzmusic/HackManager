import Command from './Command';
import { CmdType, MemorySegment } from './shared';

export class LocationCommand extends Command {
  constructor(type: CmdType, private segment: MemorySegment, value: string) {
    super(type, value);
    this[type]();
  }
  
  // write value at segment+offset to the top of the stack
  push = (): void => {
    // addr=segment+i
    this.moveToSegmentOffset();
    // *SP=*addr
    this.place.valueAtCurrentAddress.ontoStack();
    // SP++
    this.incrementStackPointer();
  };
  
  // `addr=LCL+i, *SP=*addr, SP++`
  
  // addr=seg+i (move to offset)
  private moveToSegmentOffset = () => {
    const offset = this.value;
    this.move.to.variableOrValue(this.segment); // @segment
    this.store.currentAddress(); // D=A
    this.move.to.variableOrValue(offset); // @i
    this.add.valueOfAddress.toStoredValue(); // D=D+A
    this.move.using.storedValue.asAddress(); // A=D
  };
}