@ARG         // ** 1: push argument 1 ** (move to argument)
D=M          // store the "argument" base address
@1           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 2: pop pointer 1 ** (decrement stack pointer (SP decremented above))
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
@SP          // >> write dest addr to top of stack (don't increment) <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // >> move stack pointer back to the value to be popped <<
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
@SP          // >> write dest addr to top of stack (don't increment) <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // >> move stack pointer back to the value to be popped <<
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
@SP          // ** 9: sub ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 10: pop argument 0 ** (move to "argument" pointer)
D=M          // store the "argument" base address
@SP          // >> write dest addr to top of stack (don't increment) <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // >> move stack pointer back to the value to be popped <<
M=M-1
A=M          // >> store our value in D <<
D=M          // store the top stack value into D
@SP          // return to where the dest addr is written
M=M+1
A=M          // move to where dest address is stored
A=M          // move to actual dest address
M=D          // write our value to the dest address
@SP          // SP-- to "pop" the stack
M=M-1 -                                                                                                                                  -                                                                                                                                 
@ARG         // ** 12: push argument 0) ** (move to argument)
D=M          // store the "argument" base address
@0           // move to address representing offset
A=D+A        // new addr = base addr + offset
D=M          // store current memory value in D
@SP          // >>> push memory value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 13: if-goto COMPUTE_ELEMENT ** (decrement stack pointer (SP decremented above))
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
@SP          // ** 18: add ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@THAT        // ** 19: pop that 2 ** (move to "that" pointer)
D=M          // store the "that" base address
@2           // move to address representing offset
D=D+A        // D = base addr + offset
@SP          // >> write dest addr to top of stack (don't increment) <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // >> move stack pointer back to the value to be popped <<
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
@THAT        // ** 20: push pointer 1 **
D=M          // store current memory value in D
@SP          // > push temp value to top of stack
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@1           // ** 21: push constant 1 **
D=A          // store the current address as a value
@SP          // >> push constant value (1) onto stack <<
A=M          // move to top of stack
M=D          // write value of D to current location -                                                                                                                                 
@SP          // ** 22: add ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M+D        // perform binary operation: add -                                                                                                                                 
@SP          // ** 23: pop pointer 1 ** (decrement stack pointer (SP decremented above))
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
@SP          // ** 26: sub ** (pop back to Y, since binary op starts at 1 past Y (SP decremented above))
A=M          // PREPARE Y (pop Y into D)
D=M          // store the top stack value into D
@SP          // "pop" X
M=M-1
A=M          // PREPARE X (prep X "into" M – but don't pop just yet!)
M=M-D        // perform binary operation: sub
@SP          // increment stack pointer
M=M+1 -                                                                                                                                 
@ARG         // ** 27: pop argument 0 ** (move to "argument" pointer)
D=M          // store the "argument" base address
@SP          // >> write dest addr to top of stack (don't increment) <<
A=M          // move to top of stack
M=D          // write value of D to current location
@SP          // >> move stack pointer back to the value to be popped <<
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
@MAIN_LOOP_START.VM // ** 28: goto MAIN_LOOP_START **
0;JMP