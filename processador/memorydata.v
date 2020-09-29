module memorydata (
    Rm, Wm, address, RegVal,Data_out
);
    input Rm, Wm;         // Escrita ou Leitura
    input [7:0]address;        // Endereço
    input [7:0]RegVal;    // dado para escrita
    output reg [7:0] Data_out; // Resultado da Leitura da memoria
    
    reg [7:0] mem[35:0];    // Memoria de 8 bits e x posições

    always @(*)begin
        if (Rm==1) begin
            Data_out = mem[address];
        end
        else if (Wm==1) begin
            mem[address] = RegVal;
        end
    end
endmodule
