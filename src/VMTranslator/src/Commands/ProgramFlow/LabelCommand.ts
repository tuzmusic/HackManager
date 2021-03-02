import VMCommand from '../VMCommand';

export class LabelCommand extends VMCommand {
  constructor(label: string) {
    super();
    this.addLine(`(${ label })`);
  }
}