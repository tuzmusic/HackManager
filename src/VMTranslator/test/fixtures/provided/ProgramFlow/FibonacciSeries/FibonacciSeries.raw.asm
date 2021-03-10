	@ARG         // move to argument
	D=M          // store the "argument" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	@0          
	D=A          // store the current address as a value
	@SP          // >> push constant value (0) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
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
	@1          
	D=A          // store the current address as a value
	@SP          // >> push constant value (1) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@THAT        // move to "that" pointer
	D=M          // store the "that" base address
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
	@2          
	D=A          // store the current address as a value
	@SP          // >> push constant value (2) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	@ARG         // move to "argument" pointer
	D=M          // store the "argument" base address
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
(MAIN_LOOP_START)
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@COMPUTE_ELEMENT
	D;JNE       
	@END_PROGRAM
	0;JMP       
(COMPUTE_ELEMENT)
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
	@THAT        // move to that
	D=M          // store the "that" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
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
	@THAT       
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@1          
	D=A          // store the current address as a value
	@SP          // >> push constant value (1) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
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
	@1          
	D=A          // store the current address as a value
	@SP          // >> push constant value (1) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	@ARG         // move to "argument" pointer
	D=M          // store the "argument" base address
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
	@MAIN_LOOP_START
	0;JMP       
(END_PROGRAM)
(INFINITE_LOOP)
	@INFINITE_LOOP
	0;JMP