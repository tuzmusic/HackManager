import VMCommand from '../Commands/VMCommand';

export class FunctionDeclaration extends VMCommand {
  constructor(private funcName: string, private argNum: string) {
    super();
  }
}