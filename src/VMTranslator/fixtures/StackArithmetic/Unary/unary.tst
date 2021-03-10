// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/07/StackArithmetic/StackTest/StackTest.tst

load unary.asm,
output-file unary.out,
//compare-to unary.cmp,
output-list RAM[0]%D2.6.2 
        RAM[256]%D2.6.2;

set RAM[0] 256,  // initializes the stack pointer

repeat 1000 {    // enough cycles to complete the execution
  ticktock;
}

// outputs the stack pointer (RAM[0]) and 
// the stack contents: RAM[256]
output;
output-list RAM[256]%D2.6.2;
output;
