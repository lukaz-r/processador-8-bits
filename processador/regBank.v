module regBank ( //Register bank
    WR,
    clock,
    rs,
    data,
    regVal
);

input WR, clock;
input[1:0] rs;
input[7:0] data;
output reg[7:0] regVal;

reg [7:0] s0; //00
reg [7:0] s1; //01
reg [7:0] t0; //10
reg [7:0] t1; //11

always @(posedge clock) begin
    if (WR == 1) begin
        case(rs)
            2'b00:
                s0 = data;
            2'b01:
                s1 = data;
            2'b10:
                t0 = data;
            2'b11:
                t1 = data;
        endcase
    end
end

always @(negedge clock) begin
    case(rs)
            2'b00:
                regVal = s0;
            2'b01:
                regVal = s1;
            2'b10:
                regVal = t0;
            2'b11:
                regVal = t1;
        endcase
end

endmodule
