`timescale 1ns/1ns
`include "../processador/mac.v"


module mac_tb;
    reg [7:0]inReg; 
    reg [7:0]ini; 
    reg choice;
    wire[7:0] out;

    mac mux( 
        inReg,
        ini,
        choice,
        out
    );

    initial begin
        $monitor("inReg = %d, ini = %d, choice = %b, out = %d", inReg, ini, choice, out);
        //$dumpfile ("testbench/ACControl.vcd");    
	    //$dumpvars(0, ACControl_tb);

        inReg = 8'b00000010;
        ini = 8'b00011100;
        choice = 1;

        #20
        inReg = 8'b00011110;
        ini = 8'b00000111;
        choice = 0;


        #20
        $monitor("test completed");
    end

endmodule