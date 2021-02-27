`timescale 1ns/1ps

module tb_d_latch_with_sr();

logic clk, res, d, q, qn;

// signal definitions for the test bench.
d_latch_with_sr dut
(
    .clk(clk), .reset(res), .in_d(d), .out_q(q), .out_q_bar(qn)
);

// clock generation.
initial clk = 0;
always #50 clk = ~clk;

// basic operations.
initial begin
    d = 0; res = 0; #100;
    d = 0; res = 1; #100;
    d = 1; res = 0; #100;
    d = 1; res = 1; #100;
    
    $stop;
end

endmodule