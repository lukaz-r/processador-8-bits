module mrs( //Mux Register Source
    inAc,
    inMem,
    choice,
    out
);

input[7:0] inAc;
input[7:0] inMem;
input choice;
output wire[7:0] out;
reg[7:0] aux;

always@(*)
    if (choice == 1) begin
        aux <= inMem;
    end else begin
        aux <= inAc;
    end
    
assign out = aux;
endmodule