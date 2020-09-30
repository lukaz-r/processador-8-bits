
module mpc( //Mux of PC source
    pcp,
    pcj,
    choice,
    out
);
    input[7:0] pcp; //PC plus
    input[7:0] pcj; //Jump
    input choice;
    output reg[7:0] out;

    always@(*)
        if (choice == 1) begin
            out = pcj;
        end else begin
            out = pcp;
        end
    
endmodule