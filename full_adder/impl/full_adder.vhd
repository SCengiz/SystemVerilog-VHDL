library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port
(
    in_0, in_1, c_in   : in std_logic;
    outt, c_out        : out std_logic
);
end;

architecture synth of full_adder is
    signal in_a, in_b, in_c : std_logic;
begin
    in_a  <= in_0 xor in_1;
    in_b  <= in_0 and in_1;
    in_c  <= c_in and in_a;
    c_out <= in_b or  in_c;
    outt  <= c_in xor in_a;
end;
