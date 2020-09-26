
module ALUJump( //Summation of PC and Jump addr
    input[7:0] inPC,
    input[7:0] ini,,
    output[7:0] out,
);

always@(*)
    assign out = inPC + ini;
endmodule