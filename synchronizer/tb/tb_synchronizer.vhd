library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_synchronizer is 
end;

-- signals for tb. N = 4 not 8.
-- we need clk := 0 here!!
architecture sim of tb_synchronizer is
    constant N: integer := 4;    
    signal clk, res : std_logic := '0';
    signal d, q : std_logic_vector(N-1 downto 0);
--    signal cnt : unsigned(3 downto 0) := "0000";

begin
-- port mapping and entity usage.
dut : entity work.synchronizer
    generic map(N => N)
    port map(clk => clk, reset => res, in_d => d, out_q => q);

-- clock generation.
    process
    begin
        for kk in 0 to 50 loop
            clk <= not clk;
            wait for 50ns;
        end loop;
        wait;
    end process;

-- variable cnt is a unsigned type 4bits.
    process is
        variable cnt : unsigned(3 downto 0) := "0000";
    begin
        for kk in 0 to 14 loop
-- When kk = 5 reset the system.
            if(kk = 5) then
                res <= '1';
            else
                res <= '0';
            end if;
-- Every iteration increment cnt.
            cnt := cnt + "0001";
-- cast unsigned to std_logic_vector.
            d <= std_logic_vector(cnt); wait for 100ns;
        end loop;
    wait;
    end process;

end;

