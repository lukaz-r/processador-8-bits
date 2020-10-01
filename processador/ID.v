`include "regBank.v"
`include "extsinal5p8.v"
`include "ControlUnit.v"

module ID(
    PC,
    inst,
    data,
    rdIn,
    WR,
    stall,
    clock,
    regVal,
    extsinal,
    funct,
    rd,
    J, JC, INA, RM, WM, SIN, SOUT, WROut, NEQ,
    PCout
);

    input[7:0] PC;
    input[7:0] inst;
    input[7:0] data;
    input[1:0] rdIn;
    input stall, WR, clock;
    
    output wire[7:0] regVal;
    output wire[7:0] extsinal;
    output reg [1:0] rd;
    output reg J, JC, INA, RM, WM, SIN, SOUT, WROut, NEQ;
    inout Juc, JCuc, INAuc, RMuc, WMuc, SINuc, SOUTuc, WROutuc, NEQuc;
    
    output reg[2:0] funct;
    output reg[7:0] PCout;

    regBank RB( //Register bank
        .WR(WR),
        .clock(clock),
        .rs(inst[4:3]),
        .rd(rdIn),
        .data(data),
        .regVal(regVal)
    );

    extsinal5p8 ext(
        .entrada(inst[4:0]),
        .saida(extsinal)
    );

    controlUnit control(
        .OPCode(inst[7:5]),
        .J(Juc),
        .JC(JCuc),
        .INA(INAuc),
        .RM(RMuc),
        .WM(WMuc),
        .SIN(SINuc),
        .SOUT(SOUTuc),
        .WR(WROutuc),
        .NEQ(NEQuc)
    );

    always @(*) begin

        if (stall == 1) begin
            rd = inst[4:3];
            funct = inst[2:0];
            PCout = PC;   
            
            J = Juc;
            JC = JCuc; 
            INA = INAuc; 
            RM = RMuc; 
            WM = WMuc; 
            SIN = SINuc; 
            SOUT = SOUTuc; 
            WROut = WROutuc;
            NEQ = NEQuc;
        end else begin
            J = 1'b0;
            JC = 1'b0; 
            INA = 1'b0; 
            RM = 1'b0; 
            WM = 1'b0; 
            SIN = 1'b0; 
            SOUT = 1'b0; 
            WROut = 1'b0;
            NEQ = 1'b0;            
        end
        
    end
endmodule