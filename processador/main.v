
module main( //Mux of main ALU output accumulator data source
    input[7:0] inReg,
    input[7:0] ini,
    input choice,
    output[7:0] out,
);

always@(*)
    if (choice == 1)
        assign out = inReg;
    else
        assign out = ini;
    end
    
endmodule