	// COMMAND #85: push constant 10
	@10         
	D=A          // store the current address as a value
	@SP          // >> push constant value (10) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #86: pop local 0
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
	@0           // move to address representing offset
	D=D+A        // D = base addr + offset
	@SP          // >> store dest addr at stack+1 <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // move stack pointer back to the value to be popped
	M=M-1       
	A=M          // >> store our value in D <<
	D=M          // store the top stack value into D
	@SP          // return to where the dest addr is written
	M=M+1       
	A=M          // move to where dest address is stored
	A=M          // move to actual dest address
	M=D          // write our value to the dest address
	@SP          // SP-- to "pop" the stack
	M=M-1       
	
	// COMMAND #87: push constant 21
	@21         
	D=A          // store the current address as a value
	@SP          // >> push constant value (21) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #88: push constant 22
	@22         
	D=A          // store the current address as a value
	@SP          // >> push constant value (22) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #89: pop argument 2
	@ARG         // move to "argument" pointer
	D=M          // store the "argument" base address
	@2           // move to address representing offset
	D=D+A        // D = base addr + offset
	@SP          // >> store dest addr at stack+1 <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // move stack pointer back to the value to be popped
	M=M-1       
	A=M          // >> store our value in D <<
	D=M          // store the top stack value into D
	@SP          // return to where the dest addr is written
	M=M+1       
	A=M          // move to where dest address is stored
	A=M          // move to actual dest address
	M=D          // write our value to the dest address
	@SP          // SP-- to "pop" the stack
	M=M-1       
	
	// COMMAND #90: pop argument 1
	@ARG         // move to "argument" pointer
	D=M          // store the "argument" base address
	@1           // move to address representing offset
	D=D+A        // D = base addr + offset
	@SP          // >> store dest addr at stack+1 <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // move stack pointer back to the value to be popped
	M=M-1       
	A=M          // >> store our value in D <<
	D=M          // store the top stack value into D
	@SP          // return to where the dest addr is written
	M=M+1       
	A=M          // move to where dest address is stored
	A=M          // move to actual dest address
	M=D          // write our value to the dest address
	@SP          // SP-- to "pop" the stack
	M=M-1       
	
	// COMMAND #91: push constant 36
	@36         
	D=A          // store the current address as a value
	@SP          // >> push constant value (36) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #92: pop this 6
	@THIS        // move to "this" pointer
	D=M          // store the "this" base address
	@6           // move to address representing offset
	D=D+A        // D = base addr + offset
	@SP          // >> store dest addr at stack+1 <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // move stack pointer back to the value to be popped
	M=M-1       
	A=M          // >> store our value in D <<
	D=M          // store the top stack value into D
	@SP          // return to where the dest addr is written
	M=M+1       
	A=M          // move to where dest address is stored
	A=M          // move to actual dest address
	M=D          // write our value to the dest address
	@SP          // SP-- to "pop" the stack
	M=M-1       
	
	// COMMAND #93: push constant 42
	@42         
	D=A          // store the current address as a value
	@SP          // >> push constant value (42) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #94: push constant 45
	@45         
	D=A          // store the current address as a value
	@SP          // >> push constant value (45) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #95: pop that 5
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
	@5           // move to address representing offset
	D=D+A        // D = base addr + offset
	@SP          // >> store dest addr at stack+1 <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // move stack pointer back to the value to be popped
	M=M-1       
	A=M          // >> store our value in D <<
	D=M          // store the top stack value into D
	@SP          // return to where the dest addr is written
	M=M+1       
	A=M          // move to where dest address is stored
	A=M          // move to actual dest address
	M=D          // write our value to the dest address
	@SP          // SP-- to "pop" the stack
	M=M-1       
	
	// COMMAND #96: pop that 2
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
	@2           // move to address representing offset
	D=D+A        // D = base addr + offset
	@SP          // >> store dest addr at stack+1 <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // move stack pointer back to the value to be popped
	M=M-1       
	A=M          // >> store our value in D <<
	D=M          // store the top stack value into D
	@SP          // return to where the dest addr is written
	M=M+1       
	A=M          // move to where dest address is stored
	A=M          // move to actual dest address
	M=D          // write our value to the dest address
	@SP          // SP-- to "pop" the stack
	M=M-1       
	
	// COMMAND #97: push constant 510
	@510        
	D=A          // store the current address as a value
	@SP          // >> push constant value (510) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #98: pop temp 6
	@5           // move to "temp" pointer
	D=M          // store the "temp" base address
	@11          // move to address representing offset
	D=D+A        // D = base addr + offset
	@SP          // >> store dest addr at stack+1 <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // move stack pointer back to the value to be popped
	M=M-1       
	A=M          // >> store our value in D <<
	D=M          // store the top stack value into D
	@SP          // return to where the dest addr is written
	M=M+1       
	A=M          // move to where dest address is stored
	A=M          // move to actual dest address
	M=D          // write our value to the dest address
	@SP          // SP-- to "pop" the stack
	M=M-1       
	
	// COMMAND #99: push local 0
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
	
	// COMMAND #100: push that 5
	@THAT        // move to that
	D=M          // store the "that" base address
	@5           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #101: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #102: push argument 1
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #103: sub
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #104: push this 6
	@THIS        // move to this
	D=M          // store the "this" base address
	@6           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #105: push this 6
	@THIS        // move to this
	D=M          // store the "this" base address
	@6           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #106: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	
	// COMMAND #107: sub
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #108: push temp 6
	@5           // move to temp
	D=M          // store the "temp" base address
	@11          // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #109: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
(INFINITE_LOOP)
	@INFINITE_LOOP
	0;JMP