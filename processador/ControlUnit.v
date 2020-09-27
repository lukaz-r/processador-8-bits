module controlunit(
    input[2:0] OPCode,
    output reg J,
    output reg JC,
    output reg INA,
    output reg RM,
    output reg WM,
    output reg SIN,
    output reg SOUT,
    output reg WR,
    output reg NEQ
);


always @(OPCode)
begin

    case(OPCode)

        3'b000: // R
        begin
            J = 1'b0;
            JC = 1'b0;
            INA = 1'b0;
            RM = 1'b0;
            WM = 1'b0;
            SIN = 1'b0;
            SOUT = 1'b1;
            WR = 1'b0;
            NEQ = 1'b0;
        end
        
        3'b001: // MFI
        begin
            J = 1'b0;
            JC = 1'b0;
            INA = 1'b1;
            RM = 1'b0;
            WM = 1'b0;
            SIN = 1'b1;
            SOUT = 1'b0;
            WR = 1'b0;
            NEQ = 1'b0;            
        end
            
        3'b010: // MW
        begin
            J = 1'b0;
            JC = 1'b0;
            INA = 1'b0;
            RM = 1'b0;
            WM = 1'b1;
            SIN = 1'b0;
            SOUT = 1'b0;
            WR = 1'b0;
            NEQ = 1'b0;
        end

        3'b011: // MR
        begin

            J = 1'b0;
            JC = 1'b0;
            INA = 1'b0;
            RM = 1'b1;
            WM = 1'b0;
            SIN = 1'b0;
            SOUT = 1'b0;
            WR = 1'b1;
            NEQ = 1'b0; 
        end
            
        3'b100: // J
        begin
            J = 1'b1;
            JC = 1'b0;
            INA = 1'b0;
            RM = 1'b0;
            WM = 1'b0;
            SIN = 1'b0;
            SOUT = 1'b0;
            WR = 1'b0;
            NEQ = 1'b0;
        end
        
        3'b101: // JCE
        begin
            J = 1'b0;
            JC = 1'b1;
            INA = 1'b0;
            RM = 1'b0;
            WM = 1'b0;
            SIN = 1'b0;
            SOUT = 1'b0;
            WR = 1'b0;
            NEQ = 1'b0;
        end

        3'b110: // MB
        begin
            J = 1'b0;
            JC = 1'b0;
            INA = 1'b0;
            RM = 1'b0;
            WM = 1'b0;
            SIN = 1'b0;
            SOUT = 1'b0;
            WR = 1'b1;
            NEQ = 1'b0;
        end

        3'b111: // JCN
            begin
                J = 1'b0;
                JC = 1'b1;
                INA = 1'b0;
                RM = 1'b0;
                WM = 1'b0;
                SIN = 1'b0;
                SOUT = 1'b0;
                WR = 1'b0;
                NEQ = 1'b1;
            end
            
    endcase
end


endmodule
