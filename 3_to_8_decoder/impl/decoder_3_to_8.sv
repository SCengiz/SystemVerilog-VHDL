// Basic Decoder with 3 bit input and 8 bit output.
module decoder_3_to_8
(
    input logic [2:0] in_a,
    output logic [7:0] out_y
);

// in always block, we use case statement for decode the 
// ... in_a signal. 
always_comb begin
    case(in_a)
        3'b000:    out_y = 8'h01;
        3'b001:    out_y = 8'h02;
        3'b010:    out_y = 8'h04;
        3'b011:    out_y = 8'h08;
        3'b100:    out_y = 8'h10;
        3'b101:    out_y = 8'h20;
        3'b110:    out_y = 8'h40;
        3'b111:    out_y = 8'h80;        
        default:   out_y = 8'hxx;
    endcase
end  

endmodule;