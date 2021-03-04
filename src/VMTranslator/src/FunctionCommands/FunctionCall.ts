import VMCommand from '../Commands/VMCommand';

/*
Implementation:
  push return-address   // using label declared below
  push LCL              // Save LCL of the calling function
  push ARG              // Save ARG of the calling function
  push THIS             // Save THIS of the calling function
  push THAT             // Save THAT of the calling function
  ARG = SP-n-5          // reposition ARG (n = number of args)
  LCL = SP              // reposition LCL
  goto f                // jump to the function
(return-address)        // declare the label for the return address
* */

export class FunctionCall extends VMCommand {
  constructor(private funcName: string, private argNum: string) {
    super();
  }
}