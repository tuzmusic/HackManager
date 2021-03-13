	// COMMAND #0A: BOOTSTRAP THE SYSTEM
	@256         // set the start of the stack to addr 256
	D=A          // store the current address as a value
	@SP          // write value of D to "SP"
	M=D          // write value of D to current location
	            
	// COMMAND #0B: CALL Sys.init
	@Sys.init$ret.11
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
	            
(Sys.init$ret.11) // return point for the just-called function
	
	// execution continues (after called function returns)...

// *** FILE: Class1.vm ***

(Class1.set)	// COMMAND #1: function Class1.set 0
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
	
	// COMMAND #3: pop static 0
	@SP          // >> pop stack to Class1.0 << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@Class1.0   
	M=D          // write value of D to current location
	
	// COMMAND #4: push argument 1
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #5: pop static 1
	@SP          // >> pop stack to Class1.1 << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@Class1.1   
	M=D          // write value of D to current location
	
	// COMMAND #6: push constant 0
	@0          
	D=A          // store the current address as a value
	@SP          // >> push constant value (0) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #7: return
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
	
(Class1.get)	// COMMAND #8: function Class1.get 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #9: push static 0
	@Class1.0   
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #10: push static 1
	@Class1.1   
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #11: sub
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #12: return
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
	


// *** FILE: Class2.vm ***

(Class2.set)	// COMMAND #1: function Class2.set 0
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
	
	// COMMAND #3: pop static 0
	@SP          // >> pop stack to Class2.0 << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@Class2.0   
	M=D          // write value of D to current location
	
	// COMMAND #4: push argument 1
	@ARG         // move to argument
	D=M          // store the "argument" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #5: pop static 1
	@SP          // >> pop stack to Class2.1 << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@Class2.1   
	M=D          // write value of D to current location
	
	// COMMAND #6: push constant 0
	@0          
	D=A          // store the current address as a value
	@SP          // >> push constant value (0) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #7: return
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
	
(Class2.get)	// COMMAND #8: function Class2.get 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #9: push static 0
	@Class2.0   
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #10: push static 1
	@Class2.1   
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #11: sub
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M-D        // perform binary operation: sub
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #12: return
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
	
	// COMMAND #2: push constant 6
	@6          
	D=A          // store the current address as a value
	@SP          // >> push constant value (6) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #3: push constant 8
	@8          
	D=A          // store the current address as a value
	@SP          // >> push constant value (8) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #4: call Class1.set 2
	@Class1.set$ret.7
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
	@7           // >>> reposition ARG = SP-n-5
	D=D-A        // subtract (frame + num of args) from the stored SP
	@ARG        
	M=D          // save SP-n-5 to ARG
	@Class1.set  // jump to the function
	0;JMP       
	            
(Class1.set$ret.7) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
	// COMMAND #5: pop temp 0
	@SP          // >> pop stack to 5 <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@5          
	M=D          // write value of D to current location
	
	// COMMAND #6: push constant 23
	@23         
	D=A          // store the current address as a value
	@SP          // >> push constant value (23) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #7: push constant 15
	@15         
	D=A          // store the current address as a value
	@SP          // >> push constant value (15) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #8: call Class2.set 2
	@Class2.set$ret.8
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
	@7           // >>> reposition ARG = SP-n-5
	D=D-A        // subtract (frame + num of args) from the stored SP
	@ARG        
	M=D          // save SP-n-5 to ARG
	@Class2.set  // jump to the function
	0;JMP       
	            
(Class2.set$ret.8) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
	// COMMAND #9: pop temp 0
	@SP          // >> pop stack to 5 <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@5          
	M=D          // write value of D to current location
	
	// COMMAND #10: call Class1.get 0
	@Class1.get$ret.9
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
	@Class1.get  // jump to the function
	0;JMP       
	            
(Class1.get$ret.9) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
	// COMMAND #11: call Class2.get 0
	@Class2.get$ret.10
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
	@Class2.get  // jump to the function
	0;JMP       
	            
(Class2.get$ret.10) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
(WHILE.VM)  	// COMMAND #12: label WHILE
	
	// COMMAND #13: goto WHILE
	@WHILE.VM   
	0;JMP       
	