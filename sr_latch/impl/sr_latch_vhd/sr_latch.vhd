library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Basic sr latch design with if else not with gates.
entity sr_latch is 
port
(
    clk, reset         : in std_logic;
    in_s, in_r         : in std_logic;
    out_q, out_q_bar   : out std_logic
);
end;

architecture synth of sr_latch is
begin
-- make assignments when clk is high.
    process(clk) begin
        if reset = '1' then
            out_q <= '0';
            out_q_bar <= '0';
        elsif clk = '1' then
            if in_s = '1' then
                out_q <= '1';
                out_q_bar <= '0';
            elsif in_r = '1' then
                out_q <= '0';
                out_q_bar <= '1';
            end if;
        end if;
    end process;
end;
