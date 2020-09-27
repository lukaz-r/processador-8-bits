module ALU( 
    input[7:0] entrada1,
    input[7:0] entrada2,
    input[2:0] sinal_ula,
    output[7:0] saida_ula  
);

 
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

endmodule
