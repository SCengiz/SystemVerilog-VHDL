library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sr_latch is 
end;

-- Signals for testbench.
-- clk must be equals to 0.
architecture sim of tb_sr_latch is
    signal res, s, r, q, qn    : std_logic;
    signal clk                 : std_logic := '0';

begin
dut : entity work.sr_latch
    port map(clk => clk, reset => res, in_s => s, in_r => r, out_q => q, out_q_bar => qn);
    
-- clk generation with basic for loop.
    process begin
        for kk in 0 to 50 loop
            clk <= not clk;
            wait for 50ns;
        end loop;
        wait;
    end process;
    
    process begin
        s <= '0'; r <= '0'; res <= '0'; wait for 100ns;
        s <= '0'; r <= '0'; res <= '1'; wait for 100ns;
        s <= '0'; r <= '1'; res <= '0'; wait for 100ns;
        s <= '0'; r <= '0'; res <= '1'; wait for 100ns;
        s <= '1'; r <= '0'; res <= '0'; wait for 100ns;
        s <= '1'; r <= '0'; res <= '1'; wait for 100ns;
-- when s = 1 and r = 1 its Forbidden Zone !!!
        s <= '1'; r <= '1'; res <= '1'; wait for 100ns;
        wait;
    end process;
end;
