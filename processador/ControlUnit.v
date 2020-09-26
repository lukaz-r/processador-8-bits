module ControlUnit(
    input[2:0] OPCode,
    output J,
    output JC,
    output RM,
    output WM,
    output SIN,
    output SOUT,
    output WR,
    output NEQ
);

assign J = 0;
assign JC = 0;
assign RM = 0;
assign WM = 0;
assign SIN = 0;
assign SOUT = 0;
assign WR = 0;
assign NEQ = 0;


function decode;
    case(OPCode)
        3'b000: // R
            assign SOUT = 1;

        3'b001: // MFI
            assign SIN = 1;
            // PROBLEMA AQUI COM O MUX

        3'b010: // MW
            assign WM = 1;

        3'b011: // MR
            assign RM = 1;
            assign WR = 1;

        3'b100: // J
            assign J = 1;
        
        3'b101: // JCE
            assign JC = 1;

        3'b110: // MB
            assign WR = 1;

        3'b111: // JCN
            assign JC = 1;
            assign NEQ = 1;
            
    endcase
    

endfunction

assign saida = ext(entrada);

endmodule
