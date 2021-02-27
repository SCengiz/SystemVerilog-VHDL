// D_latch design with using sr_latch
module d_latch_with_sr
(
    input logic clk, reset, 
    input logic in_d,
    output logic out_q, out_q_bar
);

// internal signals for d_latch design.
logic out_s, out_r;

// assignments for d_latch.
assign out_s = in_d;
assign out_r = ~in_d;

// with rs_latch entitiy !! found the result
// Pay attention to the order of input parameters.
sr_latch result(clk, reset, out_s, out_r, out_q, out_q_bar);

endmodule