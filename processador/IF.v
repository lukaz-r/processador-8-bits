`include "processador/ALUPC.v"
`include "processador/memoryinstruction_.v"
`include "processador/pc.v"
`include "processador/mpc.v"

module IF(
    PC_inst,
    novo_End,
    pcp_mux, pcj_mux, choice_mux,
    in_PC,
    OpCode, Rs_inst, fourZero_Bits, 
    end_Atual,
    out_mux,
    out_alu,
);

input [7:0] PC_inst;
input [7:0] novo_End;
input [7:0] pcp_mux, pcj_mux; 
input choice_mux; 
input [7:0] in_PC;

output wire [2:0] OpCode;          
output wire [1:0] Rs_inst;                 
output wire [4:0] fourZero_Bits; 
output wire [7:0] end_Atual;
output wire [7:0] out_mux;
output wire [7:0] out_alu;

memoryinstruction_ INSTMEM(
    .PCinst(PC_inst), 
    .OPCode(OpCode), 
    .Rs(Rs_inst), 
    .Four_Zero_Bits(fourZero_Bits)
);

pc PC(
    .novoEnd(novo_End),
    .endAtual(end_Atual)
);

mpc MUX(
    .pcp(pcp_mux),
    .pcj(pcj_mux),
    .choice(choice_mux),   
    .out(out_mux)
);

ALUPC ALU(
    .inPC(in_PC),
    .out(out_alu)
);

endmodule