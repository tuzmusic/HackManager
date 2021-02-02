## API

- arithmetic
    - push [value]/[variable]
    - pop [value]/[variable]
    - arithmetic: add / sub / neg
    - comparison: eq / gt / lt / and / or / not
- memory manipulation
    - push [location] [value]
    - pop [location] [value]
    - locations:
        - local
            - `push local i`: `addr=LCL+i, *SP=*addr, SP++`
            - `pop local i`: `addr=LCL+i, SP--, *addr=*SP`
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
            - `push static i` (right?)
        - pointer
            - `push pointer 0`: `*SP=THIS, SP++`
            - `pop pointer 0`: `SP--, *SP=THIS`
            - `push pointer 1`: `*SP=THAT, SP++`
            - `pop pointer 1`: `SP--, *SP=THAT`
            - "implementation supplies `THIS` and `THAT`"
        - temp
            - RAM locations 5-12, so `addr=5+i` etc.

## Implementation - Classes/Interfaces

### `class Translator`

- Reads file.
- For each line, runs `LineTranslator.translate(line)`
    - Maybe this class adds the comment. But that doesn't necessarily actually make sense. It does seem to *belong* in
      the worker class.

### `class LineTranslator`

Parses the line to determine the type of command, and delegates generation of the assembly code.

- `translate: (line: string) -> string` (Or `string[]`?)
    - writes the line itself as a comment
- `lines: string[]`
    - Lines are written in place, and `translate` returns `this.lines`
    - OR, `Translator(line)` performs the translation (RAII-ish), writing to `this.lines` as it goes. The lines are
      accessed with `getLine()` or `getText()` (which returns all the lines as a single string)
    - Parsing and translating
        - Uses a `Command` object

### `class Command`

Generates assembly code for a command

- `lines: string[] = []`
- `incrementStack()`: implements `SP++`
- `decrementStack()`: implements `SP--`

#### `enum MemorySegment`

#### `class LocationCommand extends Command`

Because the location commands only vary in the address, this can probably be implemented using the argument and doesn't
need subclassing.

- `constructor(segment: MemorySegment, command: PushOrPop, value: number`
- `push/pop(val: number)` - implements `push/pop [location] [val]`, writing to `this.lines` as it goes

#### `class StaticCommand extends Command`

Implements `push/pop static i` (see notes above)

#### `class ArithmeticCommand extends Command`

Subclassed for each command, probably. TBD

#### `class ConstantCommand extends Command` (`push val`)

TBD

#### `class PointerCommand extends Command` (`push val`)

TBD

#### `class SimpleCommand extends Command` (`push val`)

TBD