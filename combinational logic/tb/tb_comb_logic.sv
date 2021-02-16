`timescale 1ns/1ps

module tb_comb_logic();

    logic a, b, c, y;
    comb_logic dut0(a, b, c, y);

    initial begin
        a = 0; b = 0; c = 0; #10;
        c = 1;               #10;
        b = 1; c = 0;        #10;
        c = 1;               #10;
        a = 1; b = 0; c = 0; #10;
        c = 1;               #10;
        b = 1; c = 0;        #10;
        c = 1;               #10;
        
    end
endmodule




