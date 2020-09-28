`timescale 1ns/1ns
`include "processador/ControlUnit.v"

module controlUnit_tb;

reg[2:0] OPCode;
wire J, JC, INA, RM, WM, SIN, SOUT, WR, NEQ;

controlUnit ctrl(
    .OPCode(OPCode),
    .J(J),
    .JC(JC),
    .INA(INA),
    .RM(RM),
    .WM(WM),
    .SIN(SIN),
    .SOUT(SOUT),
    .WR(WR),
    .NEQ(NEQ)
);

initial begin

    $dumpfile("testbench/ControlUnit_tb.vcd");
    $dumpvars(0, controlUnit_tb);

    OPCode = 3'b000;
    #20;



    $display("test completed");
end

endmodule