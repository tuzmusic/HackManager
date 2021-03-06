(Main.fibonacci)
@SP         
D=M          // store SP value
@LCL        
M=D          // store stack address in LCL
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
D=M-D        // store X-Y in D for comparison
@IF_TRUE    
D;JLT        // perform comparison: lt
(IF_FALSE)  
@SP         
A=M          // move to top of stack
M=0         
@END_IF     
0;JMP       
(IF_TRUE)   
@SP         
A=M          // move to top of stack
M=-1        
(END_IF)    
@SP          // decrement stack pointer (SP decremented above)
A=M          // move to top of stack
D=M          // store the top stack value into D
@IF_TRUE    
D;JNE       
@IF_FALSE   
0;JMP       
(IF_TRUE)   
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
(IF_FALSE)  
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
@SP          // >>> reposition LCL & ARG
D=M          // store the stack pointer
@LCL        
M=D          // save SP to LCL
@5          
D=D-A        // subtract 5 from the stored SP
@ARG        
M=D          // save SP-5 to ARG
@Main.fibonacci$ret.0
0;JMP       
(Main.fibonacci$ret.0) // return point for the just-called function
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
@SP          // >>> reposition LCL & ARG
D=M          // store the stack pointer
@LCL        
M=D          // save SP to LCL
@5          
D=D-A        // subtract 5 from the stored SP
@ARG        
M=D          // save SP-5 to ARG
@Main.fibonacci$ret.0
0;JMP       
(Main.fibonacci$ret.0) // return point for the just-called function
@SP          // pop back to Y, since binary op starts at 1 past Y
M=M-1       
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1       
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1       
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
@Main.fibonacci$ret.0
0;JMP       
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
(Sys.init)  
@SP         
D=M          // store SP value
@LCL        
M=D          // store stack address in LCL
@4          
D=A          // store the current address as a value
@SP          // >> push constant value (4) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       
@SP          // >>> reposition LCL & ARG
D=M          // store the stack pointer
@LCL        
M=D          // save SP to LCL
@5          
D=D-A        // subtract 5 from the stored SP
@ARG        
M=D          // save SP-5 to ARG
@Main.fibonacci$ret.0
0;JMP       
(Main.fibonacci$ret.0) // return point for the just-called function
(WHILE)     
@WHILE      
0;JMP       
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP