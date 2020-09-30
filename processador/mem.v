`include "memorydata.v"
`include "JControl.v"

module mem(
    clock,
    Wr, Wm, Rm, Neq, J, JC,
    PC,
    zeroOut,
    acOutValue,
    RegVal,
    data_out,
    saidaA,
    Wr_MEM, Rm_MEM,
);
    input clock;
    input Wr, Wm, Rm, Neq, J, JC;
    input zeroOut;
    input [7:0]PC;
    input [7:0]RegVal;
    input [7:0]acOutValue;
    reg [7:0]acOutValue_MEM;

    output [7:0]data_out;
    output reg Wr_MEM, Rm_MEM;
    output saidaA;

    always@(posedge clock) begin
        Rm_MEM=Rm;
        Wr_MEM=Wr;
        acOutValue_MEM=acOutValue;
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
        .address(acOutValue_MEM),
        .RegVal(RegVal),
        .Data_out(data_out)
    );

endmodule