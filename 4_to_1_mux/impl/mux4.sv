module mux4
(
    input logic [3:0] in_0, in_1, in_2, in_3,
    input logic [1:0] sel,
    output logic [3:0] out
);

assign out = sel[1] ? (sel[0] ? in_3 : in_2) 
                    : (sel[0] ? in_1 : in_0);

endmodule