	// COMMAND #0A: BOOTSTRAP THE SYSTEM
	@256         // set the start of the stack to addr 256
	D=A          // store the current address as a value
	@SP         
	M=D          // write value of D to current location
	            
	// COMMAND #0B: CALL Sys.init
	@Sys.init$ret.9
	D=A          // D=retAddr
	@SP          // >>> push retAddr onto stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@LCL         // >>> saving "LCL"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@ARG         // >>> saving "ARG"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THIS        // >>> saving "THIS"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THAT        // >>> saving "THAT"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
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
	            
(Sys.init$ret.9) // return point for the just-called function
	
	// execution continues (after called function returns)...

// *** FILE: Sys.vm ***

(Sys.init)  	// COMMAND #170: function Sys.init 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #171: push constant 4000
	@4000       
	D=A          // store the current address as a value
	@SP          // >> push constant value (4000) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #172: pop pointer 0
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THIS       
	M=D          // write value of D to current location
	
	// COMMAND #173: push constant 5000
	@5000       
	D=A          // store the current address as a value
	@SP          // >> push constant value (5000) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #174: pop pointer 1
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #175: call Sys.main 0
	@Sys.main$ret.7
	D=A          // D=retAddr
	@SP          // >>> push retAddr onto stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@LCL         // >>> saving "LCL"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@ARG         // >>> saving "ARG"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THIS        // >>> saving "THIS"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THAT        // >>> saving "THAT"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
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
	            
(Sys.main$ret.7) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
	// COMMAND #176: pop temp 1
	@5           // move to "temp" pointer
	D=M          // store the "temp" base address
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
	
(LOOP.VM)   	// COMMAND #177: label LOOP
	
	// COMMAND #178: goto LOOP
	@LOOP.VM    
	0;JMP       
	
(Sys.main)  	// COMMAND #179: function Sys.main 5
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
	
	// COMMAND #180: push constant 4001
	@4001       
	D=A          // store the current address as a value
	@SP          // >> push constant value (4001) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #181: pop pointer 0
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THIS       
	M=D          // write value of D to current location
	
	// COMMAND #182: push constant 5001
	@5001       
	D=A          // store the current address as a value
	@SP          // >> push constant value (5001) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #183: pop pointer 1
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #184: push constant 200
	@200        
	D=A          // store the current address as a value
	@SP          // >> push constant value (200) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #185: pop local 1
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
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
	
	// COMMAND #186: push constant 40
	@40         
	D=A          // store the current address as a value
	@SP          // >> push constant value (40) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #187: pop local 2
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
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
	
	// COMMAND #188: push constant 6
	@6          
	D=A          // store the current address as a value
	@SP          // >> push constant value (6) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #189: pop local 3
	@LCL         // move to "local" pointer
	D=M          // store the "local" base address
	@3           // move to address representing offset
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
	
	// COMMAND #190: push constant 123
	@123        
	D=A          // store the current address as a value
	@SP          // >> push constant value (123) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #191: call Sys.add12 1
	@Sys.add12$ret.8
	D=A          // D=retAddr
	@SP          // >>> push retAddr onto stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	@LCL         // >>> saving "LCL"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@ARG         // >>> saving "ARG"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THIS        // >>> saving "THIS"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	@SP          // increment stack pointer
	M=M+1       
	            
	@THAT        // >>> saving "THAT"
	D=M          // store current memory value in D
	@SP          // > push temp value to top of stack
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
	            
(Sys.add12$ret.8) // return point for the just-called function
	
	// execution continues (after called function returns)...
	
	// COMMAND #192: pop temp 0
	@5           // move to "temp" pointer
	D=M          // store the "temp" base address
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
	
	// COMMAND #193: push local 0
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
	
	// COMMAND #194: push local 1
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
	
	// COMMAND #195: push local 2
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
	
	// COMMAND #196: push local 3
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
	
	// COMMAND #197: push local 4
	@LCL         // move to local
	D=M          // store the "local" base address
	@4           // move to address representing offset
	A=D+A        // new addr = base addr + offset
	D=M          // store current memory value in D
	@SP          // >>> push memory value to top of stack
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #198: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	
	// COMMAND #199: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	
	// COMMAND #200: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	
	// COMMAND #201: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #202: return
	@LCL         // >>> store LCL as FRAME
	D=M          // store value of LCL
	@FRAME       // access FRAME variable (VME uses @R13)
	M=D          // save FRAME=LCL
	@5           // >>> save RET
	A=D-A        // move to location of retAddr
	D=M          // store the value of retAddr
	@RET         // create/access RET variable (VME uses @R14)
	M=D          // write the value of retAddr to RET
	            
	@SP          // >>> store (pop) top stack value to ARG[0]
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@ARG        
	A=M          // move to ARG
	M=D          // store return value in ARG[0]
	            
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
	
(Sys.add12) 	// COMMAND #203: function Sys.add12 0
	@SP         
	D=M          // store SP value
	@LCL        
	M=D          // store stack address in LCL (no local vars so we're done)
	
	// COMMAND #204: push constant 4002
	@4002       
	D=A          // store the current address as a value
	@SP          // >> push constant value (4002) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #205: pop pointer 0
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THIS       
	M=D          // write value of D to current location
	
	// COMMAND #206: push constant 5002
	@5002       
	D=A          // store the current address as a value
	@SP          // >> push constant value (5002) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #207: pop pointer 1
	@SP          // decrement stack pointer (SP decremented above)
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@THAT       
	M=D          // write value of D to current location
	
	// COMMAND #208: push argument 0
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
	
	// COMMAND #209: push constant 12
	@12         
	D=A          // store the current address as a value
	@SP          // >> push constant value (12) onto stack <<
	A=M          // move to top of stack
	M=D          // write value of D to current location
	
	// COMMAND #210: add
	@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
	A=M          // PREPARE Y (pop Y into D)
	D=M          // store the top stack value into D
	@SP          // "pop" X
	M=M-1       
	A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
	M=M+D        // perform binary operation: add
	@SP          // increment stack pointer
	M=M+1       
	
	// COMMAND #211: return
	@LCL         // >>> store LCL as FRAME
	D=M          // store value of LCL
	@FRAME       // access FRAME variable (VME uses @R13)
	M=D          // save FRAME=LCL
	@5           // >>> save RET
	A=D-A        // move to location of retAddr
	D=M          // store the value of retAddr
	@RET         // create/access RET variable (VME uses @R14)
	M=D          // write the value of retAddr to RET
	            
	@SP          // >>> store (pop) top stack value to ARG[0]
	M=M-1       
	A=M          // move to top of stack
	D=M          // store the top stack value into D
	@ARG        
	A=M          // move to ARG
	M=D          // store return value in ARG[0]
	            
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
	