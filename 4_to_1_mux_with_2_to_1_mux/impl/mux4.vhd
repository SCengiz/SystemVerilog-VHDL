library ieee;
use ieee.std_logic_1164.all;

-- mux4 signal declaration.
entity mux4 is
    generic(N : integer := 8);
port
(  
    in_0, in_1, in_2, in_3  : in std_logic_vector(N-1 downto 0);
    sel                     : in std_logic_vector(1 downto 0);
    outt                    : out std_logic_vector(N-1 downto 0) 
);
end;

-- We must rewrite mux2 block.
architecture struct of mux4 is
    component mux2
        port
        (
            in_0, in_1   : in std_logic_vector(N-1 downto 0);
            sel          : in std_logic;
            outt         : out std_logic_vector(N-1 downto 0)
        );
    end component;
-- internal signals declaration.
    signal out_low, out_high  : std_logic_vector(N-1 downto 0);

begin
    -- mapping parameters with mux2.
    lower_out  : mux2 port map(in_0, in_1, sel(0), out_low);
    higher_out : mux2 port map(in_2, in_3, sel(0), out_high);
    final_out  : mux2 port map(out_low, out_high, sel(1), outt);
end;
