module memorydata (
    clock, Rm, Wm, address, RegVal,Data_out
);
    input clock, Rm, Wm;         // Escrita ou Leitura
    input [7:0]address;        // Endereço
    input [7:0]RegVal;    // dado para escrita
    output reg [7:0] Data_out; // Resultado da Leitura da memoria
    
    reg [7:0] mem[256:0];    // Memoria de 8 bits e x posições

    always @(negedge clock) begin
        if (Wm==1) begin
            mem[address] = RegVal;
        end
    end
    
    always @(*)begin
        if (Rm==1) begin
            Data_out = mem[address];
        end 
    end
endmodule
