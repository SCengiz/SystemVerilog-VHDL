`timescale 1ns/1ps

module tb_synchronizer();
// parameters for tb
localparam N = 4;
logic [N-1:0] q, d;
logic clk, res;

// Port mapping.
synchronizer #(N) dut0
(
    .clk(clk), .reset(res), .in_d(d), .out_q(q)
);
// clock generate. Period is 100ns
initial clk = 0;
always #50 clk = ~clk;
// Basic testbench algorithm with for and if.
initial 
begin
    integer i;
    for(i = 0; i < 10; i = i + 1) 
    begin
        if(i % 2) begin
            res = 1; 
            $display("RESET HERE");
        end
        else
            res = 0;        

        d = i;  #100;
        $display(" d : %d", d);
    end
    $stop;
end

endmodule