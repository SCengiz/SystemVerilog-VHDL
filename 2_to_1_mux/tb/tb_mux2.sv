`timescale 1ns/1ps
module tb_mux2();

localparam N = 4;
logic [N-1:0] d0, d1, y;
logic s;

mux2 #(N) dut0
    (
        .in_0(d0),
        .in_1(d1),
        .sel(s),
        .out(y) 
    );

initial 
begin
    d0 = 4'b0000; d1 = 4'b0001;
    s = 0; #100;
    d0 = 4'b0110; d1 = 4'b0001;
    s = 1; #100;
    $display("Select  : %d ", s);
    d0 = 4'b1111; d1 = 4'b0001;
    s = 0; #100;
    d0 = 4'b0110; d1 = 4'b1001;
    s = 1; #100;
    $display("Select  : %d ", s);
    $stop;
end

endmodule