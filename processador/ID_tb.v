`timescale 1ns/1ns
`include "ID.v"

module ID_tb;
    reg [7:0]PC; 
    reg [7:0]inst; 
    reg [7:0]data; 
    reg WR, clock;

    wire [7:0]regVal; 
    wire [7:0]extsinal; 
    wire [2:0]funct; 
    wire J, Jc, INA, RM, WM, SIN, SOUT, WROut, NEQ; 
    wire [7:0]PCout;

    ID stageid(
        .PC(PC),
        .inst(inst),
        .data(data),
        .WR(WR),
        .clock(clock),
        .regVal(regVal),
        .extsinal(extsinal),
        .funct(funct),
        .J(J), .JC(JC), .INA(INA), .RM(RM), .WM(WM), .SIN(SIN), .SOUT(SOUT), .WROut(WROut), .NEQ(NEQ),
        .PCout(PCout)
    );

    always begin
        #5 clock = ~clock;
    end

    initial begin
        $monitor("Inputs: PC = %d, Inst = %d, Data %d, WR = %b, Clock = %b; Outputs - RegVal = %d, SinalExt = %d, funct = %d, PCout = %d; Control - J = %b, JC =%b, INA = %b, RM = %b, WM = %b, SIN = %b, SOUT = %b, WROut = %b, NEQ = %b", PC, inst, data, WR, clock,regVal, extsinal, funct, PCout,J, Jc, INA, RM, WM, SIN, SOUT, WROut, NEQ);
        clock = 1'b1;

        PC = 8'b00001111;
        inst = 8'b00000000;
        data = 8'b01010101;
        WR = 1'b0;

        #10
        PC = 8'b00010000;
        inst = 8'b00010010;
        data = 8'b01010101;
        WR = 1'b1;

        #10
        PC = 8'b00010001;
        inst = 8'b00010110;
        data = 8'b01011111;
        WR = 1'b0;  

        #10
        $finish;
    end
endmodule