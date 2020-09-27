module mrs( //Mux Register Source
    input[7:0] inAc,
    input[7:0] inMem,
    input choice,
    output reg[7:0] out
);

always@(*)
begin

    if (choice == 1)
        out = inMem;
    else
        out = inAc;

end    
endmodule