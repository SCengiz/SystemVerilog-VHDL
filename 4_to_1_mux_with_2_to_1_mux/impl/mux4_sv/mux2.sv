// 2_to_1 mux with if-else

module mux2
#(parameter N = 8)
(
    input logic [N-1:0] in_0, in_1,
    input logic         sel,
    output logic [N-1:0] out
);


// assign out = sel ? in_0 : in_1;

always_comb 
begin 
    if (!sel) // sel == 0
        out = in_0;
    else 
        out = in_1;
end

endmodule
