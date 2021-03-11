export const memorySegments = {
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