`timescale 1ns/1ns
`include "processador/pc.v"

module pc_tb;

reg[7:0] novoEnd;
wire[7:0] endAtual;

pc uut(novoEnd, endAtual);

initial begin
        $dumpfile ("testbench/pc_tb.vcd");    
		$dumpvars(0, pc_tb);
        #20;

        novoEnd = 7'b0000010;
        #20;

        novoEnd = 7'b0000011;
        #20;

        novoEnd = 7'b0000100;
        #20;

        $display("Test Completed");
    end

endmodule
