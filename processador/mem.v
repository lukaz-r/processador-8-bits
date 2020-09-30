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
    acOutWb,
    saidaA,
    rdOut,
    Wr_MEM, Rm_MEM,
);
    input clock;
    input Wr, Wm, Rm, Neq, J, JC;
    input zeroOut;
    input [7:0]PC;
    input[1:0] rdIn;
    input [7:0]RegVal;
    input [7:0]acOutValue;

    output [7:0] data_out;
    output [7:0] acOutWb;
    output [1:0] rdOut;
    output reg Wr_MEM, Rm_MEM;
    output saidaA;

//    always@(posedge clock) begin
    always@(negedge clock) begin
        rdOut = rdIn;
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
