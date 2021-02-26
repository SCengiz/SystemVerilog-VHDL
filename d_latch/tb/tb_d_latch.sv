`timescale 1ns/1ps

module tb_d_latch();
localparam N = 4;

logic clk, res;
logic [N-1:0] d, q;

d_latch #(N) dut
(
    .clk(clk), .reset(res), .in_d(d), .out_q(q)
);

// Basic clk generation.
initial clk = 0;
always #50 clk = ~clk;

// Basic trials for d_latch example.
initial begin
    d = 4'h0; res = 0; #100; 
    d = 4'h1; res = 1; #100; 
    d = 4'h2; res = 0; #100; 
    d = 4'h3; res = 1; #100; 
    $stop;
end

endmodule
