module zero ( //Zero reg output from the main ALU
    input newVal,
    input accept,
    output reg val,
    input clock
);

always @(posedge clock)
    begin
        if (accept == 1)
            val <= newVal;
        else
            val <= val;
    end
endmodule
