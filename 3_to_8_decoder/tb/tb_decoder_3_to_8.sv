`timescale 1ns/1ps

module tb_decoder_3_to_8();

// signals for testbench a must be equals initially zero here!!
logic [2:0] a = 3'b000;
logic [7:0] y;

decoder_3_to_8 dut
(
    .in_a(a), .out_y(y)
);

// in initial block we increment input signal every iteration. 
initial 
begin
    bit [2:0] cnt = 3'b000;
    integer kk = 0;
    for(; kk < 8 ; kk++) begin
        a += cnt;    #100;
        $display( " a : %d", a );
        cnt += 3'b001;
    end
    $stop;
end

endmodule
