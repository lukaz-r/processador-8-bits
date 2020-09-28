module regBank ( //Register bank
    WR,
    rs,
    data,
    regVal
);
input WR;
input[1:0] rs;
input[7:0] data;
output wire[7:0] regVal;

reg [7:0] s0; //00
reg [7:0] s1; //01
reg [7:0] t0; //10
reg [7:0] t1; //11

reg [7:0] aux;

always@(*)
    case(rs)
        2'b00:
            if (WR == 1) begin
                s0 = data;
                aux = data;
            end else begin
                aux = s0;
            end
        2'b01:
            if (WR == 1) begin
                s1 = data;
                aux = data;
            end else begin
                aux = s1;
            end
        2'b10:
            if (WR == 1) begin
                t0 = data;
                aux = data;
            end else begin
                aux = t0;
            end
        2'b11:
            if (WR == 1) begin
                t1 = data;
                aux = data;
            end else begin
                aux = t1;
            end
    endcase

assign regVal = aux;
endmodule
