`include "../processador/MEM.v"
`timescale 1ns/1ns

module MEM_tb ();
    reg Wr, Wm, Rm, Neq, J, JC;
    reg zeroOut, clock;
    reg [7:0]PC;
    reg [7:0]RegVal;
    reg [7:0]acOutValue;

    output wire [7:0] data_out;
    output wire saidaA;
    output wire Wr_MEM, Rm_MEM;

//    always @(*) begin
//       #5 clock <= ~clock;
//    end

    MEM exec (
        .clock(clock),
        .Wr(Wr), .Wm(Wm), .Rm(Rm), .Neq(Neq), .J(J), .JC(JC),
        .PC(PC),
        .zeroOut(zeroOut),
        .acOutValue(acOutValue),
        .RegVal(RegVal),
        .data_out(data_out),
        .saidaA(saidaA),
        .Wr_MEM, .Rm_MEM(Rm_MEM) 
    );

    initial begin
        $dumpfile("mem_tb.vcd");
        $dumpvars(0,mem_tb);
        clock=1'b1;
        Wr=0;
        Wm=0;
        Rm=0;
        Neq=0;
        J=0;
        JC=0;
        PC=8'b00000000;
        RegVal=8'b00000111;

        #10
        Wr=0;
        Wm=1;
        Rm=0;
        Neq=0;
        J=0;
        JC=0;
        acOutValue=8'b00000000;
        RegVal    =8'b00010000;

        #10
        Wr=0;
        Wm=0;
        Rm=1;
        Neq=0;
        J=0;
        JC=0;
        acOutValue=8'b00000000;
        
        #10 $finish;
    end

endmodule