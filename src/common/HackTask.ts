import fs from 'fs';
import path from 'path';

export class HackTask {
  static inExtension: string;
  static outExtension: string;
  static outPath: string;
  static taskName: string;
  static filename = 'PlaceholderFilename';
  static processed: string;
  
  static processPath(pathString: string): void {
    if (fs.lstatSync(pathString).isDirectory()) {
      this.processFolder(pathString);
    } else {
      this.processFile(pathString);
    }
  }
  
  static processFile(filename: string): void {
    this.filename = path.parse(filename).name;
    
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
    
    // console.log('Done');
  }
  
  static processFolder(pathString: string): void {
    const thePath = path.resolve(pathString);
    const files = fs.readdirSync(thePath).filter(n => n.endsWith(this.inExtension));
  
    // perform task
    this.processed = files.map(filepath => {
      this.filename = path.parse(filepath).name;
    
      const header = `\n// *** FILE: ${ filepath } ***`;
      const processedText = this.processText(fs.readFileSync(path.resolve(thePath, filepath)).toString());
      return [header, '', processedText].join('\n');
    })
      .join('\n\n');
  
    // write file
    this.outPath = path.join(thePath, path.basename(thePath) + '.' + this.outExtension);
    console.log(`${ this.taskName.toUpperCase() }: Creating`, this.outPath.split('/').pop());
    fs.writeFileSync(this.outPath, this.processed);
  }
  
  protected static processText(s: string): string {
    throw Error('processText not implemented');
  };
}