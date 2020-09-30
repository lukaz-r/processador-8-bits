module extsinal5p8(
    entrada,
    saida
);

input[4:0] entrada;
output reg[7:0] saida;

always@(*)
    begin
        saida[7:5] = 3'b000;
        saida[4:0] = entrada;
    end

endmodule
