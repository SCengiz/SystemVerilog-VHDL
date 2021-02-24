// Basic D Flip Flop with reset and enable pins.
module d_ff
#(parameter N = 8)
(
    input logic clk, reset, en,
    input logic [N-1:0] in_d,
    output logic [N-1:0] out_q 
);

// Asynchronous reset and sync. enable pins.
// Reset type active high.
always_ff @(posedge clk, posedge reset)
begin
    if (reset) 
        out_q <= {N{1'b0}};
    else if(en) 
        out_q <= in_d;
end

endmodule
