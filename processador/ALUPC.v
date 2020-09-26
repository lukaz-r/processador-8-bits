
module ALUPC( //Summation of PC and 1
    input[7:0] inPC
    output[7:0] out,
);

always@(*)
    assign out = inPC + 1;
endmodule