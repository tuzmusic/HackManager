import VMCommand from '../Commands/VMCommand';

export class FunctionCall extends VMCommand {
  constructor(private funcName: string, private argNum: string) {
    super();
  }
}