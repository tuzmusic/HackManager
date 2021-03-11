256 | 49    < retAddr for bootstrap (arg for Sys.init, but not needed)
257 |  0
258 |  0
259 |  0
260 |  0
261 |  4    ARG for fib(4)
- CALL fib(4) from Sys.init
262 |  400  retAddr for returning to Sys.init from fib(4)
263 |  261  LCL     for restoring Sys.init
264 |  256  ARG     for restoring Sys.init
265 |  0    THIS    for restoring Sys.init
266 |  0    THAT    for restoring Sys.init
- FUNCTION fib(4)
267 |  2    LCL for fib(4) -> ARG for fib(2) (since fib has no locals)
- CALL fib(2) from fib(4)
268 |  218  retAddr for returning to fib(4) from fib(2)
269 |  267  LCL     for restoring fib(4)
270 |  261  ARG     for restoring fib(4)
271 |  0    THIS    for restoring fib(4)
272 |  0    THAT    for restoring fib(4)
- FUNCTION fib(2)
273 |  0    LCL for fib(2) -> ARG for fib(0) (since fib has no locals)
- CALL fib(0) from fib(2)
274 |  218  retAddr for returning to fib(2) from fib(0)
275 |  273  LCL     for restoring fib(2)
276 |  267  ARG     for restoring fib(2)
277 |  0    THIS    for restoring fib(2)
278 |  0    THAT    for restoring fib(2)
- FUNCTION fib(0)
279 |  -1   LCL for fib(0) -> result of LT command (0 < 2), to be tested in
280 |  2    local stack for fib(0), pushed for use by LT command
- RETURN "0" from fib(0) to fib(2) -- SP to 218! see above @274!
      - 16 | 279 (FRAME)
      - 17 | 274 (RET)
281 |  
282 |  
283 |  
284 |  
285 |  
286 |  
287 |  
288 |  
289 |  
290 |  
291 |  
292 |  
293 |  
294 |  
295 |  
296 |  
297 |  
298 |  
299 |  