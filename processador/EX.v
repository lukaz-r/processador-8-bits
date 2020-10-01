`include "controleAlu.v"
`include "mac.v"
`include "ACControl.v"
`include "acIn.v"
`include "ALU.v"
`include "zero.v"
`include "acOut.v"
`include "ALUJump.v"
`include "mfwd.v"

module EX(
    WR, SOUT, WM, RM, NEQ, J, JC, SIN, INA,
    PC,
    regVal,
    sinalExt,
    funct,
    rdIn,
    fwd,
    dataMem,
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
input [1:0] fwd;
input [7:0] dataMem;

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

inout [7:0] muxacin;
inout [7:0] muxulain;

reg [1:0] choiceULA; 
reg [1:0] choiceACIN;

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

mfwd ULASOURCE( //Mux of FWD
    .base(regVal),
    .acout(acOutValue),
    .mem(dataMem),
    .choice(choiceULA),
    .out(muxulain)
);

mfwd ACINSOURCE( //Mux of FWD
    .base(saidaMux),
    .acout(acOutValue),
    .mem(dataMem),
    .choice(choiceACIN),
    .out(muxacin)
);

acIn ACIN( //Main ALU input accumulator
    .newData(muxacin),
    .accept(saidaAc),
    .data(acInValue),
    .clock(clock)
);

ALU ALUMAIN( 
    .entrada1(muxulain),
    .entrada2(acInValue),
    .sinal_ula(sinal_ula),
    .clock(clock),
    .saida_ula(ulaOut),
    .zero(ulaZero)
);

zero ZeroAc( //Zero reg output from the main ALU
    .newVal(ulaZero),
    .accept(SOUT),
    .deny(saidaAc),
    .val(zeroOut),
    .clock(clock)
);

acOut ACOUT( //Main ALU output accumulator
    .newData(ulaOut),
    .accept(SOUT),
    .deny(saidaAc),
    .data(acOutValue),
    .clock(clock)
);

ALUJump ALUJUMP( //Summation of PC and Jump addr
    .inPC(PC),
    .ini(sinalExt),
    .clock(clock),
    .out(ulaJumpOut)
);

initial begin
    WRMem = 0; WMMem = 0; RMMem = 0; NEQMem = 0; JMem = 0; JCMem = 0;
end

always @(*)begin
    rs = regVal;

    if (SIN == 1) begin
        choiceACIN = fwd;
        choiceULA = 2'b00;        
    end else begin
        choiceACIN = 2'b00;
        choiceULA = fwd;
    end

    rdOut = rdIn;
    WRMem = WR; 
    WMMem = WM; 
    RMMem = RM; 
    NEQMem = NEQ; 
    JMem = J; 
    JCMem = JC;
end

endmodule