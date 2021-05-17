@111         // ** 1: push constant 111 **
D=A          // store the current address as a value
@SP          // >> push constant value (111) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@333         // ** 2: push constant 333 **
D=A          // store the current address as a value
@SP          // >> push constant value (333) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@888         // ** 3: push constant 888 **
D=A          // store the current address as a value
@SP          // >> push constant value (888) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 4: pop static 8 ** (>> pop stack to StaticTest.8 << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@StaticTest.8
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 5: pop static 3 ** (>> pop stack to StaticTest.3 <<)
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@StaticTest.3
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 6: pop static 1 ** (>> pop stack to StaticTest.1 <<)
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@StaticTest.1
M=D          // write value of D to current location -                                                                                                                                 
@StaticTest.3 // ** 7: push static 3 **
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@StaticTest.1 // ** 8: push static 1 **
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 9: sub ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@StaticTest.8 // ** 10: push static 8 **
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 11: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer