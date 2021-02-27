library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- test bench for d_latch
entity tb_d_latch_with_sr is 
end;

-- input signals for testbench
architecture sim of tb_d_latch_with_sr is
    signal clk                : std_logic := '0';
    signal res, d, q, qn   : std_logic;


begin
-- simulate with using this d_latch entitiy.
dut : entity work.d_latch_with_sr
    port map(clk => clk, reset => res, in_d => d, out_q => q, out_q_bar => qn);
-- clock generate
    process begin
        for kk in 0 to 50 loop
            wait for 50ns;
            clk <= not clk;
        end loop;
        wait;
    end process;
-- basic operations with d and res inputs.
    process begin
        d <= '0'; res <= '0'; wait for 100ns;
        d <= '0'; res <= '1'; wait for 100ns;
        d <= '1'; res <= '0'; wait for 100ns;
        d <= '1'; res <= '1'; wait for 100ns;
        wait;
    end process;
end;
