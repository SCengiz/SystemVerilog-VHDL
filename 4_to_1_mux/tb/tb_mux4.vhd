library ieee;
use ieee.std_logic_1164.all;

entity tb_mux4 is 
end;

architecture sim of tb_mux4 is
    component mux4
        port
        (
            in_0, in_1, in_2, in_3 : in std_logic_vector(3 downto 0);
            outt                   : out std_logic_vector(3 downto 0);
            sel                    : in std_logic_vector(1 downto 0)        
        );
    end component;
    signal d0, d1, d2, d3, y : std_logic_vector(3 downto 0);
    signal s                 : std_logic_vector(1 downto 0);

begin
dut : mux4
    port map(in_0 => d0, in_1 => d1, in_2 => d2, in_3 => d3, outt => y, sel => s);

    process begin
        d0 <=  b"0010"; d1 <= b"0101"; d2 <= b"0010"; d3 <= b"1101";
        s <= b"01"; wait for 100ns;
        d0 <=  b"1010"; d1 <= b"0001"; d2 <= b"1110"; d3 <= b"1111";
        s <= b"11"; wait for 100ns;
        d0 <=  b"0000"; d1 <= b"1101"; d2 <= b"1010"; d3 <= b"0001";
        s <= b"00"; wait for 100ns;
        d0 <=  b"0011"; d1 <= b"1101"; d2 <= b"0000"; d3 <= b"1111";
        s <= b"10"; wait for 100ns;

        wait;
    end process;
end sim;
