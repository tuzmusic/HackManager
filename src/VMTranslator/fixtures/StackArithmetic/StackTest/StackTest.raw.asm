@17          // ** 1: push constant 17 **
D=A          // store the current address as a value
@SP          // >> push constant value (17) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@17          // ** 2: push constant 17 **
D=A          // store the current address as a value
@SP          // >> push constant value (17) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 3: eq ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_0
D;JEQ        // perform comparison: eq
@SP
A=M          // move to top of stack
M=0
@END_IF_0
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@17          // ** 4: push constant 17 **
D=A          // store the current address as a value
@SP          // >> push constant value (17) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@16          // ** 5: push constant 16 **
D=A          // store the current address as a value
@SP          // >> push constant value (16) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 6: eq ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_1
D;JEQ        // perform comparison: eq
@SP
A=M          // move to top of stack
M=0
@END_IF_1
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@16          // ** 7: push constant 16 **
D=A          // store the current address as a value
@SP          // >> push constant value (16) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@17          // ** 8: push constant 17 **
D=A          // store the current address as a value
@SP          // >> push constant value (17) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 9: eq ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_2
D;JEQ        // perform comparison: eq
@SP
A=M          // move to top of stack
M=0
@END_IF_2
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@892         // ** 10: push constant 892 **
D=A          // store the current address as a value
@SP          // >> push constant value (892) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@891         // ** 11: push constant 891 **
D=A          // store the current address as a value
@SP          // >> push constant value (891) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 12: lt ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_3
D;JLT        // perform comparison: lt
@SP
A=M          // move to top of stack
M=0
@END_IF_3
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@891         // ** 13: push constant 891 **
D=A          // store the current address as a value
@SP          // >> push constant value (891) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@892         // ** 14: push constant 892 **
D=A          // store the current address as a value
@SP          // >> push constant value (892) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 15: lt ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_4
D;JLT        // perform comparison: lt
@SP
A=M          // move to top of stack
M=0
@END_IF_4
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@891         // ** 16: push constant 891 **
D=A          // store the current address as a value
@SP          // >> push constant value (891) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@891         // ** 17: push constant 891 **
D=A          // store the current address as a value
@SP          // >> push constant value (891) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 18: lt ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_5
D;JLT        // perform comparison: lt
@SP
A=M          // move to top of stack
M=0
@END_IF_5
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@32767       // ** 19: push constant 32767 **
D=A          // store the current address as a value
@SP          // >> push constant value (32767) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@32766       // ** 20: push constant 32766 **
D=A          // store the current address as a value
@SP          // >> push constant value (32766) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 21: gt ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_6
D;JGT        // perform comparison: gt
@SP
A=M          // move to top of stack
M=0
@END_IF_6
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@32766       // ** 22: push constant 32766 **
D=A          // store the current address as a value
@SP          // >> push constant value (32766) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@32767       // ** 23: push constant 32767 **
D=A          // store the current address as a value
@SP          // >> push constant value (32767) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 24: gt ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_7
D;JGT        // perform comparison: gt
@SP
A=M          // move to top of stack
M=0
@END_IF_7
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@32766       // ** 25: push constant 32766 **
D=A          // store the current address as a value
@SP          // >> push constant value (32766) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@32766       // ** 26: push constant 32766 **
D=A          // store the current address as a value
@SP          // >> push constant value (32766) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 27: gt ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_8
D;JGT        // perform comparison: gt
@SP
A=M          // move to top of stack
M=0
@END_IF_8
0;JMP
@SP
A=M          // move to top of stack
M=-1
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@57          // ** 28: push constant 57 **
D=A          // store the current address as a value
@SP          // >> push constant value (57) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@31          // ** 29: push constant 31 **
D=A          // store the current address as a value
@SP          // >> push constant value (31) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@53          // ** 30: push constant 53 **
D=A          // store the current address as a value
@SP          // >> push constant value (53) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 31: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@112         // ** 32: push constant 112 **
D=A          // store the current address as a value
@SP          // >> push constant value (112) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 33: sub ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M-D        // perform binary operation: sub -                                                                                                                                 
@SP          // ** 34: neg ** ("pop" X (SP decremented above))
A=M          // PREPARE X (prep X "into" M)
M=-M         // perform unary operation: neg -                                                                                                                                 
@SP          // ** 35: and ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=D&M        // perform binary operation: and
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@82          // ** 36: push constant 82 **
D=A          // store the current address as a value
@SP          // >> push constant value (82) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 37: or ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M|D        // perform binary operation: or -                                                                                                                                 
@SP          // ** 38: not ** ("pop" X (SP decremented above))
A=M          // PREPARE X (prep X "into" M)
M=!M         // perform unary operation: not
@SP          // increment stack pointer