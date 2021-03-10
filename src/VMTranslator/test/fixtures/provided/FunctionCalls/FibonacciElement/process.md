- Sys.init starts at line 346 (47 jumps to 346)
  - Line 47 should jump to 346
  - SP : 261
    LCL: 261
    ARG: 256
- call Main.fib3 starts at line 357
  - (fib.ret3) = 402 (correct!)
- jump to Main.fib (49) is at line 400
  - (Main.fib) = 49
  - expected:
    - stack:
      - 4 (ARG[0])
      - 402 (retAddr, fib.ret3)
      - current LCL (267)
      - current ARG (261)
      - 0 this
      - 0 that
    - SP=LCL=267
- (if) lt at line 75
  - has subtracted 0 from 2 (D=2-0) and it's not less than 0,
    so false (0) is pushed onto stack at SP=267 (lines 77-79)
  - D=2
    SP=267
  - after this push, we're at line 79. Line 80 jumps to line 85=END_IF_0
- if-goto IF_TRUE.VM(@92) from line 88
  - D=0 so we jump to IF_FALSE.VM (@149) from line 91, which is after the push & return (92-148)
- at line 149 (after 91, IF_FALSE.VM) we're at #11 push argument 0 
  - which is the section for fib(n-2)
- moving on... at 173 we're going to actually CALL fib(n-2) = fib(4-2) = fib(2).
  this is dyn#5; the first internal call to the function
  first we STORE THE RETURN ADDRESS:
  - we go to the return label, which the assembler created. happens to be 218. we PUSH 218 ONTO THE STACK (correct: *268=218)
  - then (line 181-208) we push all the frame values to the stack (starting at 269:)
    LCL=267
    ARG=261
  - then (line 208-215) we reposition:
    - LCL=SP=273
    - ARG=SP-(1+5)=267
    - jump to the function (@49)