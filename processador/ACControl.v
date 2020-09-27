module accontrol( //Main ULA input accumulator control unit
    jump,
    jumpC,
    sin,
    InA,
    twone,
    saidaMux,
    saidaAc,
);

input jump, jumpC, sin, InA, twone;
output wire saidaMux, saidaAc;
reg saidaM, saidaA;

always @(*)
    begin
        saidaM = twone & ~InA;
        saidaA = ~(jump | jumpC) & (sin | twone);
    end
    assign saidaMux = saidaM;
    assign saidaAc = saidaA;
endmodule