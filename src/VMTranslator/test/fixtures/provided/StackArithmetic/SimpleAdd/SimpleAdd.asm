// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
A=M
D=M
@loc1
M=D
@SP
M=M-1
@SP
A=M
D=M
@loc2
M=D
@SP
M=M-1
@loc1
D=M
@loc2
D=M+D
@SP
A=M
M=D