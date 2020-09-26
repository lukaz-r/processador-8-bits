
module mpc( //Mux of PC source
    input[7:0] pcp, //PC plus
    input[7:0] pcj, //Jump
    input choice,
    output[7:0] out,
);

always@(*)
    if (choice == 1)
        assign out = pcj;
    else
        assign out = pcp;
    end
    
endmodule