@10          // ** 1: push constant 10 **
D=A          // store the current address as a value
@SP          // >> push constant value (10) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 2: pop local 0 ** (move to "local" pointer)
D=M          // store the "local" base address
@OFFSET      // write value of D to "OFFSET"
M=D          // write value of D to current location
@SP          // >> pop stack to *OFFSET <<
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@OFFSET
A=M          // move to "OFFSET"
M=D          // write value of D to current location -                                                                                                                                 
@21          // ** 3: push constant 21 **
D=A          // store the current address as a value
@SP          // >> push constant value (21) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@22          // ** 4: push constant 22 **
D=A          // store the current address as a value
@SP          // >> push constant value (22) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 5: pop argument 2 ** (move to "argument" pointer)
D=M          // store the "argument" base address
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
@ARG         // ** 6: pop argument 1 ** (move to "argument" pointer)
D=M          // store the "argument" base address
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
@36          // ** 7: push constant 36 **
D=A          // store the current address as a value
@SP          // >> push constant value (36) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THIS        // ** 8: pop this 6 ** (move to "this" pointer)
D=M          // store the "this" base address
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
@42          // ** 9: push constant 42 **
D=A          // store the current address as a value
@SP          // >> push constant value (42) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@45          // ** 10: push constant 45 **
D=A          // store the current address as a value
@SP          // >> push constant value (45) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 11: pop that 5 ** (move to "that" pointer)
D=M          // store the "that" base address
@5           // move to address representing offset
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
@THAT        // ** 12: pop that 2 ** (move to "that" pointer)
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
@510         // ** 13: push constant 510 **
D=A          // store the current address as a value
@SP          // >> push constant value (510) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 14: pop temp 6 ** (>> pop stack to 11 << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@11
M=D          // write value of D to current location -                                                                                                                                 
@LCL         // ** 15: push local 0 ** (move to local)
D=M          // store the "local" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 16: push that 5 ** (move to that)
D=M          // store the "that" base address
@5           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 17: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 18: push argument 1 ** (move to argument)
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 19: sub ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THIS        // ** 20: push this 6 ** (move to this)
D=M          // store the "this" base address
@6           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THIS        // ** 21: push this 6 ** (move to this)
D=M          // store the "this" base address
@6           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 22: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add -                                                                                                                                 
@SP          // ** 23: sub ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@11          // ** 24: push temp 6 **
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 25: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer