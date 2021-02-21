module full_adder
(
    input logic in_0, in_1, c_in,
    output logic out, c_out
);

logic in_a, in_b, in_c;

always_comb 
begin 
    in_a  = in_0 ^ in_1;
    in_b  = in_0 & in_1;
    in_c  = c_in & in_a;
    c_out = in_b | in_c;
    out   = c_in ^ in_a; 
end

endmodule