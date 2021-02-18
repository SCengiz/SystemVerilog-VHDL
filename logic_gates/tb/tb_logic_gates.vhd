library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_logic_gates is
end tb_logic_gates;

architecture sim of tb_logic_gates is 
    constant N : integer := 2;
    component logic_gates
        port
        (
            a, b    : in std_logic_vector(N-1 downto 0);
            y       : out std_logic_vector(N-1 downto 0)
        );
    end component;
    signal a, b, y : std_logic_vector(N-1 downto 0);

begin
dut: logic_gates 
    generic map(N => N)
    port map(a => a, b => b, y => y);

    process begin
        a <= b"00"; b <= b"00"; wait for 10ns;
        a <= b"00"; b <= b"01"; wait for 10ns;
        a <= b"01"; b <= b"00"; wait for 10ns;
        a <= b"01"; b <= b"01"; wait for 10ns;
        wait;
    end process;
end sim;
