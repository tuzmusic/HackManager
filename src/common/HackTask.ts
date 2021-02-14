import fs from 'fs';
import path from 'path';

export class HackTask {
  static inExtension: string;
  static outExtension: string;
  static taskName: string;
  
  static processFile(filename: string): void {
    
    if (!filename.endsWith(`.${ this.inExtension }`)) {
      console.log(`Please provide a .${ this.inExtension } file`);
      process.exit();
    }
    
    const filepath = path.resolve(filename);
    
    // convert text
    const assembled = this.processText(fs.readFileSync(filepath).toString());
    
    const newFilePath = filepath.replace(this.inExtension, this.outExtension);
    console.log(`${ this.taskName.toUpperCase() }: Creating`, newFilePath.split('/').pop());
    fs.writeFileSync(newFilePath, assembled);
    console.log('Done');
  }
  
  protected static processText(s: string): void {
    throw Error('processText not implemented');
  };
}