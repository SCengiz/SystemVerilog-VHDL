library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_d_latch is 
end;

architecture sim of tb_d_latch is
    constant N : integer := 4;

    signal clk, res    : std_logic := '0';
    signal d, q        : std_logic_vector(N-1 downto 0);

begin
dut : entity work.d_latch
    generic map(N => N)
    port map(clk => clk, reset => res, in_d => d, out_q => q);
-- clock generate. Its period is 100ns
    process begin
        for kk in 0 to 50 loop
            clk <= not clk;
            wait for 50ns;
        end loop;
        wait;
    end process;
-- Basic trials for d_latch entitiy.
    process begin
        d <= x"0"; res <= '0'; wait for 100ns;
        d <= x"1"; res <= '1'; wait for 100ns;
        d <= x"2"; res <= '0'; wait for 100ns;
        d <= x"3"; res <= '1'; wait for 100ns;

        wait;
    end process;
end;






