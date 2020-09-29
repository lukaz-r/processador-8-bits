module memoryinstruction_ (clock,PCinst, OPCode, Rs, Four_Zero_Bits);

    input clock;
    input [7:0]PCinst;                  // Instrução recebida 
    output reg [2:0]OPCode;             // Valor do OPCode da Instrução
    output reg [1:0]Rs;                 // Valor do Rs da Instrução
    output reg [4:0]Four_Zero_Bits;     // Valor dos 4 primeiros bits da Instrução

    reg [7:0]PCdata;

    always@(posedge clock)begin
        PCdata         = PCinst;
        OPCode         = PCdata[7:5];
        Rs             = PCdata[4:3];
        Four_Zero_Bits = PCdata[4:0];
    end

endmodule