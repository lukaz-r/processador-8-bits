`include "../processador/memoryinstruction_.v"
`timescale 1ns/1ns

module memoryinstruction_tb ();
    reg [7:0]PCinst; // valor recebido do PCinst
    wire [2:0]OPCode;
    wire [1:0]Rs;
    wire [4:0]Four_Zero_Bits; 

    memoryinstruction_ t01 (.PCinst(PCinst), .OPCode(OPCode), .Rs(Rs),.Four_Zero_Bits(Four_Zero_Bits));

    initial begin
        $dumpfile("memoryinstruction_tb.vcd");
        $dumpvars(0,memoryinstruction_tb);
        
        #5 //tempo 05
        PCinst = 8'b00000000; 
        $monitor("PCinst=%b,\t OPCode=%b,\t Rs=%b,\t Four_Zero_Bits=%b",PCinst,OPCode,Rs,Four_Zero_Bits);
        #5 //tempo 10
        PCinst = 8'b10000001;
        $monitor("PCinst=%b,\t OPCode=%b,\t Rs=%b,\t Four_Zero_Bits=%b",PCinst,OPCode,Rs,Four_Zero_Bits);
        #5 //tempo 15
        PCinst = 8'b00010010;
        $monitor("PCinst=%b,\t OPCode=%b,\t Rs=%b,\t Four_Zero_Bits=%b",PCinst,OPCode,Rs,Four_Zero_Bits);
        #5 //tempo 20
        PCinst = 8'b00001011;
        $monitor("PCinst=%b,\t OPCode=%b,\t Rs=%b,\t Four_Zero_Bits=%b",PCinst,OPCode,Rs,Four_Zero_Bits);
        #5 //tempo 25
        PCinst = 8'b00000100;
        $monitor("PCinst=%b,\t OPCode=%b,\t Rs=%b,\t Four_Zero_Bits=%b",PCinst,OPCode,Rs,Four_Zero_Bits);

    end

endmodule
