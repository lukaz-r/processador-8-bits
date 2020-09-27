`timescale 1ns/1ns
`include "../processador/ALUJump.v"

module ALUJump_tb;

    reg[7:0] inPc;
    reg[7:0] ini;
    wire[7:0] out;

    ALUJump pcALU (inPc, ini, out);

    initial begin
        //$dumpfile ("testbench/acOut_tb.vcd");    
        //$dumpvars(0, acOut_tb);
        $monitor("PC = %d, Imediate = %d, Final Addr = %d", inPc, ini, out);

        inPc = 8'b00000001;
        ini = 8'b10000000;
        #20;

        inPc = 8'b00001111;
        ini = 8'b00000100;
        #20;

        inPc = 8'b01100001;
        ini = 8'b10001100;
        #20;

        inPc = 8'b00000011;
        ini = 8'b10000100;
        #20;

        $monitor("test completed");
    end

endmodule