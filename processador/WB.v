`include "mrs.v"

module WB(
    WR,
    RM,
    ACOUT,
    MEMOUT,
    rd,
    data,
    WROut,
    rdOut
);

    input WR, RM;
    input [7:0] ACOUT;
    input [7:0] MEMOUT;
    input [1:0] rd;

    output wire [7:0] data;
    output reg WROut;
    output reg [1:0] rdOut;

    initial begin
        WROut = 0;
    end

    mrs MUX( //Mux Register Source
        .inAc(ACOUT),
        .inMem(MEMOUT),
        .choice(RM),
        .out(data)
    );

    always @(*)begin
        WROut = WR;
        rdOut = rd;
    end
endmodule