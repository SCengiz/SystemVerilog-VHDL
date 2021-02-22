// mux4 using with mux2s.
// NOTE: Sel must be 2 for mux4.
module mux4
#(parameter N = 8)
(
    input logic [N-1:0] in_0, in_1, in_2, in_3,
    input logic [1:0]   sel,
    output logic [N-1:0] out
);

// internal signals.
logic [N-1:0] out_low, out_high;

// using cascaded mux2s we got a mux4.
mux2 lower_out(in_0, in_1, sel[0], out_low);
mux2 higher_out(in_2, in_3, sel[0], out_high);
mux2 final_out(out_low, out_high, sel[1], out);

endmodule;
