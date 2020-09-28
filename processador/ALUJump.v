
module ALUJump( //Summation of PC and Jump addr
    inPC,
    ini,
    out
);
input[7:0] inPC;
input[7:0] ini;
output wire[7:0] out;
reg[7:0] aux;

always@(*)
    assign aux = inPC + ini;
assign out = aux;
endmodule