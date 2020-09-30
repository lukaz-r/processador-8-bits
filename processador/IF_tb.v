`timescale 1ns/1ns
`include "IF.v"

module IF_tb;
    reg[7:0] addrJump;
    reg choice_mux;

    reg clock;

    output wire[7:0] inst;
    output wire[7:0] pc_calc;

    IF IFMOD(
        .clock(clock), 
        .pcj_mux(addrJump), 
        .choice_mux(choice_mux),
        .inst(inst), 
        .pc_calc(pc_calc)
    );

    always begin
        #5 clock = ~clock;
    end

    initial begin
        //$dumpfile ("processador/IF_tb.vcd");    
	    //$dumpvars(0, IF_tb);
        $monitor("addrJump = %d, MuxOpt = %b, Clock = %b\ninst = %d, PC_calc = %d",addrJump, choice_mux, clock, inst, pc_calc);
        clock = 1;
        addrJump = 8'b00011100;
        choice_mux = 1'b0;

        #10
        addrJump = 8'b00001100;
        choice_mux = 1'b0;

        #10
        addrJump = 8'b00000001;
        choice_mux = 1'b1;

        #10
        addrJump = 8'b00010000;
        choice_mux = 1'b0;

        #10
        addrJump = 8'b11010100;
        choice_mux = 1'b0;


        #5
        $display("Test completed!");
        $finish;
    end

endmodule