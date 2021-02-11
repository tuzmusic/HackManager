export enum MemorySegment {
  // todo: we need to read a memory segment name (full word, lowercase) from a Translator command
  //  and then parse it into Assembly using its abbreviation.
  //  So this doesn't actually work (although javascript itself doesn't really know that)
  Local = 'LCL',
  Argument = 'ARG',
  This = 'THIS',
  That = 'THAT',
  Temp = '5'
}

export type CmdType = 'push' | 'pop'