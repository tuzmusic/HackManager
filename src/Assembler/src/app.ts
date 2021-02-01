import * as path from 'path';
import { Assembler } from './Assembler';

const filename = process.argv[2];

if (!filename.endsWith('.asm')) {
  console.log('Please provide a .asm file');
  process.exit();
}

const filepath = path.resolve(filename);
Assembler.assembleFile(filepath);
