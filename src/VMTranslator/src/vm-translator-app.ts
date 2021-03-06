import { VMTranslator } from './VMTranslator';
import * as fs from 'fs';
import * as path from 'path';

const pathString = process.argv[2];

if (fs.lstatSync(pathString).isDirectory()) {
  const thePath = path.resolve(pathString);
  const files = fs.readdirSync(thePath).filter(n => n.endsWith(VMTranslator.inExtension));
  const assembled = files.map(filepath =>
    [`// *** FILE: ${ filepath } ***`, '',
      VMTranslator.processText(fs.readFileSync(filepath).toString())].join('\n'))
    .join('\n\n');
  
  const newFilePath = path.join(thePath, path.basename(thePath) + '.asm');
  console.log(`${ VMTranslator.taskName.toUpperCase() }: Creating`, newFilePath.split('/').pop());
  fs.writeFileSync(newFilePath, assembled);
} else {
  VMTranslator.processFile(pathString);
}
