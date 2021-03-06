
// function SimpleFunction.test 2
(SimpleFunction.test)
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

// push local 0
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

// push local 1
@LCL         // move to local
D=M          // store the "local" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location

// add
@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1       
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add

// not
@SP          // "pop" X (SP decremented above)
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=!M         // perform unary operation: not
@SP          // increment stack pointer
M=M+1       

// push argument 0
@ARG         // move to argument
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location

// add
@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1       
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1       

// push argument 1
@ARG         // move to argument
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location

// sub
@SP          // pop back to Y, since binary op starts at 1 past Y (SP decremented above)
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1       
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1       

// return
@LCL         // >>> store return address (RET), for later
D=M          // store the LCL pointer address
@5          
D=D-A        // subtract 5, to get the location of the return address
@RET         // create/access RET variable
M=D          // write the return address to RET
            
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
A=M         
@Sys.init$ret.0
0;JMP       

(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP