
module mrs( //Mux Register Source
    input[7:0] inAc,
    input[7:0] inMem,
    input choice,
    output[7:0] out,
);

always@(*)
    if (choice == 1)
        assign out = inMem;
    else
        assign out = inAc;
    end
    
endmodule