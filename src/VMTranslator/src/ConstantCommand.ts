import Command, { CmdType } from './Command';

export default class ConstantCommand extends Command {
  constructor(private type: CmdType, private value: number) {
    super();
    this.lines = [
      '@' + value,
      'D=A',
      '@SP',
      'A=M',
      'M=D',
      '@SP',
      'M=M+1',
    ];
    
  }
}