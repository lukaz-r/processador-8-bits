
module ALU( //main ALU
    input[7:0] entrada1,
    input[7:0] entrada2,
    input[2:0] sinal_ula,
    output reg[7:0] saida_ula,
    output reg zero
);

function[7:0] alu;

    // Rever
    input[7:0] entrada1;
    input[7:0] entrada2;
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

assign out = alu(entrada1, entrada2, sinal_ula);

    // begin
    //     if (out == 0)
    //         zero = 1;
    //     else
    //         zero = 0;
    // end

endmodule