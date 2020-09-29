
module ALUJump( //Summation of PC and Jump addr
    inPC,
    ini,
    clock,
    out
);
input[7:0] inPC;
input[7:0] ini;
input  clock;
output reg[7:0] out;

always@(negedge clock)
    out = inPC + ini;
endmodule