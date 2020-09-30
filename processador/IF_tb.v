`timescale 1ns/1ns
`include "processador/IF.v"

module IF_tb;
 
    reg [7:0] PC_inst;
    reg [7:0] novo_End;
    reg [7:0] pcp_mux, pcj_mux; 
    reg choice_mux; 
    reg [7:0] in_PC;

    output wire [2:0] OpCode;          
    output wire [1:0] Rs_inst;                 
    output wire [4:0] fourZero_Bits; 
    output wire [7:0] end_Atual;
    output wire [7:0] out_mux;
    output wire [7:0] out_alu;


    IF exec(
        PC_inst, // entrada mem de isnt
        novo_End, // entrada end pc
        pcp_mux, pcj_mux, choice_mux,
        in_PC, //entrada da ula vinda de pc

        OpCode, Rs_inst, fourZero_Bits, 
        end_Atual,
        out_mux,
        out_alu,
    );


    initial begin
        $dumpfile ("processador/IF_tb.vcd");    
	    $dumpvars(0, IF_tb);

        novo_End = 8'b00000010;

        #10 
        in_PC = novo_End;

        $display("Test completed!");
    end

endmodule