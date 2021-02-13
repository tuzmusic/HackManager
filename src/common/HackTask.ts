import fs from 'fs';

export class HackTask {
  static inExtension: string;
  static outExtension: string;
  static taskName: string;
  
  static processFile(filepath: string): void {
    // convert text
    const assembled = this.processText(fs.readFileSync(filepath).toString());
    
    const newFilePath = filepath.replace(this.inExtension, this.outExtension);
    console.log(`${ this.taskName.toUpperCase() }: Creating `, newFilePath.split('/').pop());
    fs.writeFileSync(newFilePath, assembled);
    console.log('Done');
  }
  
  protected static processText(s: string): void {
    throw Error('processText not implemented');
  };
}