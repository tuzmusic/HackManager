function fib(n):
if n<2 return n else return fib(n-2)+fib(n-1)

- fib(4) =
- fib(2)             + fib(3) =
- (fib(0) + fib(1))  + fib(3) =
- (0 + fib(1))  + fib(3) =
- (0 + 1)       + fib(3) =
- 1 + fib(3) =
- 1 + fib(1) + fib(2) =
- 1 + 1 + fib(2) =
- 2 + (fib(0) + fib(1)) =
- 2 + 0 + fib(1)) =
- 2 + fib(1)) =
- 2 + 1 = 3


- fib(4) =
    - ARG=261, *ARG=4
- fib(3)                         + fib(2) =
- (fib(2)              + fib(1)) + fib(2) =
- (fib(1) + fib(0))    + fib(1)) + fib(2) =
- (1 + fib(0))    + fib(1)) + fib(2) =
- (1 + 0)              + fib(1)) + fib(2) =
- (1 + fib(1)) + fib(2) =
- (1 + 1 + fib(2) =
-                              2 + fib(2) =
-                              2 + (fib(1) + fib(0)) =
-                              2 + 1       + fib(0)  =
-                                        3 + fib(0)  =
-                                        3 + 0       = 3

Breakpoint at top of fib: PC=49