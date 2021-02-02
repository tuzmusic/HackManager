import Command from './Command';
/*
* add
* sub
* eq
* gt
* lt
* neg
* and
* or
* not
*
* */
type BinaryCommand =
  | 'add'
  | 'sub'
  | 'eq'
  | 'gt'
  | 'lt'

export default class BinaryArithmeticCommand extends Command {
  lines: string[] = [];
  
  constructor(command: BinaryCommand) {
    super('push', 0); // not used! dummy arguments! we just want access to all the helper commands.
    this[command]();
  }
  
  add = () => {
    // add the two items on the top of the stack
    
  };
  
  sub = () => {
  
  };
  
  eq = () => {
  
  };
  
  gt = () => {
  
  };
  
  lt = () => {
  
  };
}