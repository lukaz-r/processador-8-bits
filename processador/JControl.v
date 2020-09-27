module jcontrol(
    input jump,
    input jumpC,
    input beq,
    input zero,
    output reg saidaA 
);

    always @(*)

        begin
           saidaA = (jump) | ((jumpC) & ((zero & ~beq ) | (beq & ~zero)));
        end
        
endmodule