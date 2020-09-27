module controleAlu (
    opAlu,
    twoandOne,
    sinal_ula
);

input[2:0] opAlu;
output wire twoandOne;
output wire[2:0] sinal_ula; 
reg aux;

always @(*)
    if (opAlu[1] & opAlu[2]) begin
        aux = 1;    
    end else begin
        aux = 0;
    end
    assign twoandOne = aux;

assign sinal_ula = opAlu;
endmodule
