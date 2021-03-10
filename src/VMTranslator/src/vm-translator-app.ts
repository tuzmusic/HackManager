import childProcess from 'child_process';
import { VMTranslator } from './VMTranslator';
import path from 'path';

const cpuEmPath = '~/dev/HackManager/tools/CPUEmulator.sh';
const fixturesPath = '~/dev/HackManager/src/VMTranslator/fixtures/';

function testFile(folderName: string) {
  // find the folder
  const foundPath = childProcess.execSync(`find ${ fixturesPath } -name '${ folderName }'`).toString().trim();
  
  function translate() {
    // check if it's a single-file program
    const vmFilePath = childProcess.execSync(`find ${ fixturesPath } -name '${ folderName }.vm'`).toString().trim();
    
    // translate and create the file
    VMTranslator.processPath(vmFilePath || foundPath);
  }
  
  function testAndPrintResults() {
    // get the paths
    const testFilePath = path.join(foundPath, folderName + '.tst');
    
    // run the test and print the simple result:
    // console.log(`TESTING ${ folderName }:`);
    // result
    try {
      childProcess.execSync(cpuEmPath + ' ' + testFilePath).toString();
      console.log(`✅\s ${ folderName } Passed!`);
    } catch ({ message }) {
      // error is automatically printed to console
      // TODO: print (diff!) out and cmp
    }
  }
  
  translate();
  testAndPrintResults();
}

const filesToTest = [
  'SimpleAdd',
  'StackTest',
  'BasicLoop',
  'FibonacciSeries',
  'BasicTest',
  'PointerTest',
  'SimpleFunction',
  'FibonacciElement',
  'DoubleCall',
];
console.clear();
filesToTest.forEach(testFile);