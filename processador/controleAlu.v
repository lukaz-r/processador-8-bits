module controleAlu (
    opAlu,
    twoandOne,
    sinal_ula
);

input[2:0] opAlu;
output reg twoandOne;
output reg[2:0] sinal_ula;

always @(*)
    begin
        if (opAlu[1] & opAlu[2]) begin
            twoandOne = 1;    
        end else begin
            twoandOne = 0;
        end
        sinal_ula = opAlu;
    end
endmodule
