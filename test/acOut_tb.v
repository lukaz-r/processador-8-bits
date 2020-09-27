`timescale 1ns/1ns
`include "../processador/acOut.v"

module acOut_tb;

    reg[7:0] newData;
    reg accept;
    wire[7:0] data;


    acOut outAc(newData, accept, data);

    initial begin
        //$dumpfile ("testbench/acOut_tb.vcd");    
        //$dumpvars(0, acOut_tb);
        $monitor("newData = %d, accept = %b, currData = %d", newData,accept,data);

        newData = 8'b00000001;
        accept = 1'b1;
        #20;

        newData = 8'b00000010;
        accept = 1'b0;
        #20;

        newData = 8'b00000100;
        accept = 1'b1;
        #20;

        newData = 8'b00000101;
        accept = 1'b0;
        #20;

        $monitor("test completed");
    end

endmodule