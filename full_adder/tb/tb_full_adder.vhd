library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end;

architecture sim of tb_full_adder is
    component full_adder
        port
        (
            in_0, in_1, c_in  : in std_logic;
            outt, c_out       : out std_logic
        );
    end component;
    signal d0, d1, cin, cout, y : std_logic;
 
begin
dut : full_adder
    port map(in_0 => d0, in_1 => d1, c_in => cin, outt => y, c_out => cout);

    process begin
        d0 <= '0'; d1 <= '0'; cin <= '0'; wait for 100ns;
        d0 <= '0'; d1 <= '0'; cin <= '1'; wait for 100ns;
        d0 <= '0'; d1 <= '1'; cin <= '0'; wait for 100ns;
        d0 <= '0'; d1 <= '1'; cin <= '1'; wait for 100ns;
        d0 <= '1'; d1 <= '0'; cin <= '0'; wait for 100ns;
        d0 <= '1'; d1 <= '0'; cin <= '1'; wait for 100ns;
        d0 <= '1'; d1 <= '1'; cin <= '0'; wait for 100ns;
        d0 <= '1'; d1 <= '1'; cin <= '1'; wait for 100ns;
        wait;
    end process;

end sim;
