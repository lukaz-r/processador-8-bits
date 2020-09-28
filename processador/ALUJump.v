
module ALUJump( //Summation of PC and Jump addr
<<<<<<< HEAD
    input[7:0] inPC,
    input[7:0] ini,
    output reg[7:0] out
=======
    inPC,
    ini,
    out
>>>>>>> c2562964edda20b34a6856e0ef87c7ba124c0fa0
);
input[7:0] inPC;
input[7:0] ini;
output wire[7:0] out;
reg[7:0] aux;

always@(*)
    assign aux = inPC + ini;

assign out = aux;
endmodule