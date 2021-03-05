import VMCommand from '../VMCommand';

export class GotoCommand extends VMCommand {
  constructor(label: string) {
    super();
    // set jump destination
    this.addJumpDestination(label);
    // jump
    this.addLine('0;JMP');
  }
}