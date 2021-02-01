import { SymbolTableInterface } from './Interfaces';
import { SYMBOL_TABLE } from './constants';

export class SymbolTable implements SymbolTableInterface {
  private table: Record<string, number> = Object.assign({}, SYMBOL_TABLE); // copy by value!!!
  private nextFreeSpot = 16;

  getValueFor = (entry: string): number => this.table[entry];

  add = (label: string, lineNum?: number): void => {
    this.table[label] = lineNum ?? this.nextFreeSpot++;
  };
}
