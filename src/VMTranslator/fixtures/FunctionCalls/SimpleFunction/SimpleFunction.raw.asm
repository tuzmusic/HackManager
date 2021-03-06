@SP          // ** 1: function SimpleFunction.test 2 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL
@SP          // >>> push "0" to top of stack
A=M          // move to top of stack
M=0
@SP          // increment stack pointer
M=M+1
@SP          // >>> push "0" to top of stack
A=M          // move to top of stack
M=0
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 2: push local 0 ** (move to local)
D=M          // store the "local" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 3: push local 1 ** (move to local)
D=M          // store the "local" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 4: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add -                                                                                                                                 
@SP          // ** 5: not ** ("pop" X (SP decremented above))
A=M          // PREPARE X (prep X "into" M)
M=!M         // perform unary operation: not
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 6: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 7: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 8: push argument 1 ** (move to argument)
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
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
@LCL         // ** 10: return ** (>>> store LCL as FRAME)
D=M          // store current memory value
@FRAME       // go to "FRAME"
M=D          // save the stored value in "FRAME"
@5           // >>> save RET
A=D-A        // move to location of retAddr (RET=FRAME-5)
D=M          // store current memory value
@RET         // go to "RET"
M=D          // save the stored value in "RET"
@SP          // >> pop stack to *ARG <<
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@ARG
A=M          // move to "ARG"
M=D          // write value of D to current location
D=A          // >>> restore caller's SP. (in prev step, A=ARG)
@SP
M=D+1        // point SP to ARG+1 (one past returned value)
@LCL         // >>> restoring saved "THAT"
A=M-1        // move to LCL-1: saved "THAT"
D=M          // store saved "THAT"
@THAT
M=D          // restore saved "THAT"
@LCL         // >>> restoring saved "THIS"
A=M-1        // move to LCL-2: saved "THIS"
A=A-1
D=M          // store saved "THIS"
@THIS
M=D          // restore saved "THIS"
@LCL         // >>> restoring saved "ARG"
A=M-1        // move to LCL-3: saved "ARG"
A=A-1
A=A-1
D=M          // store saved "ARG"
@ARG
M=D          // restore saved "ARG"
@LCL         // >>> restoring saved "LCL"
A=M-1        // move to LCL-4: saved "LCL"
A=A-1
A=A-1
A=A-1
D=M          // store saved "LCL"
@LCL
M=D          // restore saved "LCL"
@RET         // >>> move to the return address, to restore control to caller
A=M          // prepare to jump to address stored in RET