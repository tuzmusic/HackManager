# Hack Programming Tools

Various translators for the Hack Platform from nand2Tetris.

## Prerequisites
Node.js

## Assembler
Translates a file containing hack assembly code (`.asm`) to binary commands executable on the Hack computer, (`.hack`). 

```npm run assembler path/to/assemblyFile.asm```

## VM Translator
Translates a file or folder containing VM code (`.vm`) to hack assembly code (`.asm`).

```npm run translator path/to/vmFile.vm```