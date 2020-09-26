module regBank ( //Register bank
    input WR,
    input[1:0] rs,
    input[7:0] data
    output reg regVal
);

reg [7:0] s0; //00
reg [7:0] s1; //01
reg [7:0] t0; //10
reg [7:0] t1; //11

always@(*)
    case(rs)
        2'b00:
            if (WR == 1)
                assign s0 = data;
            end
            assign regVal = s0;

        2'b01:
            if (WR == 1)
                assign s1 = data;
            end
            assign regVal = s1;
        2'b10:
            if (WR == 1)
                assign t0 = data;
            end
            assign regVal = t0;

        2'b11:
            if (WR == 1)
                assign t1 = data;
            end
            assign regVal = t1;
    endcase
endmodule
