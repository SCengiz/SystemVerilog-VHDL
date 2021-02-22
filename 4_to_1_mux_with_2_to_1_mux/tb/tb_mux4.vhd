library ieee;
use ieee.std_logic_1164.all;

entity tb_mux4 is 
end;

-- constant declaration in sim arch.
architecture sim of tb_mux4 is
    constant N : integer := 8; 
    component mux4
        port
        (
            in_0, in_1, in_2, in_3  : in std_logic_vector(N-1 downto 0);
            sel                     : in std_logic_vector(1 downto 0);
            outt                    : out std_logic_vector(N-1 downto 0) 
        );
    end component;
-- parameters for simulation.
    signal d0, d1, d2, d3, y : std_logic_vector(N-1 downto 0);
    signal s                 : std_logic_vector(1 downto 0);

begin
dut : mux4
    -- if we delete line 25 all OK no problem.
    generic map(N => N)
    port map(in_0 => d0, in_1 => d1, in_2 => d2, in_3 => d3, sel => s, outt => y);

    process begin
-- show something in the transcript window with "report".
        report " ** MUX4 TEST BENCH ** "; 
        d0 <= x"00"; d1 <= x"01"; d2 <= x"02"; d3 <= x"03";
        s <= b"00"; wait for 100ns;
        d0 <= x"34"; d1 <= x"A1"; d2 <= x"F2"; d3 <= x"33";
        s <= b"01"; wait for 100ns;
        d0 <= x"65"; d1 <= x"B1"; d2 <= x"E2"; d3 <= x"13";
        s <= b"10"; wait for 100ns;
        d0 <= x"0C"; d1 <= x"4A"; d2 <= x"22"; d3 <= x"43";
        s <= b"11"; wait for 100ns;
        wait;
    end process;
end sim;