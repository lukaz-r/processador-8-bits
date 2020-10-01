`include "ALUPC.v"
`include "memoryinstruction.v"
`include "pc.v"
`include "mpc.v"

module IF(
    clock, pcj_mux, choice_mux, stall,
    inst, pc_calc
);
    input clock;

    input [7:0] pcj_mux; 
    input choice_mux, stall; 

    inout [7:0] in_PC;
    inout [7:0] out_alu;
    inout [7:0] addr_atual;

    output wire[7:0] inst;
    output reg [7:0] pc_calc;

    ALUPC SUMPC(
        .clock(clock),
        .inPC(addr_atual),
        .out(out_alu)
    );

    mpc MUX(
        .pcp(out_alu),
        .pcj(pcj_mux),
        .choice(choice_mux),   
        .out(in_PC)
    );

    pc POINTER(
        .clock(clock),
        .stall(stall),
        .novoEnd(in_PC),
        .endAtual(addr_atual)
    );

    memoryinstruction MEM(
        .clock(clock),
        .pccounter(addr_atual),
        .saidaInstrucao(inst)
    );

    always @(*) begin
        pc_calc = in_PC;      
    end
endmodule