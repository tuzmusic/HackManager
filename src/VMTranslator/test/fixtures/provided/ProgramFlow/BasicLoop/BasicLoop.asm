// BOOTSTRAP THE SYSTEM
@256         // set the start of the stack to addr 256
D=A          // store the current address as a value
@SP         
M=D          // write value of D to current location

// push constant 0
@0          
D=A          // store the current address as a value
@SP          // >> push constant value (0) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// pop local 0
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

// label LOOP_START
(LOOP_START)

// push argument 0
@ARG         // move to argument
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// push local 0
@LCL         // move to local
D=M          // store the "local" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location

// add
@SP          // move to top of stack (already points to the correct spot)
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1       
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1       

// pop local 0
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

// push argument 0
@ARG         // move to argument
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// push constant 1
@1          
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location

// sub
@SP          // move to top of stack (already points to the correct spot)
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1       
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1       

// pop argument 0
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

// push argument 0
@ARG         // move to argument
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location

// if-goto LOOP_START
@SP          // move to top of stack (already points to the correct spot)
A=M          // move to top of stack
D=M          // store the top stack value into D
@LOOP_START 
D;JNE       

// push local 0
@LCL         // move to local
D=M          // store the "local" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP