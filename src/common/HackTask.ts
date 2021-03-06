import fs from 'fs';
import path from 'path';

export class HackTask {
  static inExtension: string;
  static outExtension: string;
  static outPath: string;
  static taskName: string;
  static filename = 'PlaceholderFilename';
  static processed: string;
  
  static processFile(filename: string): void {
    this.filename = filename.split('.')[0];
  
    if (!filename.endsWith(`.${ this.inExtension }`)) {
      console.log(`Please provide a .${ this.inExtension } file`);
      process.exit();
    }
  
    const filepath = path.resolve(filename);
  
    // convert text
    this.processed = this.processText(fs.readFileSync(filepath).toString());
  
    // write file
    this.outPath = filepath.replace(this.inExtension, this.outExtension);
    console.log(`${ this.taskName.toUpperCase() }: Creating`, this.outPath.split('/').pop());
    fs.writeFileSync(this.outPath, this.processed);
  
    this.writeRawFile();
    console.log('Done');
  }
  
  static writeRawFile(): void {
    // write raw file, for matching up line numbers
    const rawPath = this.outPath.replace(this.outExtension, 'raw.' + this.outExtension);
    
    // remove comments and blank lines
    const rawCode = this.processed.split('\n').filter(line => line.trim() && !line.startsWith('//'))
      .join('\n');
    
    fs.writeFileSync(rawPath, rawCode);
  }
  
  static processFolder(pathString: string): void {
    const thePath = path.resolve(pathString);
    const files = fs.readdirSync(thePath).filter(n => n.endsWith(this.inExtension));
    
    // perform task
    this.processed = files.map(filepath =>
      [`// *** FILE: ${ filepath } ***`, '',
        this.processText(fs.readFileSync(filepath).toString())].join('\n'))
      .join('\n\n');
    
    // write file
    this.outPath = path.join(thePath, path.basename(thePath) + '.' + this.outExtension);
    console.log(`${ this.taskName.toUpperCase() }: Creating`, this.outPath.split('/').pop());
    fs.writeFileSync(this.outPath, this.processed);
    
    this.writeRawFile();
  }
  
  protected static processText(s: string): string {
    throw Error('processText not implemented');
  };
}