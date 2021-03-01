// BOOTSTRAP THE SYSTEM
@256         // set the start of the stack to addr 256
D=A          // store the current address as a value
@SP         
M=D          // write value of D to current location

// push argument 1
@ARG         // move to argument
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location

// pop pointer 1
@SP          // move to top of stack (already points to the correct spot)
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT       
M=D          // write value of D to current location

// push constant 0
@0          
D=A          // store the current address as a value
@SP          // >> push constant value (0) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// pop that 0
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

// push constant 1
@1          
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// pop that 1
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

// push constant 2
@2          
D=A          // store the current address as a value
@SP          // >> push constant value (2) onto stack <<
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

// label MAIN_LOOP_START
(MAIN_LOOP_START)

// push argument 0
@ARG         // move to argument
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location

// if-goto COMPUTE_ELEMENT
@SP          // move to top of stack (already points to the correct spot)
A=M          // move to top of stack
D=M          // store the top stack value into D
@COMPUTE_ELEMENT
D;JNE       

// goto END_PROGRAM
@END_PROGRAM
0;JMP       

// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)

// push that 0
@THAT        // move to that
D=M          // store the "that" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// push that 1
@THAT        // move to that
D=M          // store the "that" base address
@1           // move to address representing offset
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

// pop that 2
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

// push pointer 1
@THAT       
D=M          // store current memory value in D
@SP          // PUSH TEMP VALUE TO TOP OF STACK
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

// add
@SP          // move to top of stack (already points to the correct spot)
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1       
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add

// pop pointer 1
@SP          // move to top of stack (already points to the correct spot)
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT       
M=D          // write value of D to current location

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

// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP       

// label END_PROGRAM
(END_PROGRAM)

(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP