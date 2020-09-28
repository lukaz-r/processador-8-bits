module extsinal5p8(
    entrada,
    saida
);

input[4:0] entrada;
output reg[7:0] saida;

always@(*)
    begin
        if(entrada[0] == 0) begin
            saida[7:5] = 3'b000;
        end else if(entrada[0] == 1) begin
            saida[7:5] = 3'b111;
        end
        saida[4:0] = entrada;
    end

endmodule
