`timescale 1ns/1ps

module tb_mux4();

logic [3:0] d0, d1, d2, d3, y;
logic [1:0] s;

mux4 dut0
(
    .in_0(d0), .in_1(d1), .in_2(d2), .in_3(d3),
    .sel(s), .out(y)
);

initial begin
    d0 = 4'b0100; d1 = 4'b0001; d2 = 4'b0100; d3 = 4'b0100; 
    s = 2'b01;  #100;
    d0 = 4'b1010; d1 = 4'b1001; d2 = 4'b1100; d3 = 4'b0111; 
    s = 2'b11;  #100;
    d0 = 4'b1001; d1 = 4'b0101; d2 = 4'b0000; d3 = 4'b0101; 
    s = 2'b00;  #100;
    d0 = 4'b1000; d1 = 4'b0000; d2 = 4'b1100; d3 = 4'b1101; 
    s = 2'b10;  #100;
    $stop;    
end

endmodule