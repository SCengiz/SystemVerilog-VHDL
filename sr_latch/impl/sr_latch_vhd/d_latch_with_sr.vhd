library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_latch_with_sr is
port
(
    clk, reset        : in std_logic;
    in_d              : in std_logic;
    out_q, out_q_bar  : out std_logic
);
end;

-- internal signals out_s, out_r
architecture synth of d_latch_with_sr is
    signal out_s, out_r  : std_logic;
begin
    out_s <= in_d;
    out_r <= not in_d;

-- Use sr_latch entitiy for d latch design.
    result : entity work.sr_latch 
        port map(clk, reset, out_s, out_r, out_q, out_q_bar);
end;