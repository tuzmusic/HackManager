import VMCommand from './VMCommand';

export class VMBootstrapper extends VMCommand {
  private constructor() {
    super();
    
    this.addLine('// BOOTSTRAP THE SYSTEM');
    
    // set the stack pointer
    this.storeThe.constantValue('256', 'set the start of the stack to addr 256');
    this.addLine('@SP',);
    this.writeThe.storedValue.toMemoryAtCurrentAddress();
    
    // TODO: implement: "call Sys.init"
  }
  
  public static getBootstrapCode = (): string[] =>
    new VMBootstrapper().getLines();
}