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
    output [7:0] pc_calc;

    reg [7:0] instreg;
    reg [7:0] pc_calcreg;

    //ID/EX
    output [7:0] regVal;
    output [7:0] extsinal;
    output [1:0] rd;
    output Jid, JCid, INAid, RMid, WMid, SINid, SOUTid, WROutid, NEQid;
    output [2:0] funct;
    output [7:0] PCout;

    reg [7:0] regValreg;
    reg [7:0] extsinalreg;
    reg [1:0] rdreg;
    reg Jidreg, JCidreg, INAidreg, RMidreg, WMidreg, SINidreg, SOUTidreg, WROutidreg, NEQidreg;
    reg [2:0] functreg;
    reg [7:0] PCoutreg;

    //EX/MEM
    output zeroOut;
    output [7:0] acOutValue;
    output [7:0] ulaJumpOut;
    inout [7:0] rs;
    output [1:0] rdex;
    output WRex, WMex, RMex, NEQex, Jex, JCex;

    reg zeroOutreg;
    reg [7:0] acOutValuereg;
    reg [7:0] ulaJumpOutreg;
    reg [7:0] rsreg;
    reg [1:0] rdexreg;
    reg WRexreg, WMexreg, RMexreg, NEQexreg, Jexreg, JCexreg;

    //MEM/WB
    output [1:0] rdteste;
    output [7:0] data_out;
    output [7:0] jumpOut;
    output [7:0] acOutWb;
    output WRmem, RMmem;
    output saidaA;

    reg [1:0] rdtestereg;
    reg [7:0] data_outreg;
    reg [7:0] jumpOutreg;
    reg [7:0] acOutWbreg;
    reg WRmemreg, RMmemreg;
    reg saidaAreg;

    //WB//IF
    inout [7:0] data;
    output WRwb;
    output [1:0] rdOut;

    reg [7:0] datareg;
    reg WRwbreg;
    reg [1:0] rdOutreg;

    //HAZARD CONTROLL
    reg [1:0] fwd;
    reg stall;   

    IF ONE(
        .clock(clock), .pcj_mux(jumpOut), .choice_mux(saidaA), .stall(stall),
        .inst(inst), .pc_calc(pc_calc)
    );

    ID TWO(
        .PC(pc_calcreg),
        .inst(inst),
        .data(data),
        .rdIn(rdtestereg),
        .WR(WRwbreg),
        .stall(stall),
        .clock(clock),
        .regVal(regVal),
        .extsinal(extsinal),
        .funct(funct),
        .rd(rd),
        .J(Jid), .JC(JCid), .INA(INAid), .RM(RMid), .WM(WMid), .SIN(SINid), .SOUT(SOUTid), .WROut(WROutid), .NEQ(NEQid),
        .PCout(PCout)
    );

    EX THREE(
        .WR(WROutidreg), .SOUT(SOUTidreg), .WM(WMidreg), .RM(RMidreg), .NEQ(NEQidreg), .J(Jidreg), .JC(JCidreg), .SIN(SINidreg), .INA(INAidreg),
        .PC(PCoutreg),
        .regVal(regValreg),
        .sinalExt(extsinalreg),
        .funct(functreg),
        .rdIn(rdreg),
        .fwd(fwd),
        .dataMem(datareg),
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
        .Wr(WRexreg), .Wm(WMexreg), .Rm(RMexreg), .Neq(NEQexreg), .J(Jexreg), .JC(JCexreg),
        .PC(ulaJumpOutreg),
        .rdex(rdexreg),
        .zeroOut(zeroOutreg),
        .acOutValue(acOutValuereg),
        .RegVal(rs),
        .data_out(data_out),
        .jumpOut(jumpOut),
        .acOutWb(acOutWb),
        .saidaA(saidaA),
        .rdmem(rdteste),
        .Wr_MEM(WRmem), .Rm_MEM(RMmem)
    );

    WB FIVE(
        .WR(WRmemreg),
        .RM(RMmemreg),
        .ACOUT(acOutWbreg),
        .MEMOUT(data_outreg),
        .rd(rdtestereg),
        .data(data),
        .WROut(WRwb),
        .rdOut(rdOut)
    );

    always begin
        //#5
        instreg = inst;
        pc_calcreg = pc_calc;

        regValreg = regVal;
        extsinalreg = extsinal;
        rdreg = rd;
        Jidreg = Jid; 
        JCidreg = JCid; 
        INAidreg = INAid; 
        RMidreg = RMid;
        WMidreg = WMid;
        SINidreg = SINid;
        SOUTidreg = SOUTid;
        WROutidreg = WROutid;
        NEQidreg = NEQid;
        functreg = funct;
        PCoutreg = PCout;

        zeroOutreg = zeroOut;
        acOutValuereg = acOutValue;
        ulaJumpOutreg = ulaJumpOut;
        rsreg = rs;
        rdexreg = rdex;
        WRexreg = WRex;
        WMexreg = WMex; 
        RMexreg = RMex; 
        NEQexreg = NEQex; 
        Jexreg = Jex; 
        JCexreg = JCex;

        rdtestereg = rdteste;
        data_outreg = data_out;
        jumpOutreg = jumpOut;
        acOutWbreg = acOutWb;
        WRmemreg = WRmem;
        RMmemreg = RMmem;
        saidaAreg = saidaA;

        datareg = data;
        WRwbreg = WRwb;
        rdOutreg = rdOut;

        #5 clock = ~clock;   

    end

    always @(*) begin
        if (inst[4:3] == rdex) begin
            fwd = 2'b01;
        end else if (inst[4:3] == rdteste) begin
            fwd = 2'b10;
            
        end else begin
            fwd = 2'b00;
        end

        fwd = 2'b00;
        if (((inst[4:3] == rdexreg) & RMidreg) | ((inst[4:3] == rdtestereg) & RMexreg)) begin
            stall = 0;
        end else begin
            stall = 1;
        end   
    end

    initial begin
        $dumpfile("PROCESSADOR.vcd");
        $dumpvars(0,PROCESSADOR);
        clock = 1;
        stall = 1;
        fwd = 2'b00;

        // IF OUTPUT
        //$monitor("PC = %d, INST = %d, CLOCK = %b", pc_calc, inst, clock);
        
        // ID OUTPUT
        //$monitor("RegVal = %d, Sinal Estendido = %d, Rd = %d, Funct = %d, PCOut = %d, WR = %b, CLOCK = %b", regVal, extsinal, rd, funct, PCout, WRwb, clock);
        //$monitor("J = %b, JC = %b, INA = %b, RM = %b, WM = %b, SIN = %b, SOUT = %b, WR = %b, NEQ = %b, CLOCK = %b, STALL = %b",Jid, JCid, INAid, RMid, WMid, SINid, SOUTid, WROutid, NEQid, clock, stall);   


        // EX OUTPUT 
        //$monitor ("Zero = %b, AcOut = %d, ULA_JUMP = %d, rs = %d, rd = %d, CLOCK = %b", zeroOut, acOutValue, ulaJumpOut, rs, rdex, clock);
        //$monitor ("WR = %b, WM = %b, RM = %b, NEQ = %b, J = %b, JC = %b, CLOCK = %b", WRex, WMex, RMex, NEQex, Jex, JCex, clock);


        // MEM OUTPUT
        //$monitor("rd = %d, MEMDATA = %d, JumpOut = %d, ACOUT = %d, WR = %b, RM = %b, JControl = %b, CLOCK = %b", rdteste, data_out, jumpOut, acOutWb, WRmem, RMmem, saidaA, clock);
    

        // WB OUTPUT
        //$monitor("DadoMux = %d, WR = %b, rd = %d, CLOCK = %b", data, WRwb, rdOut, clock);

        //STALLS AND FWD
        //$monitor("FWD = %d, STALL = %b, CLOCK = %b, RMID = %b, RMEX = %b", fwd, stall, clock, RMid, RMex);

        #400
        $finish;
    end

endmodule