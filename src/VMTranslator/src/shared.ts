export const memorySegments = {
  // todo: we need to read a memory segment name (full word, lowercase) from a Translator command
  //  and then parse it into Assembly using its abbreviation.
  //  So this doesn't actually work (although javascript itself doesn't really know that)
  local: 'LCL',
  argument: 'ARG',
  this: 'THIS',
  that: 'THAT',
  temp: '5'
};

export type MemorySegment = keyof typeof memorySegments;

export const cmdTypes = ['push', 'pop'] as const;
export type CmdType = typeof cmdTypes[number]
export type FunctionInfo = { name: string; counter: number };