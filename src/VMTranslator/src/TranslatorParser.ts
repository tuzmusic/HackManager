import Command from './Command';
import { BinaryArithmeticCommand, BinaryCommand } from './BinaryArithmeticCommand';

export default class TranslatorParser {
  public readonly command: Command;
  
  constructor(private line: string) {
    const parts = line.split(' ');
    
    if (parts.length === 1)
      this.command = new BinaryArithmeticCommand(parts[0] as BinaryCommand);
  }
}