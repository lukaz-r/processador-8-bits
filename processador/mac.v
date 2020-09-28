
module mac( //Mux of main ALU output accumulator data source
    inReg,
    ini,
    choice,
    out
);
    input[7:0] inReg;
    input[7:0] ini;
    input choice;
    output wire[7:0] out;
    reg[7:0] aux;

always@(*)
    if (choice == 1) begin
        aux <= inReg;
    end else begin
        aux <= ini;
    end

assign out = aux;
    
endmodule