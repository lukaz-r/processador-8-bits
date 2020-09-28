`timescale 1ns/1ns
`include "../processador/mrs.v"


module mrs_tb;
    reg [7:0]inAc; 
    reg [7:0]inMem; 
    reg choice;
    wire [7:0]out;

    mrs mux( 
        inAc,
        inMem,
        choice,
        out
    );

    initial begin
        $monitor("inAc = %d, inMem = %d, choice = %b, out = %d", inAc, inMem, choice, out);
        //$dumpfile ("testbench/ACControl.vcd");    
	    //$dumpvars(0, ACControl_tb);

        inAc = 8'b01011010;
        inMem = 8'b10111100;
        choice = 1;

        #20
        inAc = 8'b01011111;
        inMem = 8'b10111100;
        choice = 0;

        #20
        $monitor("test completed");
    end

endmodule