`timescale 1ns/1ns
`include "../processador/controleAlu.v"

module controleAlu_tb();
    reg[2:0] opAlu;
    wire twoandOne;
    wire[2:0] sinal_ula;

    controleAlu control(
        opAlu,
        twoandOne,
        sinal_ula
    );
     
     initial begin
         //$dumpfile ("testbench/ALU_tb.vcd");    
         //$dumpvars(0, ALU_tb);      
        $monitor("opAlu = %d, twoandOne = %b, sinal_ula = %d", opAlu, twoandOne, sinal_ula);
        
        // AND
        opAlu = 3'b000;
        #20;
         
        // OR
        opAlu = 3'b001;
        #20;

        //ADD
        opAlu = 3'b010;
        #20;

        //SUB
        opAlu = 3'b011;
        #20;

        //SLT
        opAlu = 3'b100;
        #20;

        //MF
        opAlu = 3'b110;
        #20;         
         $display("test completed");
     end

 endmodule