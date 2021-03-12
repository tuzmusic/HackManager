import { CmdType, MemorySegment, memorySegments } from '../../shared';
import { PushPopCommand } from './PushPopCommand';

export class LocationCommand extends PushPopCommand {
  
  constructor(type: CmdType, private segment: MemorySegment, protected value: string) {
    super(type, value);
  
    // special case
    // if (segment === 'temp')
    //   this.value = (parseInt(value) + 5).toString();
  
    this[type]();
  }
  
  // write value at segment+offset to the top of the stack
  push = (): void => {
    // addr=segment+i
    this.moveToSegmentOffset();
    // *SP=*addr, SP++
    this.pushThe.valueAtCurrentAddress.ontoStack();
  };
  
  // pop the topmost stack item and store its value in segment[index].
  // <p>`addr=segment+i, SP--, *addr=*SP`
  pop = (): void => {
    // STORE DESIRED ADDRESS ON TOP OF STACK
    // get dest address
    this.move.to.variableOrValue(memorySegments[this.segment], `move to "${ this.segment }" pointer`); // @segment
    this.storeThe.memoryValue(`store the "${ this.segment }" base address`); // D=A
  
    const segmentIndex = Object.keys(memorySegments).indexOf(this.segment);
    const valInt = parseInt(this.value);
  ®
    // if value is 0, no offset is needed
    if (valInt) {
      // e.g., ARG = 2, so if value is 2, no @ is needed for adding the constant
      if ((segmentIndex + 1) !== valInt) {
        this.move.to.variableOrValue(this.value, 'move to address representing offset'); // @i
      }
    
      this.add.valueOfAddress.toStoredValue('D = base addr + offset'); // D=D+A
    }
  
    // write it to the stack
    this.pushThe.storedValue.ontoStack('>> write dest addr to top of stack (don\'t increment) <<');
    // we actually don't want to increment the stack pointer, so remove those lines
    // (they were added by the fn call above)
    this.lines.pop();
    this.lines.pop();
  
    // GET THE POPPED VALUE
    this.decrementStackPointer('>> move stack pointer back to the value to be popped <<');
    this.storeThe.topStackValue('>> store our value in D <<');
    
    // WRITE TO MEMORY SEGMENT
    this.incrementStackPointer('return to where the dest addr is written');
    this.move.using.currentMemoryValue.asAddress('move to where dest address is stored');
    this.move.using.currentMemoryValue.asAddress('move to actual dest address');
    this.writeThe.storedValue.toMemoryAtCurrentAddress('write our value to the dest address');
    this.decrementStackPointer('SP-- to "pop" the stack');
  };
  
  // `addr=seg+i (move to offset)`
  private moveToSegmentOffset = () => {
    const offset = this.value;
    this.move.to.variableOrValue(memorySegments[this.segment], `move to ${ this.segment }`); // @segment
    this.storeThe.memoryValue(`store the "${ this.segment }" base address`); // D=A
    this.move.to.variableOrValue(offset, 'move to address representing offset'); // @i
    this.add.valueOfAddress.toStoredValueAndMoveThere('new addr = base addr + offset'); // A=D+A
    // this.move.using.storedValue.asAddress(); // A=D
  };
}