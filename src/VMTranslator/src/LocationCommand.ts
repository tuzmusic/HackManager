import Command, { CmdType, MemorySegment } from './Command';

export default class LocationCommand extends Command {
  constructor(segment: MemorySegment, command: CmdType, value: number) {
    super();
  }
}