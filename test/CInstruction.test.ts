import { CInstruction } from '../src/CInstruction';

describe('C Instructions', () => {
  const parsedC = (comp: string, dest: string = '', jump: string = ''): string =>
    new CInstruction(comp, dest, jump).getMachineCode();
  
  it('noJump', () => {
      // D=M
      expect(parsedC('M', 'D')).toEqual('111' + '1110000' + '010' + '000');
      // AD=1
      expect(parsedC('1', 'AD')).toEqual('111' + '0111111' + '110' + '000');
    },
  );
  it('noDest', () => {
      // 0;JMP
      expect(parsedC('0', '', 'JMP')).toEqual('111' + '0101010' + '000' + '111');
      // D+M;JEQ
      expect(parsedC('D+M', '', 'JEQ')).toEqual('111' + '1000010' + '000' + '010');
      // A;JLT
      expect(parsedC('A', '', 'JLT')).toEqual('111' + '0110000' + '000' + '100');
    },
  );
  it('fullInstruction', () => {
    // M=0;JMP
    expect(parsedC('0', 'M', 'JMP')).toEqual('111' + '0101010' + '001' + '111');
    // A=D+M;JEQ
    expect(parsedC('D+M', 'A', 'JEQ')).toEqual('111' + '1000010' + '100' + '010');
    // AD=A;JLT
    expect(parsedC('A', 'AD', 'JLT')).toEqual('111' + '0110000' + '110' + '100');
  });
  
});
