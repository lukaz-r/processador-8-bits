module extsinal2p8(
    input[4:0] entrada,
    output[7:0] saida
);

function [7:0] ext;
    
    input[4:0] entrada;

    if(entrada[0] == 0)
        ext = {6'b000000, entrada};
    else if(entrada[0] == 1)
        ext = {6'b111111, entrada};

endfunction

assign saida = ext(entrada);

endmodule
