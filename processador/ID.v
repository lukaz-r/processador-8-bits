`include "regBank.v"
`include "extsinal5p8.v"
`include "ControlUnit.v"

module ID(
    PC,
    inst,
    data,
    WR,
    clock,
    regVal,
    extsinal,
    funct,
    rd,
    J, JC, INA, RM, WM, SIN, SOUT, WROut, NEQ,
    PCout
);

    input[7:0] PC;
    input[7:0] inst;
    input[7:0] data;
    input WR, clock;
    
    output wire[7:0] regVal;
    output wire[7:0] extsinal;
    output reg [1:0] rd;
    output wire J, JC, INA, RM, WM, SIN, SOUT, WROut, NEQ;
    
    output reg[2:0] funct;
    output reg[7:0] PCout;

    regBank RB( //Register bank
        .WR(WR),
        .clock(clock),
        .rs(inst[4:3]),
        .rd(rd),
        .data(data),
        .regVal(regVal)
    );

    extsinal5p8 ext(
        .entrada(inst[4:0]),
        .saida(extsinal)
    );

    controlUnit control(
        .OPCode(inst[7:5]),
        .J(J),
        .JC(JC),
        .INA(INA),
        .RM(RM),
        .WM(WM),
        .SIN(SIN),
        .SOUT(SOUT),
        .WR(WROut),
        .NEQ(NEQ)
    );

    always @(*) begin
        rd = inst[4:3];
        funct = inst[2:0];
        PCout = PC;
    end
endmodule