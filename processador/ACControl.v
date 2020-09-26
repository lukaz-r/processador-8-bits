module ACControl(
    input jump,
    input jumpC,
    input sin,
    input twone,
    output reg saidaMux,
    output reg saidaAc
);

    always @(*)
        begin
            saidaMux = twone;
            saidaAC = ~(jump | jumpC) & (Sin | twone);
        end
endmodule