module logic_gates
#(parameter N = 8)
(
    input logic[N-1:0] a, b,
    output logic[N-1:0] y
);

logic [N-1:0] y1, y2, y3;

always_comb 
begin    
    y1 = a & b;
    y2 = ~(a | b);
    y3 = ~(a ^ b);
    y = y1 | y2 | y3;
end

endmodule