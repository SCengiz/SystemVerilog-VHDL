-- Basic D Flip Flop with reset and enable pins.
library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
    generic(N : integer := 8);
port
(
    clk, reset, en   : in std_logic;
    in_d             : in std_logic_vector(N-1 downto 0);
    out_q            : out std_logic_vector(N-1 downto 0)
);
end;

-- asynchronous and active high reset
architecture synth of d_ff is
-- no internat signal.
begin
    process(clk, reset) begin
        if reset = '1' then 
            out_q <= (0 to N-1 => '0');
            --out_q <= x"00";
        elsif rising_edge(clk) then
            if en = '1' then
                out_q <= in_d;
            end if;
        end if;
    end process;
end;
