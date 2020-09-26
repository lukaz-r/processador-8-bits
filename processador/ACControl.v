module accontrol( //Main ULA input accumulator control unit
    input jump,
    input jumpC,
    input sin,
    input InA,
    input twone,
    output saidaMux,
    output saidaAc
);

    always @(*)
        begin
            assign saidaMux = twone & ~InA;
            assign saidaAC = ~(jump | jumpC) & (Sin | twone);
        end
endmodule