`timescale 1ns/1ps

module tb_sr_latch();
// input signals for test bench.
logic clk, res, s, r, q, qn;

sr_latch dut
(
    .clk(clk), .reset(res), .in_s(s), .in_r(r), .out_q(q), .out_q_bar(qn)
);

initial clk = 0;
always #50 clk = ~clk;

initial begin
    s = 0;  r = 0; res = 0; #100;
    s = 0;  r = 0; res = 1; #100;
    s = 0;  r = 1; res = 0; #100;
    s = 0;  r = 1; res = 1; #100;
    s = 1;  r = 0; res = 0; #100;
    s = 1;  r = 0; res = 1; #100;
    s = 1;  r = 1; res = 0; #100;
// when s = 1 and r = 1 its Forbidden Zone !!!
    s = 1;  r = 1; res = 1; #100;

    $stop;
end
endmodule