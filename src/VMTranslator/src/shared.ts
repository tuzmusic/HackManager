export enum MemorySegment {
  Local = 'LCL',
  Argument = 'ARG',
  This = 'THIS',
  That = 'THAT',
  Temp = '5'
}

export type CmdType = 'push' | 'pop'