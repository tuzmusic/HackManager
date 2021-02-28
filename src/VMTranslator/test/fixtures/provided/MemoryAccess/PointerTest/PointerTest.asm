// push constant 3030
@3030       
D=A          // store the current address as a value
@SP          // >> push constant value (3030) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location

// pop pointer 0
@SP          // move to top of stack (already points to the correct spot)
A=M          // move to top of stack
D=M          // store the top stack value into D
@THIS       
M=D          // write value of D to current location

// push constant 3040
@3040       
D=A          // store the current address as a value
@SP          // >> push constant value (3040) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location

// pop pointer 1
@SP          // move to top of stack (already points to the correct spot)
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT       
M=D          // write value of D to current location

// push constant 32
@32         
D=A          // store the current address as a value
@SP          // >> push constant value (32) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// pop this 2
@THIS        // move to "this" pointer
D=M          // store the "this" base address
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

// push constant 46
@46         
D=A          // store the current address as a value
@SP          // >> push constant value (46) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// pop that 6
@THAT        // move to "that" pointer
D=M          // store the "that" base address
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

// push pointer 0
@THIS       
D=M          // store current memory value in D
@SP          // PUSH TEMP VALUE TO TOP OF STACK
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// push pointer 1
@THAT       
D=M          // store current memory value in D
@SP          // PUSH TEMP VALUE TO TOP OF STACK
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

// push this 2
@THIS        // move to this
D=M          // store the "this" base address
@2           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // PUSH MEMORY VALUE TO TOP OF STACK
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

// push that 6
@THAT        // move to that
D=M          // store the "that" base address
@6           // move to address representing offset
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

(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP