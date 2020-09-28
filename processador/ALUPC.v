
module ALUPC( //Summation of PC and 1
    inPC,
    out
);
    input[7:0] inPC;
    output wire[7:0] out;
    reg[7:0] aux;

always@(*)
    aux = inPC + 1;
assign out = aux;
endmodule