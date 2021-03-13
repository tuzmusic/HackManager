@256         // ** 0A: BOOTSTRAP THE SYSTEM ** (set the start of the stack to addr 256)
D=A          // store the current address as a value
@SP          // write value of D to "SP"
M=D          // write value of D to current location -                                                                                                                                 
@Sys.init$ret.14 // ** 0B: CALL Sys.init **
D=A          // D=retAddr
@SP          // >>> push retAddr onto stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@LCL         // >>> saving "LCL"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@ARG         // >>> saving "ARG"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THIS        // >>> saving "THIS"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THAT        // >>> saving "THAT"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
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
@SP          // ** 1: function Sys.init 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@4000        // ** 2: push constant 4000 **
D=A          // store the current address as a value
@SP          // >> push constant value (4000) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 3: pop pointer 0 ** (>> pop stack to THIS << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THIS
M=D          // write value of D to current location -                                                                                                                                 
@5000        // ** 4: push constant 5000 **
D=A          // store the current address as a value
@SP          // >> push constant value (5000) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 5: pop pointer 1 ** (>> pop stack to THAT << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT
M=D          // write value of D to current location -                                                                                                                                 
@Sys.main$ret.12 // ** 6: call Sys.main 0 **
D=A          // D=retAddr
@SP          // >>> push retAddr onto stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@LCL         // >>> saving "LCL"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@ARG         // >>> saving "ARG"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THIS        // >>> saving "THIS"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THAT        // >>> saving "THAT"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
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
@Sys.main    // jump to the function
0;JMP -                                                                                                                                 
@SP          // ** 7: pop temp 1 ** (>> pop stack to 6 <<)
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@6
M=D          // write value of D to current location -                                                                                                                                  -                                                                                                                                 
@LOOP.VM     // ** 9: goto LOOP) **
0;JMP -                                                                                                                                 
@SP          // ** 10: function Sys.main 5 **
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
M=M+1
@SP          // >>> push "0" to top of stack
A=M          // move to top of stack
M=0
@SP          // increment stack pointer
M=M+1
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
@4001        // ** 11: push constant 4001 **
D=A          // store the current address as a value
@SP          // >> push constant value (4001) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 12: pop pointer 0 ** (>> pop stack to THIS << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THIS
M=D          // write value of D to current location -                                                                                                                                 
@5001        // ** 13: push constant 5001 **
D=A          // store the current address as a value
@SP          // >> push constant value (5001) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 14: pop pointer 1 ** (>> pop stack to THAT << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT
M=D          // write value of D to current location -                                                                                                                                 
@200         // ** 15: push constant 200 **
D=A          // store the current address as a value
@SP          // >> push constant value (200) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 16: pop local 1 ** (move to "local" pointer)
D=M          // store the "local" base address
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
@40          // ** 17: push constant 40 **
D=A          // store the current address as a value
@SP          // >> push constant value (40) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 18: pop local 2 ** (move to "local" pointer)
D=M          // store the "local" base address
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
@6           // ** 19: push constant 6 **
D=A          // store the current address as a value
@SP          // >> push constant value (6) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 20: pop local 3 ** (move to "local" pointer)
D=M          // store the "local" base address
@3           // move to address representing offset
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
@123         // ** 21: push constant 123 **
D=A          // store the current address as a value
@SP          // >> push constant value (123) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Sys.add12$ret.13 // ** 22: call Sys.add12 1 **
D=A          // D=retAddr
@SP          // >>> push retAddr onto stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@LCL         // >>> saving "LCL"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@ARG         // >>> saving "ARG"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THIS        // >>> saving "THIS"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1
@THAT        // >>> saving "THAT"
D=M          // store current memory value in D
@SP          // > push stored value to top of stack
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
@Sys.add12   // jump to the function
0;JMP -                                                                                                                                 
@SP          // ** 23: pop temp 0 ** (>> pop stack to 5 <<)
M=M-1
A=M          // move to top of stack
D=M          // store the top stack value into D
@5
M=D          // write value of D to current location -                                                                                                                                 
@LCL         // ** 24: push local 0 ** (move to local)
D=M          // store the "local" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 25: push local 1 ** (move to local)
D=M          // store the "local" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 26: push local 2 ** (move to local)
D=M          // store the "local" base address
@2           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 27: push local 3 ** (move to local)
D=M          // store the "local" base address
@3           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 28: push local 4 ** (move to local)
D=M          // store the "local" base address
@4           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 29: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add -                                                                                                                                 
@SP          // ** 30: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add -                                                                                                                                 
@SP          // ** 31: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add -                                                                                                                                 
@SP          // ** 32: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 33: return ** (>>> store LCL as FRAME)
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
0;JMP -                                                                                                                                 
@SP          // ** 34: function Sys.add12 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@4002        // ** 35: push constant 4002 **
D=A          // store the current address as a value
@SP          // >> push constant value (4002) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 36: pop pointer 0 ** (>> pop stack to THIS << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THIS
M=D          // write value of D to current location -                                                                                                                                 
@5002        // ** 37: push constant 5002 **
D=A          // store the current address as a value
@SP          // >> push constant value (5002) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 38: pop pointer 1 ** (>> pop stack to THAT << (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@THAT
M=D          // write value of D to current location -                                                                                                                                 
@ARG         // ** 39: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@12          // ** 40: push constant 12 **
D=A          // store the current address as a value
@SP          // >> push constant value (12) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 41: add ** (PREPARE Y (pop Y into D) (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 42: return ** (>>> store LCL as FRAME)
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