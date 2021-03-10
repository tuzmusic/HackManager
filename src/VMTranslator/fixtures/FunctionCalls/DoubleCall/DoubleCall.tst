// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/08/FunctionCalls/DoubleCall/DoubleCall.tst

// DoubleCall.asm results from translating both Main.vm and Sys.vm into
// a single assembly program, stored in the file DoubleCall.asm.

load DoubleCall.asm,
output-file DoubleCall.out,
compare-to DoubleCall.cmp,
output-list RAM[0]%D1.6.1 RAM[261]%D1.6.1 RAM[262]%D1.6.1;

repeat 6000 {
  ticktock;
}

output;
