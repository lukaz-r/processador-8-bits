`include "memorydata.v"
`include "JControl.v"

module MEM(
    clock,
    Wr, Wm, Rm, Neq, J, JC,
    PC,
    rdex,
    zeroOut,
    acOutValue,
    RegVal,
    data_out,
    jumpOut,
    acOutWb,
    saidaA,
    rdmem,
    Wr_MEM, Rm_MEM,
);
    input clock;
    input Wr, Wm, Rm, Neq, J, JC;
    input zeroOut;
    input [7:0]PC;
    input [7:0]RegVal;
    input [7:0]acOutValue;
    input [1:0]rdex;

    output reg [1:0]rdmem;
    output reg [7:0]jumpOut;
    output reg Wr_MEM, Rm_MEM;

    output [7:0] data_out;
    output reg [7:0] acOutWb;
    output saidaA;

    always@(negedge clock) begin
        acOutWb = acOutValue;
        rdmem = rdex;
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
        .clock(clock),
        .Rm(Rm_MEM),
        .Wm(Wm),
        .address(acOutValue),
        .RegVal(RegVal),
        .Data_out(data_out)
    );

endmodule
