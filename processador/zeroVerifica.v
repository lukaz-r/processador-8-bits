module zeroVerifica(
    input [7:0] saida_alu,
	output zero
);

function verify;
    
    input [7:0] saida_alu;

    if(saida_alu == 0)
        verify = 1;
    else
        verify = 0;
    
endfunction

assign zero = verify(saida_alu);

endmodule