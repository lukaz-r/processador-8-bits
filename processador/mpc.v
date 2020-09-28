
module mpc( //Mux of PC source
    pcp,
    pcj,
    choice,
    out
);
    input[7:0] pcp; //PC plus
    input[7:0] pcj; //Jump
    input choice;
    output wire[7:0] out;
    reg[7:0] aux;

always@(*)
    if (choice == 1) begin
        aux <= pcj;
    end else begin
        aux <= pcp;
    end

assign out = aux;
    
endmodule