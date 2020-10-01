`timescale 1ns / 1ns

`include "IF.v"
`include "ID.v"
`include "EX.v"
`include "MEM.v"
`include "WB.v"

module PROCESSADOR;

    reg clock;

    //IF/ID
    inout [7:0] inst;
    inout [7:0] pc_calc;

    //ID/EX
    inout [7:0] regVal;
    inout [7:0] extsinal;
    inout [1:0] rd;
    inout Jid, JCid, INAid, RMid, WMid, SINid, SOUTid, WROutid, NEQid;
    inout [2:0] funct;
    inout [7:0] PCout;

    //EX/MEM
    inout zeroOut;
    inout [7:0] acOutValue;
    inout [7:0] ulaJumpOut;
    inout [7:0] rs;
    inout [1:0] rdex;
    inout WRex, WMex, RMex, NEQex, Jex, JCex;

    //MEM/WB
    inout [1:0] rdteste;
    inout [7:0] data_out;
    inout [7:0] jumpOut;
    inout [7:0] acOutWb;
    //inout [1:0] rdMEM;
    inout WRmem, RMmem;
    inout saidaA;

    //WB//IF
    inout [7:0] data;
    inout WRwb;
    inout [1:0] rdOut;

    


    IF ONE(
        .clock(clock), .pcj_mux(jumpOut), .choice_mux(saidaA),
        .inst(inst), .pc_calc(pc_calc)
    );

    ID TWO(
        .PC(pc_calc),
        .inst(inst),
        .data(data),
        .WR(WRwb),
        .clock(clock),
        .regVal(regVal),
        .extsinal(extsinal),
        .funct(funct),
        .rd(rd),
        .J(Jid), .JC(JCid), .INA(INAid), .RM(RMid), .WM(WMid), .SIN(SINid), .SOUT(SOUTid), .WROut(WROutid), .NEQ(NEQid),
        .PCout(PCout)
    );

    EX THREE(
        .WR(WROutid), .SOUT(SOUTid), .WM(WMid), .RM(RMid), .NEQ(NEQid), .J(Jid), .JC(JCid), .SIN(SINid), .INA(INAid),
        .PC(PCout),
        .regVal(regVal),
        .sinalExt(extsinal),
        .funct(funct),
        .rdIn(rd),
        .clock(clock),
        .zeroOut(zeroOut),
        .acOutValue(acOutValue),
        .ulaJumpOut(ulaJumpOut),
        .rs(rs),
        .rdOut(rdex),
        .WRMem(WRex), .WMMem(WMex), .RMMem(RMex), .NEQMem(NEQex), .JMem(Jex), .JCMem(JCex)
    );

    MEM FOUR(
        .clock(clock),
        .Wr(WRex), .Wm(WMex), .Rm(RMex), .Neq(NEQex), .J(Jex), .JC(JCex),
        .PC(ulaJumpOut),
        .rdex(rdex),
        .zeroOut(zeroOut),
        .acOutValue(acOutValue),
        .RegVal(regVal),
        .data_out(data_out),
        .jumpOut(jumpOut),
        .acOutWb(acOutWb),
        .saidaA(saidaA),
        .rdmem(rdteste),
        .Wr_MEM(WRmem), .Rm_MEM(RMmem)
    );

    WB FIVE(
        .WR(WRmem),
        .RM(RMmem),
        .ACOUT(acOutWb),
        .MEMOUT(data_out),
        .rd(rdteste),
        .data(data),
        .WROut(WRwb),
        .rdOut(rdOut)
    );

    always begin
        #5 clock = ~clock;
    end

    initial begin
        $dumpfile("PROCESSADOR.vcd");
        $dumpvars(0,PROCESSADOR);
        clock = 1;

        // IF OUTPUT
        //$monitor("PC = %d, INST = %d, CLOCK = %b", pc_calc, inst, clock);
        
        // ID OUTPUT
        //$monitor("RegVal = %d, Sinal Estendido = %d, Rd = %d, Funct = %d, PCOut = %d, CLOCK = %b", regVal, extsinal, rd, funct, PCout, clock);
        //$monitor("J = %b, JC = %b, INA = %b, RM = %b, WM = %b, SIN = %b, SOUT = %b, WR = %b, NEQ = %b, CLOCK = %b",Jid, JCid, INAid, RMid, WMid, SINid, SOUTid, WROutid, NEQid, clock);   


        // EX OUTPUT 
        //$monitor ("Zero = %b, AcOut = %d, ULA_JUMP = %d, rs = %d, rd = %d, CLOCK = %b", zeroOut, acOutValue, ulaJumpOut, rs, rdex, clock);
        //$monitor ("WR = %b, WM = %b, RM = %b, NEQ = %b, J = %b, JC = %b, CLOCK = %b", WRex, WMex, RMex, NEQex, Jex, JCex, clock);


        // MEM OUTPUT
        //$monitor("rd = %d, MEMDATA = %d, JumpOut = %d, ACOUT = %d, WR = %b, RM = %b, JControl = %b, CLOCK = %b", rdteste, data_out, jumpOut, acOutWb, WRmem, RMmem, saidaA, clock);
    

        // WB OUTPUT
        //$monitor("DadoMux = %d, WR = %b, rd = %d, CLOCK = %b", data, WRwb, rdOut, clock);

        #95
        $finish;
    end

endmodule