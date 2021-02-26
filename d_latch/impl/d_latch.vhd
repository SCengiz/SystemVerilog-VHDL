library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_latch is
    generic(N : integer := 4);
port
(
    clk, reset          : in std_logic;
    in_d                : in std_logic_vector(N-1 downto 0);
    out_q               : out std_logic_vector(N-1 downto 0)
);
end;

-- Basic d_latch example.
architecture syth of d_latch is 
begin
    process(clk) begin
        if reset = '1' then 
            out_q <= (0 to N-1 => '0');
-- No rising edge whole positive clock interval!        
        elsif clk = '1' then
            out_q <= in_d;
        end if;
    end process;
end;




