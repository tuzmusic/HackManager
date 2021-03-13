	// COMMAND #0A: BOOTSTRAP THE SYSTEM
	@256         // set the start of the stack to addr 256
	D=A          // store the current address as a value
	@SP          // write value of D to "SP"
	M=D          // write value of D to current location
	            
	// COMMAND #0B: CALL Sys.init
	@Sys.init$ret.14
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
	            
(Sys.init$ret.14) // return point for the just-called function
	
	// execution continues (after called function returns)...

// *** FILE: Sys.vm ***

(Sys.init)  	// COMMAND #1: function Sys.init 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #2: push constant 4000
	@4000       
	D=A          // store the current address as a value
	@SP          // >> push constant value (4000) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #3: pop pointer 0
	@SP          // >> pop stack to THIS << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THIS       
	M=D          // write value of D to current location
	
	// COMMAND #4: push constant 5000
	@5000       
	D=A          // store the current address as a value
	@SP          // >> push constant value (5000) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #5: pop pointer 1
	@SP          // >> pop stack to THAT << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #6: call Sys.main 0
	@Sys.main$ret.12
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
	@Sys.main    // jump to the function
	0;JMP       
	            
(Sys.main$ret.12) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
	// COMMAND #7: pop temp 1
	@SP          // >> pop stack to 6 <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@6          
	M=D          // write value of D to current location
	
(LOOP.VM)   	// COMMAND #8: label LOOP
	
	// COMMAND #9: goto LOOP
	@LOOP.VM    
	0;JMP       
	
(Sys.main)  	// COMMAND #10: function Sys.main 5
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL
	@SP          // >>> push "0" to top of stack
	A=M          // move to top of stack
	M=0         
	@SP          // increment stack pointer
	M=M+1       
	@SP          // >>> push "0" to top of stack
	A=M          // move to top of stack
	M=0         
	@SP          // increment stack pointer
	M=M+1       
	@SP          // >>> push "0" to top of stack
	A=M          // move to top of stack
	M=0         
	@SP          // increment stack pointer
	M=M+1       
	@SP          // >>> push "0" to top of stack
	A=M          // move to top of stack
	M=0         
	@SP          // increment stack pointer
	M=M+1       
	@SP          // >>> push "0" to top of stack
	A=M          // move to top of stack
	M=0         
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #11: push constant 4001
	@4001       
	D=A          // store the current address as a value
	@SP          // >> push constant value (4001) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #12: pop pointer 0
	@SP          // >> pop stack to THIS << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THIS       
	M=D          // write value of D to current location
	
	// COMMAND #13: push constant 5001
	@5001       
	D=A          // store the current address as a value
	@SP          // >> push constant value (5001) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #14: pop pointer 1
	@SP          // >> pop stack to THAT << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #15: push constant 200
	@200        
	D=A          // store the current address as a value
	@SP          // >> push constant value (200) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #16: pop local 1
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
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
	
	// COMMAND #17: push constant 40
	@40         
	D=A          // store the current address as a value
	@SP          // >> push constant value (40) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #18: pop local 2
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
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
	
	// COMMAND #19: push constant 6
	@6          
	D=A          // store the current address as a value
	@SP          // >> push constant value (6) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #20: pop local 3
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
	@3           // move to address representing offset
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
	
	// COMMAND #21: push constant 123
	@123        
	D=A          // store the current address as a value
	@SP          // >> push constant value (123) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #22: call Sys.add12 1
	@Sys.add12$ret.13
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
	@Sys.add12   // jump to the function
	0;JMP       
	            
(Sys.add12$ret.13) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
	// COMMAND #23: pop temp 0
	@SP          // >> pop stack to 5 <<
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@5          
	M=D          // write value of D to current location
	
	// COMMAND #24: push local 0
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
	
	// COMMAND #25: push local 1
	@LCL         // move to local
	D=M          // store the "local" base address
	@1           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #26: push local 2
	@LCL         // move to local
	D=M          // store the "local" base address
	@2           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #27: push local 3
	@LCL         // move to local
	D=M          // store the "local" base address
	@3           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #28: push local 4
	@LCL         // move to local
	D=M          // store the "local" base address
	@4           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #29: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	
	// COMMAND #30: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	
	// COMMAND #31: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	
	// COMMAND #32: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #33: return
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
	
(Sys.add12) 	// COMMAND #34: function Sys.add12 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #35: push constant 4002
	@4002       
	D=A          // store the current address as a value
	@SP          // >> push constant value (4002) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #36: pop pointer 0
	@SP          // >> pop stack to THIS << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THIS       
	M=D          // write value of D to current location
	
	// COMMAND #37: push constant 5002
	@5002       
	D=A          // store the current address as a value
	@SP          // >> push constant value (5002) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #38: pop pointer 1
	@SP          // >> pop stack to THAT << (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #39: push argument 0
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
	
	// COMMAND #40: push constant 12
	@12         
	D=A          // store the current address as a value
	@SP          // >> push constant value (12) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #41: add
	@SP          // PREPARE Y (pop Y into D) (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #42: return
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
	