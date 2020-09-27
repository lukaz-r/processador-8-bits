module pc (
    input[7:0] novoEnd,
    output reg[7:0] endAtual
);

always@(*)

    endAtual <= novoEnd;

endmodule

