@256         // ** 0A: BOOTSTRAP THE SYSTEM ** (set the start of the stack to addr 256)
D=A          // store the current address as a value
@SP
M=D          // write value of D to current location -                                                                                                                                 
@Sys.init$ret.6 // ** 0B: CALL Sys.init **
D=A          // D=retAddr
@SP          // >>> push retAddr onto stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@LCL         // >>> saving "LCL"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@ARG         // >>> saving "ARG"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THIS        // >>> saving "THIS"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THAT        // >>> saving "THAT"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@SP          // >>> reposition: LCL = SP
D=M          // store the stack pointer (after pushing the retAddr & segments)
@LCL
M=D          // save SP to LCL
@5           // >>> reposition ARG = SP-n-5
D=D-A        // subtract (frame + num of args) from the stored SP
@ARG
M=D          // save SP-n-5 to ARG
@Sys.init    // jump to the function
0;JMP -                                                                                                                                 
@SP          // ** 21: function Main.fibonacci 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@ARG         // ** 22: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@2           // ** 23: push constant 2 **
D=A          // store the current address as a value
@SP          // >> push constant value (2) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 24: lt ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
D=M-D        // store X-Y in D for comparison
@IF_TRUE_0
D;JLT        // perform comparison: lt
@SP
A=M          // move to top of stack
M=0
@END_IF_0
0;JMP
@SP
A=M          // move to top of stack
M=-1 -                                                                                                                                 
@SP          // ** 25: if-goto IF_TRUE ** (decrement stack pointer (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@IF_TRUE.VM
D;JNE -                                                                                                                                 
@IF_FALSE.VM // ** 26: goto IF_FALSE **
0;JMP -                                                                                                                                  -                                                                                                                                 
@ARG         // ** 28: push argument 0) ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 29: return ** (>>> store LCL as FRAME)
D=M          // store value of LCL
@FRAME       // access FRAME variable (VME uses @R13)
M=D          // save FRAME=LCL
@5           // >>> save RET
A=D-A        // move to location of retAddr
D=M          // store the value of retAddr
@RET         // create/access RET variable (VME uses @R14)
M=D          // write the value of retAddr to RET
@SP          // >>> store (pop) top stack value to ARG[0]
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@ARG
A=M          // move to ARG
M=D          // store return value in ARG[0]
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
0;JMP -                                                                                                                                  -                                                                                                                                 
@ARG         // ** 31: push argument 0) ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@2           // ** 32: push constant 2 **
D=A          // store the current address as a value
@SP          // >> push constant value (2) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 33: sub ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Main.fibonacci$ret.3 // ** 34: call Main.fibonacci 1 **
D=A          // D=retAddr
@SP          // >>> push retAddr onto stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@LCL         // >>> saving "LCL"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@ARG         // >>> saving "ARG"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THIS        // >>> saving "THIS"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THAT        // >>> saving "THAT"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@SP          // >>> reposition: LCL = SP
D=M          // store the stack pointer (after pushing the retAddr & segments)
@LCL
M=D          // save SP to LCL
@6           // >>> reposition ARG = SP-n-5
D=D-A        // subtract (frame + num of args) from the stored SP
@ARG
M=D          // save SP-n-5 to ARG
@Main.fibonacci // jump to the function
0;JMP -                                                                                                                                 
@ARG         // ** 35: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@1           // ** 36: push constant 1 **
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 37: sub ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Main.fibonacci$ret.4 // ** 38: call Main.fibonacci 1 **
D=A          // D=retAddr
@SP          // >>> push retAddr onto stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@LCL         // >>> saving "LCL"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@ARG         // >>> saving "ARG"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THIS        // >>> saving "THIS"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THAT        // >>> saving "THAT"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@SP          // >>> reposition: LCL = SP
D=M          // store the stack pointer (after pushing the retAddr & segments)
@LCL
M=D          // save SP to LCL
@6           // >>> reposition ARG = SP-n-5
D=D-A        // subtract (frame + num of args) from the stored SP
@ARG
M=D          // save SP-n-5 to ARG
@Main.fibonacci // jump to the function
0;JMP -                                                                                                                                 
@SP          // ** 39: add ** (pop back to Y, since binary op starts at 1 past Y)
M=M-1
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 40: return ** (>>> store LCL as FRAME)
D=M          // store value of LCL
@FRAME       // access FRAME variable (VME uses @R13)
M=D          // save FRAME=LCL
@5           // >>> save RET
A=D-A        // move to location of retAddr
D=M          // store the value of retAddr
@RET         // create/access RET variable (VME uses @R14)
M=D          // write the value of retAddr to RET
@SP          // >>> store (pop) top stack value to ARG[0]
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@ARG
A=M          // move to ARG
M=D          // store return value in ARG[0]
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
0;JMP -                                                                                                                                 
@SP          // ** 41: function Sys.init 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@4           // ** 42: push constant 4 **
D=A          // store the current address as a value
@SP          // >> push constant value (4) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Main.fibonacci$ret.5 // ** 43: call Main.fibonacci 1 **
D=A          // D=retAddr
@SP          // >>> push retAddr onto stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@LCL         // >>> saving "LCL"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@ARG         // >>> saving "ARG"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THIS        // >>> saving "THIS"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THAT        // >>> saving "THAT"
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@SP          // >>> reposition: LCL = SP
D=M          // store the stack pointer (after pushing the retAddr & segments)
@LCL
M=D          // save SP to LCL
@6           // >>> reposition ARG = SP-n-5
D=D-A        // subtract (frame + num of args) from the stored SP
@ARG
M=D          // save SP-n-5 to ARG
@Main.fibonacci // jump to the function
0;JMP -                                                                                                                                  -                                                                                                                                 
@WHILE.VM    // ** 45: goto WHILE) **