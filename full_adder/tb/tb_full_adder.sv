`timescale 1ns/1ps

module tb_full_adder();

// parameters for tb
logic d0, d1, cin, cout, y;

full_adder sim
(
    .in_0(d0), .in_1(d1), .c_in(cin),
        .out(y), .c_out(cout)
);

initial 
begin

    d0 = 0; d1 = 0; cin = 0; #100;
    d0 = 0; d1 = 0; cin = 1; #100;
    d0 = 0; d1 = 1; cin = 0; #100;
    d0 = 0; d1 = 1; cin = 1; #100;
    d0 = 1; d1 = 0; cin = 0; #100;
    d0 = 1; d1 = 0; cin = 1; #100;
    d0 = 1; d1 = 1; cin = 0; #100;
    d0 = 1; d1 = 1; cin = 1; #100;
    $stop;
end

endmodule