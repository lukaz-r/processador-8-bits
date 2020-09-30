`include "controleAlu.v"
`include "mac.v"
`include "ACControl.v"
`include "acIn.v"
`include "ALU.v"
`include "zero.v"
`include "acOut.v"
`include "ALUJump.v"

module EX(
    WR, SOUT, WM, RM, NEQ, J, JC, SIN, INA,
    PC,
    regVal,
    sinalExt,
    funct,
    rdIn,
    clock,
    zeroOut,
    acOutValue,
    ulaJumpOut,
    rs,
    rdOut,
    WRMem, WMMem, RMMem, NEQMem, JMem, JCMem
);

input WR, SOUT, WM, RM, NEQ, J, JC, SIN, INA, clock;
input [7:0] PC;
input [7:0] regVal;
input [7:0] sinalExt;
input [2:0] funct;
input [1:0] rdIn;

output wire zeroOut;
output wire [7:0] acOutValue;
output wire  [7:0] ulaJumpOut;
output reg [7:0] rs;
output reg [1:0] rdOut;
output reg WRMem, WMMem, RMMem, NEQMem, JMem, JCMem;

inout [2:0] sinal_ula;
inout twoandOne, escolhaMux, saidaAc, ulaZero;
inout [7:0] saidaMux;
inout [7:0] acInValue;
inout [7:0] ulaOut;

controleAlu ALUControl(
    .opAlu(funct),
    .twoandOne(twoandOne),
    .sinal_ula(sinal_ula)
);

ACControl ACC( //Main ULA input accumulator control unit
    .jump(J),
    .jumpC(JC),
    .sin(SIN),
    .InA(INA),
    .twone(twoandOne),
    .saidaMux(escolhaMux),
    .saidaAc(saidaAc)
);

mac MUX( //Mux of main ALU output accumulator data source
    .inReg(regVal),
    .ini(sinalExt),
    .choice(escolhaMux),
    .out(saidaMux)
);

acIn ACIN( //Main ALU input accumulator
    .newData(saidaMux),
    .accept(saidaAc),
    .data(acInValue),
    .clock(clock)
);

ALU ALUMAIN( 
    .entrada1(regVal),
    .entrada2(acInValue),
    .sinal_ula(sinal_ula),
    .clock(clock),
    .saida_ula(ulaOut),
    .zero(ulaZero)
);

zero ZeroAc( //Zero reg output from the main ALU
    .newVal(ulaZero),
    .accept(SOUT),
    .val(zeroOut),
    .clock(clock)
);

acOut ACOUT( //Main ALU output accumulator
    .newData(ulaOut),
    .accept(SOUT),
    .data(acOutValue),
    .clock(clock)
);

ALUJump ALUJUMP( //Summation of PC and Jump addr
    .inPC(PC),
    .ini(sinalExt),
    .clock(clock),
    .out(ulaJumpOut)
);

always @(negedge clock)begin
    rs = regVal;
    rdOut = rdIn;
    WRMem = WR; 
    WMMem = WM; 
    RMMem = RM; 
    NEQMem = NEQ; 
    JMem = J; 
    JCMem = JC;
end

endmodule