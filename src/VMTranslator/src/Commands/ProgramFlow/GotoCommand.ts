import VMCommand from '../VMCommand';

export class GotoCommand extends VMCommand {
  constructor(label: string) {
    super();
    // set jump destination
    this.jumpUnconditionallyTo(label);
    // jump
    // this.addLine('0;JMP');
  }
}