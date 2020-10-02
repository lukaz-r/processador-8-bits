module acIn ( //Main ALU input accumulator
    newData,
    accept,
    data,
    clock
);
    input[7:0] newData;
    input accept, clock;
    output reg[7:0] data;

always @(*) begin
    if (accept == 1'b1) begin
        data <= newData;
    end
end
endmodule
