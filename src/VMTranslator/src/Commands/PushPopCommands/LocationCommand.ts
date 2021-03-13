import { CmdType, MemorySegment, memorySegments } from '../../shared';
import { PushPopCommand } from './PushPopCommand';

export class LocationCommand extends PushPopCommand {
  constructor(type: CmdType, private segment: MemorySegment, protected value: string) {
    super(type, value);
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
    // get destination address, write it to a temp variable
    this.storeSegmentOffsetAddress();
    this.writeThe.storedValue.toLocationProvided('OFFSET');
  
    // GET THE POPPED VALUE
    this.popStack.toAddressStoredAsVariable('OFFSET');
  };
  
  private storeSegmentOffsetAddress = () => {
    // STORE DESIRED ADDRESS ON TOP OF STACK
    // get dest address
    this.move.to.variableOrValue(memorySegments[this.segment], `move to "${ this.segment }" pointer`); // @segment
    this.storeThe.memoryValue(`store the "${ this.segment }" base address`); // D=A
    
    const segmentIndex = Object.keys(memorySegments).indexOf(this.segment);
    const valInt = parseInt(this.value);
    
    // if value is 0, no offset is needed
    if (valInt) {
      // e.g., ARG = 2, so if value is 2, no @ is needed for adding the constant
      if ((segmentIndex + 1) !== valInt) {
        this.move.to.variableOrValue(this.value, 'move to address representing offset'); // @i
      }
      
      this.add.valueOfAddress.toStoredValue('D = base addr + offset'); // D=D+A
    }
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