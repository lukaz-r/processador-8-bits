module zero ( //Zero reg output from the main ALU
    input newVal,
    input accept,
    input deny,
    output reg val,
    input clock
);

always @(negedge clock)
    begin
        if (accept == 1'b1 & deny == 1'b0)
            val <= newVal;
        else
            val <= val;
    end
endmodule
