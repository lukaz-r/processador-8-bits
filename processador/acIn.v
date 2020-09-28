module acIn ( //Main ALU input accumulator
    newData,
    accept,
    data
);
    input[7:0] newData;
    input accept;
    output reg[7:0] data;

always@(*)

    begin
        if (accept == 1'b1)
            data <= newData;
        else
            data <= data;
    end
    
endmodule
