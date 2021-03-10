// push constant 111
@111        
D=A          // store the current address as a value
@SP          // >> push constant value (111) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// push constant 333
@333        
D=A          // store the current address as a value
@SP          // >> push constant value (333) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// push constant 888
@888        
D=A          // store the current address as a value
@SP          // >> push constant value (888) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location

// pop static 8
@SP          // move to top of stack (already points to the correct spot)
A=M          // move to top of stack
D=M          // store the top stack value into D
@StaticTest.8 // go to static slot
M=D          // and store the value there

// pop static 3
@SP          // move stack pointer back to the value to be popped
M=M-1       
A=M          // move to top of stack
D=M          // store the top stack value into D
@StaticTest.3 // go to static slot
M=D          // and store the value there

// pop static 1
@SP          // move stack pointer back to the value to be popped
M=M-1       
A=M          // move to top of stack
D=M          // store the top stack value into D
@StaticTest.1 // go to static slot
M=D          // and store the value there

// push static 3
@StaticTest.3 // go to static slot
D=M          // store the static value in D
@SP          // >> push it onto the stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1       

// push static 1
@StaticTest.1 // go to static slot
D=M          // store the static value in D
@SP          // >> push it onto the stack <<
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

// push static 8
@StaticTest.8 // go to static slot
D=M          // store the static value in D
@SP          // >> push it onto the stack <<
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