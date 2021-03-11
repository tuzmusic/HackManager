	// COMMAND #1: push constant 7
	@7          
	D=A          // store the current address as a value
	@SP          // >> push constant value (7) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #2: push constant 8
	@8          
	D=A          // store the current address as a value
	@SP          // >> push constant value (8) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #3: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	