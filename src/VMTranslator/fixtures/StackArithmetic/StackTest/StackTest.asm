	// COMMAND #4: push constant 17
	@17         
	D=A          // store the current address as a value
	@SP          // >> push constant value (17) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #5: push constant 17
	@17         
	D=A          // store the current address as a value
	@SP          // >> push constant value (17) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #6: eq
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_0  
	D;JEQ        // perform comparison: eq
(IF_FALSE_0)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_0   
	0;JMP       
(IF_TRUE_0) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_0)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #7: push constant 17
	@17         
	D=A          // store the current address as a value
	@SP          // >> push constant value (17) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #8: push constant 16
	@16         
	D=A          // store the current address as a value
	@SP          // >> push constant value (16) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #9: eq
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_1  
	D;JEQ        // perform comparison: eq
(IF_FALSE_1)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_1   
	0;JMP       
(IF_TRUE_1) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_1)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #10: push constant 16
	@16         
	D=A          // store the current address as a value
	@SP          // >> push constant value (16) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #11: push constant 17
	@17         
	D=A          // store the current address as a value
	@SP          // >> push constant value (17) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #12: eq
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_2  
	D;JEQ        // perform comparison: eq
(IF_FALSE_2)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_2   
	0;JMP       
(IF_TRUE_2) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_2)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #13: push constant 892
	@892        
	D=A          // store the current address as a value
	@SP          // >> push constant value (892) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #14: push constant 891
	@891        
	D=A          // store the current address as a value
	@SP          // >> push constant value (891) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #15: lt
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_3  
	D;JLT        // perform comparison: lt
(IF_FALSE_3)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_3   
	0;JMP       
(IF_TRUE_3) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_3)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #16: push constant 891
	@891        
	D=A          // store the current address as a value
	@SP          // >> push constant value (891) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #17: push constant 892
	@892        
	D=A          // store the current address as a value
	@SP          // >> push constant value (892) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #18: lt
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_4  
	D;JLT        // perform comparison: lt
(IF_FALSE_4)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_4   
	0;JMP       
(IF_TRUE_4) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_4)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #19: push constant 891
	@891        
	D=A          // store the current address as a value
	@SP          // >> push constant value (891) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #20: push constant 891
	@891        
	D=A          // store the current address as a value
	@SP          // >> push constant value (891) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #21: lt
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_5  
	D;JLT        // perform comparison: lt
(IF_FALSE_5)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_5   
	0;JMP       
(IF_TRUE_5) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_5)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #22: push constant 32767
	@32767      
	D=A          // store the current address as a value
	@SP          // >> push constant value (32767) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #23: push constant 32766
	@32766      
	D=A          // store the current address as a value
	@SP          // >> push constant value (32766) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #24: gt
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_6  
	D;JGT        // perform comparison: gt
(IF_FALSE_6)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_6   
	0;JMP       
(IF_TRUE_6) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_6)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #25: push constant 32766
	@32766      
	D=A          // store the current address as a value
	@SP          // >> push constant value (32766) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #26: push constant 32767
	@32767      
	D=A          // store the current address as a value
	@SP          // >> push constant value (32767) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #27: gt
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_7  
	D;JGT        // perform comparison: gt
(IF_FALSE_7)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_7   
	0;JMP       
(IF_TRUE_7) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_7)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #28: push constant 32766
	@32766      
	D=A          // store the current address as a value
	@SP          // >> push constant value (32766) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #29: push constant 32766
	@32766      
	D=A          // store the current address as a value
	@SP          // >> push constant value (32766) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #30: gt
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	D=M-D        // store X-Y in D for comparison
	@IF_TRUE_8  
	D;JGT        // perform comparison: gt
(IF_FALSE_8)
	@SP         
	A=M          // move to top of stack
	M=0         
	@END_IF_8   
	0;JMP       
(IF_TRUE_8) 
	@SP         
	A=M          // move to top of stack
	M=-1        
(END_IF_8)  
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #31: push constant 57
	@57         
	D=A          // store the current address as a value
	@SP          // >> push constant value (57) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #32: push constant 31
	@31         
	D=A          // store the current address as a value
	@SP          // >> push constant value (31) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #33: push constant 53
	@53         
	D=A          // store the current address as a value
	@SP          // >> push constant value (53) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #34: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #35: push constant 112
	@112        
	D=A          // store the current address as a value
	@SP          // >> push constant value (112) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #36: sub
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M-D        // perform binary operation: sub
	
	// COMMAND #37: neg
	@SP          // "pop" X (SP decremented above)
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=-M         // perform unary operation: neg
	
	// COMMAND #38: and
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=D&M        // perform binary operation: and
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #39: push constant 82
	@82         
	D=A          // store the current address as a value
	@SP          // >> push constant value (82) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #40: or
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M|D        // perform binary operation: or
	
	// COMMAND #41: not
	@SP          // "pop" X (SP decremented above)
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=!M         // perform unary operation: not
	@SP          // increment stack pointer
	M=M+1       
	
(INFINITE_LOOP)
	@INFINITE_LOOP
	0;JMP