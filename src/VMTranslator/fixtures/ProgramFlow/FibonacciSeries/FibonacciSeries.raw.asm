@ARG         // ** 1: push argument 1 ** (move to argument)
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 2: pop pointer 1 ** (>> pop stack to THAT << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT
M=D          // write value of D to current location -                                                                                                                                 
@0           // ** 3: push constant 0 **
D=A          // store the current address as a value
@SP          // >> push constant value (0) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 4: pop that 0 ** (move to "that" pointer)
D=M          // store the "that" base address
@OFFSET      // write value of D to "OFFSET"
M=D          // write value of D to current location
@SP          // >> pop stack to *OFFSET <<
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@OFFSET
A=M          // move to "OFFSET"
M=D          // write value of D to current location -                                                                                                                                 
@1           // ** 5: push constant 1 **
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 6: pop that 1 ** (move to "that" pointer)
D=M          // store the "that" base address
@1           // move to address representing offset
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
@ARG         // ** 7: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@2           // ** 8: push constant 2 **
D=A          // store the current address as a value
@SP          // >> push constant value (2) onto stack <<
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
@ARG         // ** 10: pop argument 0 ** (move to "argument" pointer)
D=M          // store the "argument" base address
@OFFSET      // write value of D to "OFFSET"
M=D          // write value of D to current location
@SP          // >> pop stack to *OFFSET <<
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@OFFSET
A=M          // move to "OFFSET"
M=D          // write value of D to current location -                                                                                                                                  -                                                                                                                                 
@ARG         // ** 12: push argument 0) ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 13: if-goto COMPUTE_ELEMENT ** (save top stack value in D (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@COMPUTE_ELEMENT.VM
D;JNE -                                                                                                                                 
@END_PROGRAM.VM // ** 14: goto END_PROGRAM **
0;JMP -                                                                                                                                  -                                                                                                                                 
@THAT        // ** 16: push that 0) ** (move to that)
D=M          // store the "that" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 17: push that 1 ** (move to that)
D=M          // store the "that" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 18: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 19: pop that 2 ** (move to "that" pointer)
D=M          // store the "that" base address
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
@THAT        // ** 20: push pointer 1 **
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@1           // ** 21: push constant 1 **
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 22: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add -                                                                                                                                 
@SP          // ** 23: pop pointer 1 ** (>> pop stack to THAT << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT
M=D          // write value of D to current location -                                                                                                                                 
@ARG         // ** 24: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@1           // ** 25: push constant 1 **
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 26: sub ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 27: pop argument 0 ** (move to "argument" pointer)
D=M          // store the "argument" base address
@OFFSET      // write value of D to "OFFSET"
M=D          // write value of D to current location
@SP          // >> pop stack to *OFFSET <<
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@OFFSET
A=M          // move to "OFFSET"
M=D          // write value of D to current location -                                                                                                                                 
@MAIN_LOOP_START.VM // ** 28: goto MAIN_LOOP_START **
0;JMP