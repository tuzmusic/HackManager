import VMCommand from '../Commands/VMCommand';

/*
Implementation:

LCL = SP // save the location of the stack pointer in LCL

(f) // declare a label for the function entry
  repeat localVarNum times: // initialize the local variables
  PUSH 0    // push to stack? really? not LCL?
* */

export class FunctionDeclaration extends VMCommand {
  constructor(private funcName: string, private localVarNum: string, private lineNum: number = 0) {
    super();
    this.addLabel(this.funcName);
    this.saveLocalPointer();
    this.pushLocalVars();
  }
  
  // have LCL point to the current top of the stack (LCL = SP)
  private saveLocalPointer() {
    this.addLine('@SP');
    this.addLine('D=M', 'store SP value');
    this.addLine('@LCL');
    this.addLine('M=D', 'store stack address in LCL');
  }
  
  // push 0's onto the stack. since `LCL` has just been set to `SP`, these become `LCL[0...localVarNum]`
  private pushLocalVars() {
    const localVarsCount = parseInt(this.localVarNum);
    if (isNaN(localVarsCount)) throw Error('Invalid final argument in function declaration');
    
    for (let i = 0; i < localVarsCount; i++) {
      this.pushThe.valueProvided.ontoStack('0');
    }
  }
}