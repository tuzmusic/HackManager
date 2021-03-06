import { FunctionInfo } from '../shared';

export class CallStack {
  private static stack: FunctionInfo[] = [];
  
  public static isEmpty = () => !!CallStack.stack.length;
  
  public static getCallerName = () => CallStack.getTop()?.name;
  
  public static getCallerCounter = () => CallStack.getTop()?.counter;
  
  public static incrementCallerCounter = () => {
    if (CallStack.getTop()) CallStack.getTop().counter++;
  };
  
  public static generateReturnLabel = () => `${ CallStack.getCallerName() }$ret.${ CallStack.getCallerCounter() }`;
  
  public static pushFunction = (funcName: string) => {
    CallStack.incrementCallerCounter();
    CallStack.stack.push({ name: funcName, counter: 0 });
  };
  
  public static popFunction = () => CallStack.stack.pop();
  
  // calling function, before pushing a new function onto the stack.
  private static getTop = () =>
    CallStack.stack.length ? CallStack.stack[CallStack.stack.length - 1] : null;
}