module mrs( //Mux Register Source
    inAc,
    inMem,
    choice,
    out
);

input[7:0] inAc;
input[7:0] inMem;
input choice;
output reg[7:0] out;

always@(*)
    if (choice == 1) begin
        out = inMem;
    end else begin
        out = inAc;
    end
endmodule