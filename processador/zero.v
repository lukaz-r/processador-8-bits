module zero ( //Zero reg output from the main ALU
    input newVal,
    input accept,
    output reg val
);

always@(*)
    begin
        if (accept == 1)
            val <= newVal;
        else
            val <= val;
    end
endmodule
