import { SmartPushPopCommand } from './PushPopCommand';

export class TempCommand extends SmartPushPopCommand {
  protected location = () => (parseInt(this.value) + 5).toString();
}