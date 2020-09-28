module ALU( 
    entrada1,
    entrada2,
    sinal_ula,
    saida_ula,
    zero
);
    input[7:0] entrada1;
    input[7:0] entrada2;
    input[2:0] sinal_ula;
    
    output reg[7:0] saida_ula;
    output reg[0:0] zero;

 
function[7:0] alu;

    input[7:0] entrada1, entrada2;
    input[2:0] sinal_ula;

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
            if(entrada1 < entrada2) begin
                alu = 1;
            end else begin
                alu = 0;
            end
        end
        
        default:
            alu = 0;
            
    endcase

endfunction



always @(*) 
    begin
        saida_ula = alu(entrada1, entrada2, sinal_ula);
        if (saida_ula == 0) begin
            zero = 1;
        end else begin
            zero = 0;
        end
    end
endmodule
