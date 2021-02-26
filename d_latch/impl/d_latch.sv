// Basic d_latch example 

module d_latch
#(parameter N = 4)
(
    input logic clk, reset,
    input logic [N-1:0] in_d,
    output logic [N-1:0] out_q
);

// always_latch block is used for latch operations
// with synch. and active high reset.
always_latch
begin
    if (reset)
        out_q <= {N{1'b0}};
    else if (clk)
        out_q <= in_d;
end

endmodule