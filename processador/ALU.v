
module ALU( //main ALU
    entrada1,
    entrada2,
    sinal_ula,
    saida_ula,
    zero,
);

input[7:0] entrada1;
input[7:0] entrada2;
input[2:0] sinal_ula;
output wire[7:0] saida_ula;
output wire zero;

reg[7:0] ulaOut;
reg zeroOut;

function[7:0] alu;
    case(sinal_ula)
        3'b000: // and
            alu = entrada1 & entrada2;

        3'b001: // or
            alu = entrada1 | entrada2;

        3'b010: // add
            alu = entrada1 + entrada2;

        3'b011: //sub
            alu = entrada1 - entrada2;

        3'b100: // slt
        begin
            if(entrada1 < entrada2)
                alu = 1;
            else
                alu = 0;
        end
        
        default:
            alu = 0;
            
    endcase

endfunction
 assign saida_ula = alu(entrada1, entrada2, sinal_ula);

if (saida_ula == 0) begin
    assign zeroOut = 1;
end else begin
    assign zeroOut = 0;
end

assign zero = zeroOut;

endmodule