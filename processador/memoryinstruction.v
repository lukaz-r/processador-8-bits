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
        armazenarinstrucoes[1] <= 8'b00000010;
        armazenarinstrucoes[2] <= 8'b00100000;
        armazenarinstrucoes[3] <= 8'b00001100;
        armazenarinstrucoes[4] <= 8'b00000000;
        armazenarinstrucoes[5] <= 8'b11000001;
        armazenarinstrucoes[6] <= 8'b00001100;
    end

    always @(negedge clock)begin
        saidaInstrucao = armazenarinstrucoes[pccounter];
    end
 
endmodule 