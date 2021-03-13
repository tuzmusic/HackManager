import { VMTranslator } from '../../VMTranslator';
import { PushPopCommand } from './PushPopCommand';

export const smartCommands = {
  'static': (value: string) => [VMTranslator.filename, value].join('.'),
  'pointer': (value: string) => value === '0' ? 'THIS' : 'THAT',
  'temp': (value: string) => (parseInt(value) + 5).toString()
};

export class SmartPushPopCommand extends PushPopCommand {
  protected push = () => this.pushThe.valueAtLocation.ontoStack(this.value);
  protected pop = () => this.popStack.toAddress(this.value);
}

export type SmartCommand = keyof typeof smartCommands;