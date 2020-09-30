`include "memorydata.v"
`include "JControl.v"

module MEM(
    clock,
    Wr, Wm, Rm, Neq, J, JC,
    PC,
    rdIn,
    zeroOut,
    acOutValue,
    RegVal,
    data_out,
    jumpOut,
    acOutWb,
    saidaA,
    rdOut,
    Wr_MEM, Rm_MEM,
);
    input clock;
    input Wr, Wm, Rm, Neq, J, JC;
    input zeroOut;
    input [7:0]PC;
    input [1:0]rdIn;
    input [7:0]RegVal;
    input [7:0]acOutValue;

    output reg [1:0]rdOut;
    output reg [7:0] jumpOut;
    output reg Wr_MEM, Rm_MEM;

    output [7:0] data_out;
    output [7:0] acOutWb;
    output saidaA;

    always@(negedge clock) begin
        rdOut = rdIn[1:0];
        jumpOut = PC;
        Rm_MEM = Rm;
        Wr_MEM = Wr;
    end

    jcontrol J_exec(
        .jump(J),
        .jumpC(JC),
        .neq(Neq),
        .zero(zeroOut),
        .saidaA(SaidaA)
    );

    memorydata M_D(
        .Rm(Rm_MEM),
        .Wm(Wm),
        .address(acOutValue),
        .RegVal(RegVal),
        .Data_out(data_out)
    );

endmodule
