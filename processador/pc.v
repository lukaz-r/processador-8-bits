module pc (
    input clock, input stall,
    input wire[7:0] novoEnd,
    output reg[7:0] endAtual
);

initial begin
    endAtual = 8'b00000000;
end

always@(negedge clock)
    if (stall == 1) begin
        endAtual = novoEnd;    
    end
endmodule

