module acOut ( //Main ALU output accumulator
    input[7:0] newData,
    input accept,
    input deny,
    output reg[7:0] data,
    input clock
);

always @(*)
    begin
        if (accept == 1'b1 & deny == 1'b0)
            data <= newData;
        else
            data <= data;
    end
    
endmodule
