module jcontrol(
    jump,
    jumpC,
    neq,
    zero,
    saidaA
);
input jump, jumpC, neq, zero;
output wire saidaA;
reg aux;

    always @(*)
        begin
           aux = (jump) | ((jumpC) & ((zero & ~neq ) | (neq & ~zero)));
        end
    assign saidaA = aux;
        
endmodule