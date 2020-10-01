module memoryinstruction(
    clock,
    pccounter,
    saidaInstrucao
);

    input clock;
    input [7:0] pccounter;
    output reg [7:0] saidaInstrucao;

    reg [7:0] armazenarinstrucoes [256:0];

    initial begin
        armazenarinstrucoes[0] <= 8'b00000000;
        armazenarinstrucoes[1] <= 8'b00100111;  // MFI 7
        armazenarinstrucoes[2] <= 8'b00000010;  // SUM $s0
        armazenarinstrucoes[3] <= 8'b11001000;  // MB $s1
        armazenarinstrucoes[4] <= 8'b00101110;  // MFI 14
        armazenarinstrucoes[5] <= 8'b00001010;  // SUM $t0
        armazenarinstrucoes[6] <= 8'b11010000;  // MB $t0
        armazenarinstrucoes[7] <= 8'b00101000;  // MFI 8
        armazenarinstrucoes[8] <= 8'b00001001;  // OR $s1
        armazenarinstrucoes[9] <= 8'b11011000;  // MB $t1
        armazenarinstrucoes[10] <= 8'b00100000; // MFI 0
        armazenarinstrucoes[11] <= 8'b00000010; // AND $s0
        armazenarinstrucoes[12] <= 8'b01010000; // MW $t0
        armazenarinstrucoes[13] <= 8'b01100000; // MR $s0
        armazenarinstrucoes[14] <= 8'b00100010; // MFI 2
        armazenarinstrucoes[15] <= 8'b00011000; // SLT $t1
        armazenarinstrucoes[16] <= 8'b00011000; // MB $s1
        armazenarinstrucoes[17] <= 8'b00000000; //
        armazenarinstrucoes[18] <= 8'b00000000; //
        armazenarinstrucoes[19] <= 8'b00000000; //
        armazenarinstrucoes[20] <= 8'b00000000; //
    end

    always @(posedge clock)begin
        saidaInstrucao = armazenarinstrucoes[pccounter];
    end
 
endmodule 