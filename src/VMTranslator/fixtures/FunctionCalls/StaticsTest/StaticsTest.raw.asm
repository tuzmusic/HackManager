@256         // ** 0A: BOOTSTRAP THE SYSTEM ** (set the start of the stack to addr 256)
D=A          // store the current address as a value
@SP
M=D          // write value of D to current location -                                                                                                                                 
@Sys.init$ret.8 // ** 0B: CALL Sys.init **
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
@SP          // ** 43: function Class1.set 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@ARG         // ** 44: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 45: pop static 0 ** (move stack pointer back to the value to be popped (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@Class1.0    // go to static slot
M=D          // and store the value there -                                                                                                                                 
@ARG         // ** 46: push argument 1 ** (move to argument)
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 47: pop static 1 ** (move stack pointer back to the value to be popped (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@Class1.1    // go to static slot
M=D          // and store the value there -                                                                                                                                 
@0           // ** 48: push constant 0 **
D=A          // store the current address as a value
@SP          // >> push constant value (0) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 49: return ** (>>> store LCL as FRAME)
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
@SP          // ** 50: function Class1.get 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@Class1.0    // ** 51: push static 0 ** (go to static slot)
D=M          // store the static value in D
@SP          // >> push it onto the stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Class1.1    // ** 52: push static 1 ** (go to static slot)
D=M          // store the static value in D
@SP          // >> push it onto the stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 53: sub ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 54: return ** (>>> store LCL as FRAME)
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
@SP          // ** 55: function Class2.set 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@ARG         // ** 56: push argument 0 ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 57: pop static 0 ** (move stack pointer back to the value to be popped (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@Class2.0    // go to static slot
M=D          // and store the value there -                                                                                                                                 
@ARG         // ** 58: push argument 1 ** (move to argument)
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 59: pop static 1 ** (move stack pointer back to the value to be popped (SP decremented above))
A=M          // move to top of stack
D=M          // store the top stack value into D
@Class2.1    // go to static slot
M=D          // and store the value there -                                                                                                                                 
@0           // ** 60: push constant 0 **
D=A          // store the current address as a value
@SP          // >> push constant value (0) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 61: return ** (>>> store LCL as FRAME)
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
@SP          // ** 62: function Class2.get 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@Class2.0    // ** 63: push static 0 ** (go to static slot)
D=M          // store the static value in D
@SP          // >> push it onto the stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Class2.1    // ** 64: push static 1 ** (go to static slot)
D=M          // store the static value in D
@SP          // >> push it onto the stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 65: sub ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@LCL         // ** 66: return ** (>>> store LCL as FRAME)
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
@SP          // ** 67: function Sys.init 0 **
D=M          // store SP value
@LCL
M=D          // store stack address in LCL (no local vars so we're done) -                                                                                                                                 
@6           // ** 68: push constant 6 **
D=A          // store the current address as a value
@SP          // >> push constant value (6) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@8           // ** 69: push constant 8 **
D=A          // store the current address as a value
@SP          // >> push constant value (8) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Class1.set$ret.4 // ** 70: call Class1.set 2 **
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
@7           // >>> reposition ARG = SP-n-5
D=D-A        // subtract (frame + num of args) from the stored SP
@ARG
M=D          // save SP-n-5 to ARG
@Class1.set  // jump to the function
0;JMP -                                                                                                                                 
@5           // ** 71: pop temp 0 ** (move to "temp" pointer)
D=M          // store the "temp" base address
@5           // move to address representing offset
D=D+A        // D = base addr + offset
@SP          // >> store dest addr at stack+1 <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // move stack pointer back to the value to be popped
M=M-1
A=M          // >> store our value in D <<
D=M          // store the top stack value into D
@SP          // return to where the dest addr is written
M=M+1
A=M          // move to where dest address is stored
A=M          // move to actual dest address
M=D          // write our value to the dest address
@SP          // SP-- to "pop" the stack
M=M-1 -                                                                                                                                 
@23          // ** 72: push constant 23 **
D=A          // store the current address as a value
@SP          // >> push constant value (23) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@15          // ** 73: push constant 15 **
D=A          // store the current address as a value
@SP          // >> push constant value (15) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@Class2.set$ret.5 // ** 74: call Class2.set 2 **
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
@7           // >>> reposition ARG = SP-n-5
D=D-A        // subtract (frame + num of args) from the stored SP
@ARG
M=D          // save SP-n-5 to ARG
@Class2.set  // jump to the function
0;JMP -                                                                                                                                 
@5           // ** 75: pop temp 0 ** (move to "temp" pointer)
D=M          // store the "temp" base address
@5           // move to address representing offset
D=D+A        // D = base addr + offset
@SP          // >> store dest addr at stack+1 <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // move stack pointer back to the value to be popped
M=M-1
A=M          // >> store our value in D <<
D=M          // store the top stack value into D
@SP          // return to where the dest addr is written
M=M+1
A=M          // move to where dest address is stored
A=M          // move to actual dest address
M=D          // write our value to the dest address
@SP          // SP-- to "pop" the stack
M=M-1 -                                                                                                                                 
@Class1.get$ret.6 // ** 76: call Class1.get 0 **
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
@Class1.get  // jump to the function
0;JMP -                                                                                                                                 
@Class2.get$ret.7 // ** 77: call Class2.get 0 **
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
@Class2.get  // jump to the function
0;JMP -                                                                                                                                  -                                                                                                                                 
@WHILE.VM    // ** 79: goto WHILE) **