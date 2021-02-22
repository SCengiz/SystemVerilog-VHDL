`timescale 1ns/1ps

module tb_mux4();
// We can change the nubmer of bits with N.
localparam N = 8;

// our signals for mux4
logic [N-1:0] d0, d1, d2, d3,  y;
logic [1:0] s;

// always use .name(sim_name) notation.
mux4 #(N) sim
(
    .in_0(d0), .in_1(d1), .in_2(d2), .in_3(d3), 
        .sel(s), .out(y)  
);

initial 
begin
    $display(" ** MUX4 TEST BENCH **");
    d0 = 8'h00; d1 = 8'h01; d2 = 8'h02; d3 = 8'h03;
    s = 2'b00; #100;
    d0 = 8'h34; d1 = 8'hA1; d2 = 8'hF2; d3 = 8'h33;
    s = 2'b01; #100;
    d0 = 8'h65; d1 = 8'hB1; d2 = 8'hE2; d3 = 8'h13;
    s = 2'b10; #100;
    d0 = 8'h0C; d1 = 8'h4A; d2 = 8'h22; d3 = 8'h43;
    s = 2'b11; #100;
end

initial 
begin
    #1000; $stop;    
end

endmodule