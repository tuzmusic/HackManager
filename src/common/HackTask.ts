import fs from 'fs';
import path from 'path';

export class HackTask {
  static inExtension: string;
  static outExtension: string;
  static taskName: string;
  static filename = 'PlaceholderFilename';
  
  static processFile(filename: string): void {
    this.filename = filename.split('.')[0];
  
    if (!filename.endsWith(`.${ this.inExtension }`)) {
      console.log(`Please provide a .${ this.inExtension } file`);
      process.exit();
    }
  
    const filepath = path.resolve(filename);
  
    // convert text
    const assembled = this.processText(fs.readFileSync(filepath).toString());
  
    // write file
    const newFilePath = filepath.replace(this.inExtension, this.outExtension);
    console.log(`${ this.taskName.toUpperCase() }: Creating`, newFilePath.split('/').pop());
    fs.writeFileSync(newFilePath, assembled);
  
    // write raw file, for matching up line numbers
    const rawPath = newFilePath.replace('.asm', '.raw.asm');
    const rawCode = assembled.split('\n').filter(line => line.trim()
      && !line.startsWith('(')
      && !line.startsWith('//'))
      .join('\n');
  
    fs.writeFileSync(rawPath, rawCode);
    console.log('Done');
  }
  
  protected static processText(s: string): string {
    throw Error('processText not implemented');
  };
}