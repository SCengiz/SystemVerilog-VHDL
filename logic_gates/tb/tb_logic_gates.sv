`timescale 1ns/1ps

module tb_logic_gates();
localparam N = 1;

logic [N-1:0] a,b,y;

logic_gates #(N) dut0
(
    .a(a), .b(b), .y(y)
); 

initial 
begin
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
end

initial 
begin
    #100; 
    $stop;
end

endmodule
