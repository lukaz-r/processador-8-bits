`timescale 1ns/1ns
`include "../processador/mpc.v"


module mpc_tb;
    reg [7:0]pcp; 
    reg [7:0]pcj; 
    reg choice;
    wire[7:0] out;

    mpc mux( 
        pcp,
        pcj,
        choice,
        out
    );

    initial begin
        $monitor("PCp = %d, PCJ = %d, choice = %b, out = %d", pcp, pcj, choice, out);
        //$dumpfile ("testbench/ACControl.vcd");    
	    //$dumpvars(0, ACControl_tb);

        pcp = 8'b00000010;
        pcj = 8'b01111100;
        choice = 1;

        #20
        pcp = 8'b00001110;
        pcj = 8'b01111100;
        choice = 0;


        #20
        $monitor("test completed");
    end

endmodule