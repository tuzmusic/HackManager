	// COMMAND #1: push argument 1
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #2: pop pointer 1
	@SP          // >> pop stack to THAT << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #3: push constant 0
	@0          
	D=A          // store the current address as a value
	@SP          // >> push constant value (0) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #4: pop that 0
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
	@OFFSET      // write value of D to "OFFSET"
	M=D          // write value of D to current location
	@SP          // >> pop stack to *OFFSET <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@OFFSET     
	A=M          // move to "OFFSET"
	M=D          // write value of D to current location
	
	// COMMAND #5: push constant 1
	@1          
	D=A          // store the current address as a value
	@SP          // >> push constant value (1) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #6: pop that 1
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
	@1           // move to address representing offset
	D=D+A        // D = base addr + offset
	@OFFSET      // write value of D to "OFFSET"
	M=D          // write value of D to current location
	@SP          // >> pop stack to *OFFSET <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@OFFSET     
	A=M          // move to "OFFSET"
	M=D          // write value of D to current location
	
	// COMMAND #7: push argument 0
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #8: push constant 2
	@2          
	D=A          // store the current address as a value
	@SP          // >> push constant value (2) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #9: sub
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #10: pop argument 0
	@ARG         // move to "argument" pointer
	D=M          // store the "argument" base address
	@OFFSET      // write value of D to "OFFSET"
	M=D          // write value of D to current location
	@SP          // >> pop stack to *OFFSET <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@OFFSET     
	A=M          // move to "OFFSET"
	M=D          // write value of D to current location
	
(MAIN_LOOP_START.VM)	// COMMAND #11: label MAIN_LOOP_START
	
	// COMMAND #12: push argument 0
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #13: if-goto COMPUTE_ELEMENT
	@SP          // save top stack value in D (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@COMPUTE_ELEMENT.VM
	D;JNE       
	
	// COMMAND #14: goto END_PROGRAM
	@END_PROGRAM.VM
	0;JMP       
	
(COMPUTE_ELEMENT.VM)	// COMMAND #15: label COMPUTE_ELEMENT
	
	// COMMAND #16: push that 0
	@THAT        // move to that
	D=M          // store the "that" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #17: push that 1
	@THAT        // move to that
	D=M          // store the "that" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #18: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #19: pop that 2
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
	@2           // move to address representing offset
	D=D+A        // D = base addr + offset
	@OFFSET      // write value of D to "OFFSET"
	M=D          // write value of D to current location
	@SP          // >> pop stack to *OFFSET <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@OFFSET     
	A=M          // move to "OFFSET"
	M=D          // write value of D to current location
	
	// COMMAND #20: push pointer 1
	@THAT       
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #21: push constant 1
	@1          
	D=A          // store the current address as a value
	@SP          // >> push constant value (1) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #22: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	
	// COMMAND #23: pop pointer 1
	@SP          // >> pop stack to THAT << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #24: push argument 0
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #25: push constant 1
	@1          
	D=A          // store the current address as a value
	@SP          // >> push constant value (1) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #26: sub
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #27: pop argument 0
	@ARG         // move to "argument" pointer
	D=M          // store the "argument" base address
	@OFFSET      // write value of D to "OFFSET"
	M=D          // write value of D to current location
	@SP          // >> pop stack to *OFFSET <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@OFFSET     
	A=M          // move to "OFFSET"
	M=D          // write value of D to current location
	
	// COMMAND #28: goto MAIN_LOOP_START
	@MAIN_LOOP_START.VM
	0;JMP       
	
(END_PROGRAM.VM)	// COMMAND #29: label END_PROGRAM
	