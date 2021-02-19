library ieee; 
use ieee.std_logic_1164.all;

entity tb_mux2 is 
end tb_mux2;

architecture sim of tb_mux2 is
    constant N : integer := 4;
    component mux2
        port
        (
            in_0, in_1   : in std_logic_vector(N-1 downto 0);
            sel          : in std_logic;
            y            : out std_logic_vector(N-1 downto 0)
        );
    end component;
    signal d0, d1, y : std_logic_vector(N-1 downto 0);
    signal s         : std_logic;

begin
dut : mux2
    generic map(N => N)
    port map(in_0 => d0, in_1 => d1, sel => s, y => y);

    process begin
        d0 <=  b"0010"; d1 <= b"0001";
        s <= '0'; wait for 100ns;
        d0 <=  b"0000"; d1 <= b"0101";
        s <= '0'; wait for 100ns;
        d0 <=  b"0110"; d1 <= b"0101";
        s <= '0'; wait for 100ns;
        d0 <=  b"0111"; d1 <= b"0101";
        s <= '0'; wait for 100ns;
        wait;
    end process;
end sim;

