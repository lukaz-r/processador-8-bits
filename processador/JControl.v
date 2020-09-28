module jcontrol(
    jump,
    jumpC,
    neq,
    zero,
    saidaA
);
input jump, jumpC, neq, zero;
output reg saidaA;

always @(*)
    saidaA = (jump) | ((jumpC) & ((zero & ~neq ) | (neq & ~zero)));
    
endmodule