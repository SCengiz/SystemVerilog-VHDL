library ieee;
use ieee.std_logic_1164.all;
-- input parameter N defaultly 8.
entity synchronizer is 
    generic(N : integer := 8);
port
(
    clk, reset         : in std_logic;
    in_d               : in std_logic_vector(N-1 downto 0);
    out_q              : out std_logic_vector(N-1 downto 0)
);  
end;

-- internal signal dd is declarate here!
architecture synth of synchronizer is 
    signal dd : std_logic_vector(N-1 downto 0);
begin
-- when reset comes q will be 0 whole bits.
    process(clk) begin
        if reset = '1' then
            out_q <= (0 to N-1 => '0');
-- When No reset do it in rising edge sampling.
        elsif rising_edge(clk) then
            dd <= in_d;
            out_q <= dd;
        end if;
    end process;
end;
