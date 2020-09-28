
module ALUJump( //Summation of PC and Jump addr
    inPC,
    ini,
    out
);
input[7:0] inPC;
input[7:0] ini;
output reg[7:0] out;

always@(*)
    out = inPC + ini;
endmodule