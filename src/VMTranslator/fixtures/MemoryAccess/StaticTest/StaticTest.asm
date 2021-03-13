	// COMMAND #1: push constant 111
	@111        
	D=A          // store the current address as a value
	@SP          // >> push constant value (111) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #2: push constant 333
	@333        
	D=A          // store the current address as a value
	@SP          // >> push constant value (333) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #3: push constant 888
	@888        
	D=A          // store the current address as a value
	@SP          // >> push constant value (888) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #4: pop static 8
	@SP          // >> pop stack to StaticTest.8 << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@StaticTest.8
	M=D          // write value of D to current location
	
	// COMMAND #5: pop static 3
	@SP          // >> pop stack to StaticTest.3 <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@StaticTest.3
	M=D          // write value of D to current location
	
	// COMMAND #6: pop static 1
	@SP          // >> pop stack to StaticTest.1 <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@StaticTest.1
	M=D          // write value of D to current location
	
	// COMMAND #7: push static 3
	@StaticTest.3
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #8: push static 1
	@StaticTest.1
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
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
	
	// COMMAND #10: push static 8
	@StaticTest.8
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
	