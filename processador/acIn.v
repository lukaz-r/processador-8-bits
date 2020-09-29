module acIn ( //Main ALU input accumulator
    newData,
    accept,
    data,
    clock
);
    input[7:0] newData;
    input accept, clock;
    output reg[7:0] data;

always @(posedge clock) begin
    if (accept == 1'b1)
        data <= newData;
    else
        data <= data;
end

endmodule
