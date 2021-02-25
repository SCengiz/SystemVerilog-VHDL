// Synchronizer with 2 D-FF
// Delaying the input signal by 1 cycle.
module synchronizer
// default input argument is 8
#(parameter N = 8)
(
    input logic clk, reset,
    input logic [N-1:0] in_d,
    output logic [N-1:0] out_q
);
// internal signals.
logic [N-1:0] dd;

// Rising edge clk and synch. reset signal (active high)
always_ff @(posedge clk)
begin
    if (reset)
        out_q <= {N/2{2'b00}};
// WARNING: out_q <= 8'b00000000 this is wrong.
// Our input parameter N maybe may not be 8 .  
    else 
    begin
        dd <= in_d;
        out_q <= dd;
    end;
end

endmodule
