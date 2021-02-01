API:

- arithmetic
    - push [value]/[variable]
    - pop [value]/[variable]
    - arithmetic: add / sub / neg
    - comparison: eq / gt / lt / and / or / not
- memory manipulation
    - push [location] [value]
        - `push constant i`
            - Logic: `*SP = i; SP++`
            - Hack:
              ```
                @i  // D=i
                D=A
                @SP // *SP=D
                A=M
                M=D
                @SP // SP++
                M=M+1
              ```
    - pop [location] [value]
    - locations:
        - local
            - `pop local i`: `addr=LCL+i, SP--, *addr=*SP`
            - `push local i`: `addr=LCL+i, *addr=*SP, SP++`
        - argument: *same as local*
        - this: *same as local*
        - that: *same as local*
        - constant
            - `push constant i`
                - Logic: `*SP = i; SP++`
                    - Hack:
                      ```
                        @i  // D=i
                        D=A
                        @SP // *SP=D
                        A=M
                        M=D
                        @SP // SP++
                        M=M+1
                      ```
        - static
            - `pop static i`
              ```
              // D=stack.pop (code omitted)
              @Filename.i
              M=D
              ```
        - pointer
        - temp

Locations:
- 