`include "EX.v"

module EX_tb;
    reg WR, SOUT, WM, RM, NEQ, J, JC, SIN, INA, clock;
    reg [7:0] PC;
    reg [7:0] regVal;
    reg [7:0] sinalExt;
    reg [2:0] funct;

    output wire zeroOut; 
    output wire [7:0] acOutValue; 
    output wire [7:0] ulaJumpOut;
    output wire [7:0] rs;
    output wire WRMem, WMMem, RMMem, NEQMem, JMem, JCMem;

    EX exec(
        WR, SOUT, WM, RM, NEQ, J, JC, SIN, INA,
        PC,
        regVal,
        sinalExt,
        funct,
        clock,
        zeroOut,
        acOutValue,
        ulaJumpOut,
        rs,
        WRMem, WMMem, RMMem, NEQMem, JMem, JCMem
    );

    always begin
        #5 clock = ~clock;
    end

    initial begin
        $monitor("CLOCK = %b; OUTPUTS: ZeroOut = %b, AcOut = %d, ULAJump = %d, rs = %d\n WR = %b, WM = %b, RM = %b, NEQ = %b, J = %b, JC = %b", clock, zeroOut, acOutValue, ulaJumpOut, rs, WRMem, WMMem, RMMem, NEQMem, JMem, JCMem);
        
        WR = 0; 
        SOUT = 0;
        WM = 0;
        RM = 0; 
        NEQ = 0; 
        J = 0; 
        JC = 0; 
        SIN = 1; 
        INA = 1;

        PC = 8'b00000001;
        regVal = 8'b00000111;
        sinalExt = 8'b00011111;
        funct = 111;
        
        clock = 1'b0;

        #10
        WR = 0; 
        SOUT = 1;
        WM = 0;
        RM = 0; 
        NEQ = 0; 
        J = 0; 
        JC = 0; 
        SIN = 0; 
        INA = 0;

        PC = 8'b00000001;
        regVal = 8'b00000001;
        sinalExt = 8'b00000010;
        funct = 010;

        #10
        WR = 0; 
        SOUT = 0;
        WM = 0;
        RM = 0; 
        NEQ = 0; 
        J = 1; 
        JC = 0; 
        SIN = 0; 
        INA = 0;

        PC = 8'b00000110;
        regVal = 8'b00000100;
        sinalExt = 8'b00111111;
        funct = 111;

        #10
        $finish;
    end

endmodule