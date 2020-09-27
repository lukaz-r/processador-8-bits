 `timescale 1ns/1ns
 `include "../processador/ALU.v"

 module ALU_tb();
     reg[7:0] entrada1;
     reg[7:0] entrada2;
     reg[2:0] sinal_ula;
     wire[7:0] saida_ula;
     wire zero;

     ALU alu( //main ALU
         .entrada1(entrada1),
         .entrada2(entrada2),
         .sinal_ula(sinal_ula),
         .saida_ula(saida_ula),
         .zero(zero)
     );

     initial begin
         //$dumpfile ("testbench/ALU_tb.vcd");    
         //$dumpvars(0, ALU_tb);
       
         $monitor("In1 = %d, In2 = %d, OpCode = %d, Out = %d, zero = %b", entrada1, entrada2, sinal_ula, saida_ula, zero);

         // AND
         entrada1 = 8'b00000110;
         entrada2 = 8'b00000011;
         sinal_ula = 3'b000;
         #20;
         
         // OR
        
         entrada1 = 8'b00000100;
         entrada2 = 8'b00001011;
         sinal_ula = 3'b001;
         #20;

         //ADD
         entrada1 = 8'b00000110;
         entrada2 = 8'b00011111;
         sinal_ula = 3'b010;
         #20;

         //SUB
         entrada1 = 8'b00000100;
         entrada2 = 8'b00000100;
         sinal_ula = 3'b011;
         #20;

         //SUB
         entrada1 = 8'b00010111;
         entrada2 = 8'b00000100;
         sinal_ula = 3'b011;
         #20;

         //SLT
         entrada1 = 8'b00000100;
         entrada2 = 8'b00000111;
         sinal_ula = 3'b100;
         #20;

         //SLT
         entrada1 = 8'b00000101;
         entrada2 = 8'b00000100;
         sinal_ula = 3'b100;
         #20;
         
         $display("test completed");
     end

 endmodule