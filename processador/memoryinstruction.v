module memoryinstruction(
    input [7:0] endAtual;
    input clock;
    output [3:0] saidacontrolunit;
    output [1:0] saidaRs;
    output [4:0] saidaextendsinal;


always @(posedge clock)begin
     for(i=0;i<3;i=i+1)begin
      saidacontrolinit[i] = endAtual[5+i];
    end
    for(i=0;i<2;i = i+1)begin
     saidaRs[i] = endAtual[3+i];  
    end
    for (i=0;i<6;i= i+1)begin
      saidaextendsinal[i] = endAtual[0+i];
    end
end
endmodule