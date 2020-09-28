module memoryinstruction1(
    input clock;
    input [7:0] pccounter;
    output [3:0] saidacontrolunit;
    output [1:0] saidaRs;
    output [4:0] saidaextendsinal;
    reg [7:0] armazenarinstrucoes [256:0];
    output [7:0] saidaInstrucao;

always @(posedge clock)begin
    armazenarinstrucoes[0] <= 8'b00000000;
end
 saidaInstrucao = armazenarinstrucoes[pccounter];
for(i=0;i<3;i=i+1)begin
    saidacontrolinit[i] <= saidaInstrucao[5+i];
end
for(i=0;i<2;i = i+1)begin
    saidaRs[i] <= saidaInstrucao[3+i];  
end
for (i=0;i<6;i= i+1)begin
    saidaextendsinal[i] <= saidaInstrucao[0+i];
end
endmodule