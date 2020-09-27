
module mpc( //Mux of PC source
    input[7:0] pcp, //PC plus
    input[7:0] pcj, //Jump
    input choice,
    output reg[7:0] out
);

always@(*)
begin
    
    if (choice == 1)
        out = pcj;
    else
        out = pcp;
end
    
endmodule