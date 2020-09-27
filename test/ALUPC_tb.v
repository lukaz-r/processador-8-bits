`timescale 1ns/1ns
`include "../processador/ALUPC.v"

module ALUPC_tb;

    reg[7:0] currAddr;
    wire[7:0] nextAddr;

    ALUPC pcALU (currAddr, nextAddr);

    initial begin
        //$dumpfile ("testbench/acOut_tb.vcd");    
        //$dumpvars(0, acOut_tb);
        $monitor("New Address = %d, Current Address = %d", nextAddr, currAddr);

        currAddr = 8'b00000001;
        #20;

        currAddr = 8'b00000100;
        #20;
        
        currAddr = 8'b00100001;
        #20;
        
        currAddr = 8'b00001111;
        #20;

        $monitor("test completed");
    end

endmodule