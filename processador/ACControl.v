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
output reg saidaMux, saidaAc;

always @(*)
    begin
        saidaMux <= twone & ~InA;
        saidaAc <= ~(jump | jumpC) & (sin | twone);
    end
endmodule