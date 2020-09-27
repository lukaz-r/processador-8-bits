`timescale 1ns/1ns
`include "../processador/JControl.v"


module JControl_tb;
    reg jump, jumpC, neq, zero;
    wire saidaA;

    jcontrol control( 
        jump,
        jumpC,
        neq,
        zero,
        saidaA
    );

    initial begin
        $monitor("J = %b, Jc = %b, neq = %b, zero = %b, saidaA = %b", jump,jumpC, neq, zero, saidaA);
        //$dumpfile ("testbench/ACControl.vcd");    
	    //$dumpvars(0, ACControl_tb);

        jump = 0;
        jumpC = 0;
        neq = 0;
        zero = 0;

        #20
        jump = 1;
        jumpC = 0;
        neq = 0;
        zero = 0;

        #20
        jump = 0;
        jumpC = 1;
        neq = 1;
        zero = 0;

        #20
        jump = 0;
        jumpC = 1;
        neq = 1;
        zero = 1;

        #20
        jump = 0;
        jumpC = 1;
        neq = 0;
        zero = 0;

        #20
        jump = 0;
        jumpC = 1;
        neq = 0;
        zero = 1;

        #20 //POR QUE ESSE NÃO APARECE?
        jump = 1;
        jumpC = 1;
        neq = 1;
        zero = 1;

        $monitor("test completed");
    end

endmodule