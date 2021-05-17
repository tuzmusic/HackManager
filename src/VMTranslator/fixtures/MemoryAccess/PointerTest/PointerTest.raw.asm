@3030        // ** 1: push constant 3030 **
D=A          // store the current address as a value
@SP          // >> push constant value (3030) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 2: pop pointer 0 ** (>> pop stack to THIS << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THIS
M=D          // write value of D to current location -                                                                                                                                 
@3040        // ** 3: push constant 3040 **
D=A          // store the current address as a value
@SP          // >> push constant value (3040) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 4: pop pointer 1 ** (>> pop stack to THAT << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT
M=D          // write value of D to current location -                                                                                                                                 
@32          // ** 5: push constant 32 **
D=A          // store the current address as a value
@SP          // >> push constant value (32) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THIS        // ** 6: pop this 2 ** (move to "this" pointer)
D=M          // store the "this" base address
@2           // move to address representing offset
D=D+A        // D = base addr + offset
@OFFSET      // write value of D to "OFFSET"
M=D          // write value of D to current location
@SP          // >> pop stack to *OFFSET <<
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@OFFSET
A=M          // move to "OFFSET"
M=D          // write value of D to current location -                                                                                                                                 
@46          // ** 7: push constant 46 **
D=A          // store the current address as a value
@SP          // >> push constant value (46) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 8: pop that 6 ** (move to "that" pointer)
D=M          // store the "that" base address
@6           // move to address representing offset
D=D+A        // D = base addr + offset
@OFFSET      // write value of D to "OFFSET"
M=D          // write value of D to current location
@SP          // >> pop stack to *OFFSET <<
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@OFFSET
A=M          // move to "OFFSET"
M=D          // write value of D to current location -                                                                                                                                 
@THIS        // ** 9: push pointer 0 **
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 10: push pointer 1 **
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
M=M+1 -                                                                                                                                 
@THIS        // ** 12: push this 2 ** (move to this)
D=M          // store the "this" base address
@2           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 13: sub ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 14: push that 6 ** (move to that)
D=M          // store the "that" base address
@6           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 15: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer