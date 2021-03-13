	// COMMAND #0A: BOOTSTRAP THE SYSTEM
	@256         // set the start of the stack to addr 256
	D=A          // store the current address as a value
	@SP          // write value of D to "SP"
	M=D          // write value of D to current location
	            
	// COMMAND #0B: CALL Sys.init
	@Sys.init$ret.2
	D=A          // D=retAddr
	@SP          // >>> push retAddr onto stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@LCL         // >>> saving "LCL"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@ARG         // >>> saving "ARG"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THIS        // >>> saving "THIS"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THAT        // >>> saving "THAT"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@SP          // >>> reposition: LCL = SP
	D=M          // store the stack pointer (after pushing the retAddr & segments)
	@LCL        
	M=D          // save SP to LCL
	             // this should be 5 more than after pushing retAddr
	@5           // >>> reposition ARG = SP-n-5
	D=D-A        // subtract (frame + num of args) from the stored SP
	@ARG        
	M=D          // save SP-n-5 to ARG
	@Sys.init    // jump to the function
	0;JMP       
	            
(Sys.init$ret.2) // return point for the just-called function
	
	// execution continues (after called function returns)...

// *** FILE: Main.vm ***

(Main.DoubleCall)	// COMMAND #1: function Main.DoubleCall 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #2: push argument 0
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
	
	// COMMAND #3: push argument 0
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@0           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #4: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #5: return
	@LCL         // >>> store LCL as FRAME
	D=M          // store current memory value
	@FRAME       // go to "FRAME"
	M=D          // save the stored value in "FRAME"
	@5           // >>> save RET
	A=D-A        // move to location of retAddr (RET=FRAME-5)
	D=M          // store current memory value
	@RET         // go to "RET"
	M=D          // save the stored value in "RET"
	            
	@SP          // >> pop stack to *ARG <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@ARG        
	A=M          // move to "ARG"
	M=D          // write value of D to current location
	            
	D=A          // >>> restore caller's SP. (in prev step, A=ARG)
	@SP         
	M=D+1        // point SP to ARG+1 (one past returned value)
	            
	@LCL         // >>> restoring saved "THAT"
	A=M-1        // move to LCL-1: saved "THAT"
	D=M          // store saved "THAT"
	@THAT       
	M=D          // restore saved "THAT"
	            
	@LCL         // >>> restoring saved "THIS"
	A=M-1        // move to LCL-2: saved "THIS"
	A=A-1       
	D=M          // store saved "THIS"
	@THIS       
	M=D          // restore saved "THIS"
	            
	@LCL         // >>> restoring saved "ARG"
	A=M-1        // move to LCL-3: saved "ARG"
	A=A-1       
	A=A-1       
	D=M          // store saved "ARG"
	@ARG        
	M=D          // restore saved "ARG"
	            
	@LCL         // >>> restoring saved "LCL"
	A=M-1        // move to LCL-4: saved "LCL"
	A=A-1       
	A=A-1       
	A=A-1       
	D=M          // store saved "LCL"
	@LCL        
	M=D          // restore saved "LCL"
	            
	@RET         // >>> move to the return address, to restore control to caller
	A=M          // prepare to jump to address stored in RET
	0;JMP       
	


// *** FILE: Sys.vm ***

(Sys.init)  	// COMMAND #1: function Sys.init 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #2: push constant 3
	@3          
	D=A          // store the current address as a value
	@SP          // >> push constant value (3) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #3: call Main.DoubleCall 1
	@Main.DoubleCall$ret.1
	D=A          // D=retAddr
	@SP          // >>> push retAddr onto stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@LCL         // >>> saving "LCL"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@ARG         // >>> saving "ARG"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THIS        // >>> saving "THIS"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THAT        // >>> saving "THAT"
	D=M          // store current memory value in D
	@SP          // > push stored value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@SP          // >>> reposition: LCL = SP
	D=M          // store the stack pointer (after pushing the retAddr & segments)
	@LCL        
	M=D          // save SP to LCL
	             // this should be 5 more than after pushing retAddr
	@6           // >>> reposition ARG = SP-n-5
	D=D-A        // subtract (frame + num of args) from the stored SP
	@ARG        
	M=D          // save SP-n-5 to ARG
	@Main.DoubleCall // jump to the function
	0;JMP       
	            
(Main.DoubleCall$ret.1) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
(WHILE.VM)  	// COMMAND #4: label WHILE
	
	// COMMAND #5: goto WHILE
	@WHILE.VM   
	0;JMP       
	