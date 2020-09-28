`timescale 1ns/1ns
`include "../processador/regBank.v"


module regBank_tb;
    reg WR;
    reg [1:0]rs;
    reg [7:0]data; 
    wire[7:0]regVal;

    regBank rb( //Register bank
        WR,
        rs,
        data,
        regVal
    );

    initial begin
        $monitor("WR = %b, rs = %d, data = %d, regVal = %d", WR, rs, data, regVal);
        //$dumpfile ("testbench/ACControl.vcd");    
	    //$dumpvars(0, ACControl_tb);

        WR = 1;
        rs = 2'b00;
        data = 8'b00111000;

        #20
        WR = 0;
        rs = 2'b00;
        data = 8'b00111111;

        #20
        WR = 1;
        rs = 2'b01;
        data = 8'b00101011;

        #20
        WR = 0;
        rs = 2'b01;
        data = 8'b11101011;

        #20
        WR = 1;
        rs = 2'b10;
        data = 8'b00100011;

        #20
        WR = 0;
        rs = 2'b10;
        data = 8'b11111011;

        #20
        WR = 1;
        rs = 2'b11;
        data = 8'b00000011;

        #20
        WR = 0;
        rs = 2'b11;
        data = 8'b11000011;


        #20
        $monitor("test completed");
    end

endmodule