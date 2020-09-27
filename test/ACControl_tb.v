`timescale 1ns/1ns
`include "processador/ACControl.v"


module ACControl_tb;
    reg jump, jumpC, sin, InA, twone;
    wire saidaMux, saidaAc;

    accontrol control (
        .jump(jump),
        .jumpC(jumpC),
        .sin(sin),
        .InA(InA),
        .twone(twone),
        .saidaMux(saidaMux),
        .saidaAc(saidaAc)
    );

    initial begin
        //$monitor("J = %b, Jc = %b, Sin = %b, InA = %b, 1&2 = %b, Mux = %b, AC = %b", jump,jumpC,sin,InA,twone,saidaMux,saidaAc);
        $dumpfile ("testbench/ACControl.vcd");    
	    $dumpvars(0, ACControl_tb);

        jump = 0;
        jumpC = 0;
        sin = 0;
        InA = 0;
        twone = 0;

        #20
        jump = 1;
        jumpC = 0;
        sin = 0;
        InA = 0;
        twone = 0;

        #20
        jump = 0;
        jumpC = 1;
        sin = 0;
        InA = 0;
        twone = 0;

        #20
        jump = 1;
        jumpC = 1;
        sin = 0;
        InA = 0;
        twone = 0;

        #20
        jump = 0;
        jumpC = 0;
        sin = 1;
        InA = 0;
        twone = 0;

        #20
        jump = 0;
        jumpC = 0;
        sin = 1;
        InA = 0;
        twone = 1;

        #20
        jump = 0;
        jumpC = 0;
        sin = 0;
        InA = 0;
        twone = 1;

        #20
        jump = 0;
        jumpC = 0;
        sin = 0;
        InA = 1;
        twone = 1;

        #20
        jump = 0;
        jumpC = 0;
        sin = 0;
        InA = 1;
        twone = 0;

        //$monitor("test completed");
        $display("test completed");
    end

endmodule