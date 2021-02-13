import * as path from 'path';
import { VMTranslator } from './VMTranslator';

const filename = process.argv[2];

if (!filename.endsWith('.vm')) {
  console.log('Please provide a .vm file');
  process.exit();
}

const filepath = path.resolve(filename);
VMTranslator.processFile(filepath);
