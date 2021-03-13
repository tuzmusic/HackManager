import { SmartPushPopCommand } from './PushPopCommand';

export class PointerCommand extends SmartPushPopCommand {
  protected location = () => this.value === '0' ? 'THIS' : 'THAT';
}