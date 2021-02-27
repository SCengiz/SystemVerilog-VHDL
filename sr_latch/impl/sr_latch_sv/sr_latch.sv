// Basic SR Latch example

module sr_latch
(
    input logic clk, reset,
    input logic  in_s, in_r,
    output logic out_q, out_q_bar
);

// always_latch block !!!
always_latch begin
// {} concatination operator is used here for both signals initialization.
    if (reset) begin
        {out_q, out_q_bar} <= 2'b00;
    end
// if clk high (not just rising edge!) do some operations looking by s and r
    else if (clk) begin
        if (in_s)
            {out_q, out_q_bar} <= 2'b10;
        else if (in_r)
            {out_q, out_q_bar} <= 2'b01;
    end    
end

endmodule
