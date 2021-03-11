// push constant 5
@5          
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// neg
@SP         // (pop...back to X)
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
M=-M        // perform unary operation: neg
@SP         // increment stack pointer
M=M+1       
