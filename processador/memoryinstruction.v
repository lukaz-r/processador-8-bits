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
        armazenarinstrucoes[1] <= 8'b00100111; // MFI 7
        armazenarinstrucoes[2] <= 8'b00000010; // SUM $s0
        armazenarinstrucoes[3] <= 8'b11001000; // MB $s1
        armazenarinstrucoes[4] <= 8'b00001110; // MF $s1
        armazenarinstrucoes[5] <= 8'b00010000; // AND $t0
        armazenarinstrucoes[6] <= 8'b11011000; // MB $t1
        armazenarinstrucoes[7] <= 8'b00100011; // MFI 3 
        armazenarinstrucoes[8] <= 8'b00010010; // SUM $0 
        armazenarinstrucoes[9] <= 8'b01011000; // MW $t1
        /*armazenarinstrucoes[10] <= 8'b11011000;
        armazenarinstrucoes[11] <= 8'b11011000;
        armazenarinstrucoes[12] <= 8'b11011000;
        armazenarinstrucoes[13] <= 8'b11011000;
        armazenarinstrucoes[14] <= 8'b11011000;
        armazenarinstrucoes[15] <= 8'b11011000;*/
    end

    always @(posedge clock)begin
        saidaInstrucao = armazenarinstrucoes[pccounter];
    end
 
endmodule 