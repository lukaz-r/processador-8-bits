`include "../processador/memorydata.v"
`timescale 1ns/1ns

module memorydata_tb ();

    reg Rm, Wm;         // Escrita ou Leitura
    reg [7:0]address;        // Endereço
    reg [7:0]RegVal;    // dado para escrita
    wire [7:0]Data_out; // Resultado da Leitura da memoria
    
    reg [7:0] mem[7:0];

    memorydata md(.Rm(Rm), .Wm(Wm), .address(address), .RegVal(RegVal),.Data_out(Data_out));

    initial begin
        $dumpfile("memorydata_tb.vcd");
        $dumpvars(0,memorydata_tb);
        
        #5 // Escrita em 00
           // Tempo 05
        address=8'b00000000;
        RegVal =8'b00001111;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Escrita em 01
           // Tempo 10
        address=8'b00000001;
        RegVal =8'b00001110;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Escrita em 02
           // Tempo 15
        address=8'b00000010;
        RegVal =8'b00001101;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Escrita  em 03
           // Tempo 20
        address=8'b00000011;
        RegVal =8'b00001100;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Escrita  em 04
           // Tempo 25
        address=8'b00000100;
        RegVal =8'b00001011;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Escrita  em 17
           // Tempo 30
        address=8'b00010001;
        RegVal =8'b00001010;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Escrita  em 06
           // Tempo 35
        address=8'b00000110;
        RegVal =8'b00001001;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita  em 07
           // Tempo 40
        address=8'b00000111;
        RegVal =8'b00001000;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita  em 08
           // Tempo 45
        address=8'b00001000;
        RegVal =8'b00000111;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita  em 09
           // Tempo 50
        address=8'b00001001;
        RegVal =8'b00000110;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita  em 10
           // Tempo 55
        address=8'b00001010;
        RegVal =8'b00000101;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita  em 11
           // Tempo 60
        address=8'b00001011;
        RegVal =8'b00000100;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita  em 12
           // Tempo 65
        address=8'b00001100;
        RegVal =8'b00000011;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita em 13
           // Tempo 70
        address=8'b00001101;
        RegVal =8'b00000010;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita 14
           // Tempo 75
        address=8'b00001110;
        RegVal =8'b00000001;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Escrita 15
           // Tempo 80
        address=8'b1111;
        RegVal =8'b00000000;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        

        #5 // Leitura em 0
           // Tempo 85
        address=8'b00000000;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);        
        #5 // Leitura  em 01
           // Tempo 90
        address=8'b00000001;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 02
           // Tempo 95
        address=8'b00000010;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 03
           // Tempo 100
        address=8'b00000011;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 04
           // Tempo 105
        address=8'b00000100;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 05
           // Tempo 110
        address=8'b00000101;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 06
           // Tempo 115
        address=8'b00000110;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 07
           // Tempo 120
        address=8'b00000111;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 08
           // Tempo 125
        address=8'b00001000;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 09
           // Tempo 130
        address=8'b00001001;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 10
           // Tempo 135
        address=8'b00001010;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 11
           // Tempo 140
        address=8'b00001011;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura  em 12
           // Tempo 145
        address=8'b00001100;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura em 13
           // Tempo 150
        address=8'b00001101;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura 14
           // Tempo 155
        address=8'b00001110;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura 17
           // Tempo 160
        address=8'b10001;      
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura 15
           // Tempo 165
        address=8'b00001111;      
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Escrita em 35
           // Tempo 170
        address=8'b00100011;
        RegVal =8'b00100101;;
        Wm=1;
        Rm=0;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);

        #5 // Leitura em 35
           // Tempo 175
        address=8'b00100011;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura em 37
           // Tempo 180
        address=8'b00100101;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);
        #5 // Leitura em 00
           // Tempo 185
        address=8'b00000000;
        Wm=0;
        Rm=1;
        $monitor("Wm = %b,\t Rm = %d, address = %d,\t RegVal= %d,\t Data_out = %d", Wm, Rm, address, RegVal, Data_out);

//*************************************
//      Linhas de formato de testes   *
//      Leitura                        
//      address=8'b;
//      Wm=0;
//      Rm=1;
//
//      Escrita
//      address=8'b;
//      RegVal =8'b;
//      Wm=1;
//      Rm=0;
//      $monitor("Wm = %b, Rm = %d, address = %d, RegVal= %d
//                Data_out = %d", Wm, Rm, address, RegVal, Data_out);
//*************************************

        #10 // passou 
        $monitor("End Simulation");
        $finish;
    end

endmodule
