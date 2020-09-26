module acIn ( //Main ALU input accumulator
    input[7:0] newData,
    input accept,
    output reg[7:0] Data
);

always@(*)
    if (accept == 1)
        Data <= newData;
    else
        Data <= Data;
    end

endmodule
