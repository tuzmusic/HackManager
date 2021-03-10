import childProcess from 'child_process';
import { VMTranslator } from './VMTranslator';

const pathString = process.argv[2];
VMTranslator.processPath(pathString);

function testFile(filepath: string) {
  const cpuEmPath = '~/dev/HackManager/tools/CPUEmulator.sh';
  const fixturesPath = '~/dev/HackManager/src/VMTranslator/fixtures/';
  
  console.log('---');
  console.log(filepath.split('/').pop() + ': ');
  try {
    childProcess.execSync(cpuEmPath + ' ' + fixturesPath + filepath).toString();
    console.log('Passed!');
  } catch ({ message }) {
    // error is automatically printed to console
  }
  console.log('---');
}

testFile('FunctionCalls/FibonacciElement/FibonacciElement.tst');