// push constant 7
@7          
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 8
@8          
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// add
@SP         // pop back to Y, since binary op starts at 1 past Y
A=M-1
D=M         // store current memory value in D
@SP         // "pop" X
A=M-1
M=M+D       // perform binary operation: add
@SP         // increment stack pointer
M=M+1       
