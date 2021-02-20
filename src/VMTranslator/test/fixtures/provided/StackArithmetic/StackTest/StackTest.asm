// push constant 17
@17         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 17
@17         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// eq
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_0  
D;JEQ       // perform comparison: eq
(IF_FALSE_0)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_0   
0;JMP       
(IF_TRUE_0) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_0)  
@SP         // increment stack pointer
M=M+1       

// push constant 17
@17         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 16
@16         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// eq
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_1  
D;JEQ       // perform comparison: eq
(IF_FALSE_1)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_1   
0;JMP       
(IF_TRUE_1) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_1)  
@SP         // increment stack pointer
M=M+1       

// push constant 16
@16         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 17
@17         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// eq
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_2  
D;JEQ       // perform comparison: eq
(IF_FALSE_2)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_2   
0;JMP       
(IF_TRUE_2) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_2)  
@SP         // increment stack pointer
M=M+1       

// push constant 892
@892        
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 891
@891        
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// lt
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_3  
D;JLT       // perform comparison: lt
(IF_FALSE_3)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_3   
0;JMP       
(IF_TRUE_3) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_3)  
@SP         // increment stack pointer
M=M+1       

// push constant 891
@891        
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 892
@892        
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// lt
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_4  
D;JLT       // perform comparison: lt
(IF_FALSE_4)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_4   
0;JMP       
(IF_TRUE_4) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_4)  
@SP         // increment stack pointer
M=M+1       

// push constant 891
@891        
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 891
@891        
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// lt
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_5  
D;JLT       // perform comparison: lt
(IF_FALSE_5)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_5   
0;JMP       
(IF_TRUE_5) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_5)  
@SP         // increment stack pointer
M=M+1       

// push constant 32767
@32767      
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 32766
@32766      
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// gt
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_6  
D;JGT       // perform comparison: gt
(IF_FALSE_6)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_6   
0;JMP       
(IF_TRUE_6) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_6)  
@SP         // increment stack pointer
M=M+1       

// push constant 32766
@32766      
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 32767
@32767      
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// gt
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_7  
D;JGT       // perform comparison: gt
(IF_FALSE_7)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_7   
0;JMP       
(IF_TRUE_7) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_7)  
@SP         // increment stack pointer
M=M+1       

// push constant 32766
@32766      
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 32766
@32766      
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// gt
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D       // store X-Y in D for comparison
@IF_TRUE_8  
D;JGT       // perform comparison: gt
(IF_FALSE_8)
@SP         
A=M         // move to top of stack
M=0         
@END_IF_8   
0;JMP       
(IF_TRUE_8) 
@SP         
A=M         // move to top of stack
M=-1        
(END_IF_8)  
@SP         // increment stack pointer
M=M+1       

// push constant 57
@57         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 31
@31         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location
@SP         // increment stack pointer
M=M+1       

// push constant 53
@53         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// add
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D       // perform binary operation: add
@SP         // increment stack pointer
M=M+1       

// push constant 112
@112        
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// sub
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D       // perform binary operation: sub
@SP         // increment stack pointer
M=M+1       

// neg
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
M=-M        // perform unary operation: neg
@SP         // increment stack pointer
M=M+1       

// and
@SP         // pop back to Y, since binary op starts at 1 past Y
M=M-1       
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
M=D&M       // perform binary operation: and
@SP         // increment stack pointer
M=M+1       

// push constant 82
@82         
D=A         // store the current address as a value
@SP         // PUSH TEMP VALUE TO TOP OF STACK
A=M         // move to top of stack
M=D         // write value of D to current location

// or
@SP         // move to top of stack (already points to our operand)
A=M         // PREPARE Y (pop Y into D)
D=M         // store current memory value in D
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M|D       // perform binary operation: or
@SP         // increment stack pointer
M=M+1       

// not
@SP         // "pop" X
M=M-1       
A=M         // PREPARE X (prep X "into" M – but don't pop just yet!)
M=!M        // perform unary operation: not
@SP         // increment stack pointer
M=M+1       
