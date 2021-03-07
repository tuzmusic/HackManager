export class CallStack {
  /**
   * Count all calls to all functions, so that the return label is always unique.
   * There's no reason to track each function's call count, all this label has to
   * be is UNIQUE.
   * @private
   */
  private static callCounter = 0;
  private static stack: string[] = [];
  
  public static isEmpty = (): boolean => !!CallStack.stack.length;
  
  public static getCallerName = (): string => CallStack.getTop();
  
  public static generateReturnLabel = () => `${ CallStack.getCallerName() }$ret.${ CallStack.callCounter }`;
  
  public static pushFunction = (funcName: string) => {
    CallStack.callCounter++;
    // CallStack.incrementCallerCounter();
    CallStack.stack.push(funcName);
  };
  
  public static popFunction = () => CallStack.stack.pop();
  
  // calling function, before pushing a new function onto the stack.
  private static getTop = () =>
    CallStack.stack.length ? CallStack.stack[CallStack.stack.length - 1] : null;
}