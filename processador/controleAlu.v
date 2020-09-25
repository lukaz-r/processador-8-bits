module controleAlu (
    input[2:0] funct,
    input[1:0] opAlu,
    output[2:0] sinal_ula 
);

function[2:0] func;

    input[2:0] funct;
    input[1:0] opAlu;

    case(opAlu)

        2'b00: // lw e Sw
            func = 3'b010;

        2'b01: // branch
            func = 3'b011;
        
        2'b10: // tipo R

            begin
                case(funct)

                    3'b000: // add
                        func = 3'b010;
                    
                    3'b001: // sub
                        func = 3'b011;

                    3'b010: // and
                        func = 3'b000;

                    3'b011: // or
                        func = 3'b001;

                    3'b100: // slt
                        func = 3'b100;
                        
                    default
                        func = 3'b111; // erro
                endcase
            end

        default
            func = 3'b111; // erro

    endcase

endfunction 

assign sinal_ula = func(opAlu, funct);

endmodule
