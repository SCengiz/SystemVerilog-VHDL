`timescale 1ns/1ps

module tb_d_ff();
localparam N = 8;

logic [N-1:0] d, q;
logic clk, res, en; 

// Parameters for test bech
d_ff #(N) dut0
(
    .clk(clk), .reset(res), .en(en), .in_d(d), .out_q(q)
);

/* Alternatives
always begin     
    clk = 0; #50; 
    clk = 1; #50;
end

always begin
    #50;
    clk = ~clk; 
end
*/

// For clock signal.
initial clk = 0;
always #50 clk = ~clk;

initial begin
// loop cnt variable
    bit [3:0] cnt;    
    while (cnt < 12) begin
// mod operations.
        if(cnt % 2 == 0) begin
            d = 8'h12; res = 1; en = 0;  #100;
            $$display(" counter : %d \n d : %d", cnt, d);
        end
        else if(cnt % 3 == 0) begin
            d = 8'hA2; res = 0; en = 1;  #100;
            $$display(" counter : %d \n d : %d", cnt, d);
        end
        else begin
            d = 8'hB2; res = 0; en = 0;  #100;
            $$display(" counter : %d \n d : %d", cnt, d);
        end
        cnt++;
    end
end

initial begin
    #1000; $finish;
end

endmodule
