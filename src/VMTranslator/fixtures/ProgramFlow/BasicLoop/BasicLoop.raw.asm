@0           // ** 1: push constant 0 **
D=A          // store the current address as a value
@SP          // >> push constant value (0) onto stack <<
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
M=D          // write value of D to current location -                                                                                                                                  -                                                                                                                                 
@ARG         // ** 4: push argument 0) ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 5: push local 0 ** (move to local)
D=M          // store the "local" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 6: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 7: pop local 0 ** (move to "local" pointer)
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
@ARG         // ** 8: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@1           // ** 9: push constant 1 **
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 10: sub ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 11: pop argument 0 ** (move to "argument" pointer)
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
@ARG         // ** 12: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 13: if-goto LOOP_START ** (save top stack value in D (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@LOOP_START.VM
D;JNE -                                                                                                                                 
@LCL         // ** 14: push local 0 ** (move to local)
D=M          // store the "local" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer