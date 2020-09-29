`include "../processador/memorydata.v"
`timescale 1ns/1ns

module memorydata_tb ();

    reg Rm, Wm;         // Escrita ou Leitura
    reg [7:0]address;        // Endereço
    reg [7:0]RegVal;    // dado para escrita
    wire [7:0]Data_out; // Resultado da Leitura da memoria
    
    reg [7:0] mem[7:0];

    initial begin
        $dumpfile("memorydata_tb.vcd");
        $dumpvars(0,memorydata_tb);
        
        #10 // passou 10
        address=8'b00000000;
        RegVal =8'b00000001;
        Wm=1;
        Rm=0;

        #10 // passou 20
        address=8'b00000000;
        Rm=1;
        Wm=0;

        #10 // passou 30
        address=8'b00000001;
        RegVal =8'b00000100;
        Wm=1;
        Rm=0;

        #10 // passou 40
        address=8'b00000001;
        Wm=0;
        Rm=1;

        #10 // passou 50
        address=8'b00000011;
        Wm=0;
        Rm=1;

        #10 // passou 60
        address=8'b00000001;
        Wm=0;
        Rm=1;

        #10 // passou 70
        address=8'b00001110;
        RegVal =8'b00001110;
        Wm=1;
        Rm=0;

        #10 // passou 80
        address=8'b00000011;
        RegVal =8'b00100011;
        Wm=1;
        Rm=0;

        #05 // passou 85
        address=8'b00001001;
        RegVal =8'b00000111;
        Wm=1;
        Rm=0;

        #10 // passou 95
        address=8'b00000011;
        Wm=0;
        Rm=1;

        #5 // passou 100
        address=8'b00010001;
        Wm=0;
        Rm=1;

        #5 // passou 105
        address=8'b00001001;
        Wm=0;
        Rm=1;

        #05 // passou 110
        address=8'b00010001;
        RegVal =8'b00010001;
        Wm=1;
        Rm=0;

        #5 // passou 115
        address=8'b00000011;
        Wm=0;
        Rm=1;

        #5 // passou 120
        address=8'b00000000;
        Wm=0;
        Rm=1;

        #5 // passou 125
        address=8'b00000001;
        Wm=0;
        Rm=1;
        
        #10 // passou 130
        $monitor("End Simulation");
        $finish;
    end

    memorydata md(.Rm(Rm), .Wm(Wm), .address(address), .RegVal(RegVal),.Data_out(Data_out));

endmodule