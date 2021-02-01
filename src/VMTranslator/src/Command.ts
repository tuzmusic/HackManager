export enum MemorySegment {
  Local = 'LCL',
  Argument = 'ARG',
  This = 'THIS',
  That = 'THAT',
  Temp = '5'
}

export type CmdType = 'push' | 'pop'
export default class Command {
  protected lines: string[] = [];
  public getLines = () => [...this.lines];
  
  push = (value: number) => { throw Error('not implemented'); };
  
  pop = (value: number) => { throw Error('not implemented'); };
  
  protected incrementStack = () => 'SP++';
  
  protected decrementStack = () => 'SP--';
}
