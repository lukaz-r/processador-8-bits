`timescale 1ns/1ns
`include "processador/acIn.v"

module acIn_tb;

reg[7:0] newData;
reg accept;
wire[7:0] data;

acIn uut(newData, accept, data);

initial begin
    $dumpfile ("testbench/acIn_tb.vcd");    
	$dumpvars(0, acIn_tb);

    newData = 7'b0000001;
    accept = 1'b1;
    #20;

    newData = 7'b0000010;
    accept = 1'b0;
    #20;

    newData = 7'b0000100;
    accept = 1'b1;
    #20;

    newData = 7'b0000101;
    accept = 1'b1;
    #20;

    $display("test completed");


end

endmodule