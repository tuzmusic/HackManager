import childProcess from 'child_process';
import { VMTranslator } from './VMTranslator';
import path from 'path';
import fs from 'fs';

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
  
  function printDiff() {
    const cmpFileLines = fs.readFileSync(path.join(foundPath, folderName + '.cmp')).toString().split('\n');
    const outFileLines = fs.readFileSync(path.join(foundPath, folderName + '.out')).toString().split('\n');
    const pad = 12;
    // print column headers:
    console.log(''.padEnd(pad), cmpFileLines[0]);
    console.log('Expected:'.padEnd(pad), cmpFileLines[1]);
    console.log('Actual:'.padEnd(pad), outFileLines[1]);
  }
  
  function testAndPrintResults() {
    // get the paths
    const testFilePath = path.join(foundPath, folderName + '.tst');
    
    // run the test and print the simple result:
    // console.log(`TESTING ${ folderName }:`);
    // result
    try {
      childProcess.execSync(cpuEmPath + ' ' + testFilePath, { stdio: 'ignore' })?.toString();
      console.log(`✅\s ${ folderName } Passed!`);
    } catch ({ message, ...e }) {
      console.log(`❌  ${ folderName } Failed`);
      printDiff();
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
  'DoubleCall',
  'FibonacciElement',
  'NestedCall',
  'StaticsTest'
];
console.clear();
filesToTest.forEach(testFile);