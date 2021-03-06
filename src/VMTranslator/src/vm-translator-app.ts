import { VMTranslator } from './VMTranslator';
import * as fs from 'fs';

const pathString = process.argv[2];

if (fs.lstatSync(pathString).isDirectory()) {
  VMTranslator.processFolder(pathString);
} else {
  VMTranslator.processFile(pathString);
}
