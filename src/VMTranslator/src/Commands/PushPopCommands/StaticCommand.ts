import { VMTranslator } from '../../VMTranslator';
import { SmartPushPopCommand } from './PushPopCommand';

export default class StaticCommand extends SmartPushPopCommand {
  protected location = () => [VMTranslator.filename, this.value].join('.');
}