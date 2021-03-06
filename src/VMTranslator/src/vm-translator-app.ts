import { VMTranslator } from './VMTranslator';

const pathString = process.argv[2];
VMTranslator.processPath(pathString);
// if (fs.lstatSync(pathString).isDirectory()) {
//   VMTranslator.processFolder(pathString);
// } else {
//   VMTranslator.processFile(pathString);
// }
