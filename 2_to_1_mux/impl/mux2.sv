module mux2
#(parameter N = 8)
(
    input logic [N-1:0] in_0, in_1, 
    input logic sel,
    output logic [N-1:0] out
);

// Ternary operator
assign out = sel ? in_1 : in_0;

endmodule
