import VMCommand from '../VMCommand';

export class GotoCommand extends VMCommand {
  constructor(label: string) {
    super();
    this.jumpUnconditionallyTo(label);
  }
}