library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_comb_logic is 
end;

architecture sim of tb_comb_logic is 
    component comb_logic
        port
        (
            a, b, c : in std_logic;
            y       : out std_logic
        );
    end component;
    signal a, b, c, y : std_logic;

begin

dut: comb_logic port map(a, b, c, y);

    process begin
        a <= '0'; b <= '0'; c <= '0'; wait for 10ns;
        c <= '1';                     wait for 10ns;
        b <= '1'; c <= '0';           wait for 10ns;
        c <= '1';                     wait for 10ns;
        a <= '1'; b <= '0'; c <= '0'; wait for 10ns;
        c <= '1';                     wait for 10ns;
        b <= '1'; c <= '0';           wait for 10ns;
        c <= '1';                     wait for 10ns;
        wait;
    end process;
end;


