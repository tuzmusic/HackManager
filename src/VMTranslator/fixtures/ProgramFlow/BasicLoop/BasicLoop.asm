	// COMMAND #1: push constant 0
	@0          
	D=A          // store the current address as a value
	@SP          // >> push constant value (0) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #2: pop local 0
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
	@OFFSET      // write value of D to "OFFSET"
	M=D          // write value of D to current location
	@SP          // >> pop stack to *OFFSET <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@OFFSET     
	A=M          // move to "OFFSET"
	M=D          // write value of D to current location
	
(LOOP_START.VM)	// COMMAND #3: label LOOP_START
	
	// COMMAND #4: push argument 0
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
	
	// COMMAND #5: push local 0
	@LCL         // move to local
	D=M          // store the "local" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #6: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #7: pop local 0
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
	@OFFSET      // write value of D to "OFFSET"
	M=D          // write value of D to current location
	@SP          // >> pop stack to *OFFSET <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@OFFSET     
	A=M          // move to "OFFSET"
	M=D          // write value of D to current location
	
	// COMMAND #8: push argument 0
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
	
	// COMMAND #9: push constant 1
	@1          
	D=A          // store the current address as a value
	@SP          // >> push constant value (1) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #10: sub
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #11: pop argument 0
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
	
	// COMMAND #12: push argument 0
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #13: if-goto LOOP_START
	@SP          // save top stack value in D (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@LOOP_START.VM
	D;JNE       
	
	// COMMAND #14: push local 0
	@LCL         // move to local
	D=M          // store the "local" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	