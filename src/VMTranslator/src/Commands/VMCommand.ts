// Provides abstraction methods for adding assembly code to manipulate the stack.
export default class VMCommand {
  protected lines: string[] = [];
  
  public getLines = () => [...this.lines];
  
  protected addLine = (line: string, comment?: string) => this.lines.push(
    line.padEnd(12) + (comment ? ` // ${ comment }` : '')
  );
  
  // for performing stack arithmetic
  protected add = {
    valueOfAddress: {
      // A=D+A
      toStoredValueAndMoveThere: (comment = 'move to segment offset') => this.addLine('A=D+A', comment),
      // D=D+A
      toStoredValue: (comment = 'store address of segment offset') => this.addLine('D=D+A', comment)
    },
    storedValue: {
      // M=M+D
      toMemoryValue: (comment = '') => this.addLine('M=M+D', comment)
    }
  };
  
  /**
   * this function reproduces the functionality of a LabelCommand,
   * but is easier to use from inside another command.
   */
  protected addLabel = (label: string, comment = '') => this.addLine(`(${ label })`, comment);
  
  protected storeThe = {
    // D=M
    memoryValue: (comment = 'store current memory value in D') => this.addLine('D=M', comment),
    // D=i
    constantValue: (val: string, comment = '') => {
      this.move.to.variableOrValue(val, comment);
      this.storeThe.currentAddress();
    },
    // D=A
    currentAddress: (comment = 'store the current address as a value') =>
      this.addLine('D=A', comment),
    // implements "D = *SP"
    topStackValue: (comment = 'move to top of stack') => {
      this.move.to.topOfStack(comment);
      this.storeThe.memoryValue('store the top stack value into D');
    }
  };
  protected writeThe = {
    storedValue: {
      // M=D
      toMemoryAtCurrentAddress: (comment = 'write value of D to current location') => this.addLine('M=D', comment),
      toLocationProvided: (location: string, comment = `write value of D to "${ location }"`) => {
        this.move.to.variableOrValue(location, comment);
        this.writeThe.storedValue.toMemoryAtCurrentAddress();
      }
    },
    valueAtCurrentAddress: {
      toLocation: (location: string) => {
        this.storeThe.memoryValue('store current memory value');
        this.move.to.variableOrValue(location, `go to "${ location }"`);
        this.writeThe.storedValue.toMemoryAtCurrentAddress(`save the stored value in "${ location }"`);
      }
    },
    valueAtTopOfStack: {
      toAddress: (address: string) => {
        this.storeThe.topStackValue();
        this.move.to.variableOrValue(address);
        this.writeThe.storedValue.toMemoryAtCurrentAddress();
      },
      toAddressStoredAsVariable: (variable: string) => {
        this.storeThe.topStackValue(/*'>> store the top stack value in D <<'*/);
        this.move.to.variableOrValue(variable);
        this.move.using.currentMemoryValue.asAddress(`move to "${ variable }"`);
        this.writeThe.storedValue.toMemoryAtCurrentAddress();
      }
    },
    valueProvided: {
      // M=D
      toMemoryAtCurrentAddress: (value: string, comment = '') => {
        const valNum = parseInt(value);
        if (!isNaN(valNum) && (valNum < -1 || valNum > 1))
          throw Error(`You tried writing ${ valNum } but you can only write -1, 0, 1`);
        this.addLine('M=' + value, comment);
      },
      toTopOfStack: {
        // used, for example, in OperationCommand, when the if chain ends by
        // incrementing the stack pointer after all types of operations
        withoutIncrementingStackPointer: (value: string, comment = '') => {
          this.move.to.topOfStack(comment);
          this.writeThe.valueProvided.toMemoryAtCurrentAddress(value); // M=value
        }
      }
    }
  };
  protected popStack = {
    toAddressStoredAsVariable: (variable: string) => {
      this.decrementStackPointer(`>> pop stack to *${ variable } <<`);
      this.writeThe.valueAtTopOfStack.toAddressStoredAsVariable(variable);
    },
    toAddress: (address: string) => {
      this.decrementStackPointer(`>> pop stack to ${ address } <<`);
      this.writeThe.valueAtTopOfStack.toAddress(address);
    },
    toTempStorage: (comment = 'save top stack value in D') => {
      this.decrementStackPointer(comment);
      this.storeThe.topStackValue();
    }
  };
  
  // "@SP, M=M+1"
  protected incrementStackPointer = (comment = 'increment stack pointer') => {
    this.move.to.stackPointer(comment);
    this.addLine('M=M+1',); // increment the value at the stack pointer
  };
  
  protected addLinesFromCommand = (cmd: new (...args: any[]) => VMCommand, ...args: string[]) => {
    const lines = new cmd(...args).getLines();
    lines.forEach(line => this.addLine(line));
  };
  
  protected addJumpDestination = (label: string, comment = '') => this.addLine(`@${ label }`, comment);
  
  protected move = {
    to: {
      // "@SP"
      stackPointer: (comment = 'move to stack pointer') => this.addLine('@SP', comment),
      // "@i"
      variableOrValue: (v: string, comment = '') => this.addJumpDestination(v, comment),
      topOfStack: (comment = 'MOVE TO TOP OF STACK') => {
        // often we'll move after popping, so we're already at SP
        if (this.lines.length > 1 && this.lines[this.lines.length - 1].startsWith('M=M-1')) {
          this.move.using.currentMemoryValue.asAddress(comment);
        } else {
          this.move.to.stackPointer(comment);
          this.move.using.currentMemoryValue.asAddress();
        }
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
        asAddress: (comment = 'move to top of stack') => this.addLine('A=M', comment)
      },
    }
  };
  
  protected jumpUnconditionallyTo = (marker: string, comment = '') => {
    this.addJumpDestination(marker, comment);
    this.addLine('0;JMP');
  };
  
  // "@SP; M=M-1"
  protected decrementStackPointer = (comment = 'decrement stack pointer') => {
    this.move.to.stackPointer(comment);
    this.addLine('M=M-1'); // decrement the value at the stack pointer
  };
  protected pushThe = {
    storedValue: {
      // "\*SP=*addr"
      ontoStack: (comment = '> push stored value to top of stack') => {
        this.move.to.topOfStack(comment);
        this.writeThe.storedValue.toMemoryAtCurrentAddress(); // write stored value to top of stack
        this.incrementStackPointer();
      }
    },
    valueAtCurrentAddress: {
      // "@SP, M=M+1"
      ontoStack: (comment = '>>> push memory value to top of stack') => {
        this.storeThe.memoryValue(); // D=M
        this.pushThe.storedValue.ontoStack(comment);
      }
    },
    valueAtLocation: {
      // "@SP, M=M+1"
      ontoStack: (location: string, comment = '>>> push memory value to top of stack') => {
        this.move.to.variableOrValue(location);
        this.storeThe.memoryValue(); // D=M
        this.pushThe.storedValue.ontoStack(comment);
      }
    },
    valueProvided: {
      ontoStack: (value: string, comment = `>>> push "${ value }" to top of stack`) => {
        this.move.to.topOfStack(comment);
        this.writeThe.valueProvided.toMemoryAtCurrentAddress(value); // M=value
        this.incrementStackPointer();
      }
    }
  };
}
