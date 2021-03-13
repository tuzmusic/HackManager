	// COMMAND #1: push constant 3030
	@3030       
	D=A          // store the current address as a value
	@SP          // >> push constant value (3030) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #2: pop pointer 0
	@SP          // >> pop stack to THIS << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THIS       
	M=D          // write value of D to current location
	
	// COMMAND #3: push constant 3040
	@3040       
	D=A          // store the current address as a value
	@SP          // >> push constant value (3040) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #4: pop pointer 1
	@SP          // >> pop stack to THAT << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #5: push constant 32
	@32         
	D=A          // store the current address as a value
	@SP          // >> push constant value (32) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #6: pop this 2
	@THIS        // move to "this" pointer
	D=M          // store the "this" base address
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
	
	// COMMAND #7: push constant 46
	@46         
	D=A          // store the current address as a value
	@SP          // >> push constant value (46) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #8: pop that 6
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
	@6           // move to address representing offset
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
	
	// COMMAND #9: push pointer 0
	@THIS       
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #10: push pointer 1
	@THAT       
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #11: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #12: push this 2
	@THIS        // move to this
	D=M          // store the "this" base address
	@2           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #13: sub
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #14: push that 6
	@THAT        // move to that
	D=M          // store the "that" base address
	@6           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #15: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	