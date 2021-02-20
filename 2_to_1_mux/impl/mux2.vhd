library ieee; 
use ieee.std_logic_1164.all; 

entity mux2 is 
    generic(N : integer := 4);
port
(
    in_0, in_1 : in std_logic_vector(N-1 downto 0);
    sel        : in std_logic;
    y       : out std_logic_vector(N-1 downto 0)
);
end;

architecture synth of mux2 is 
begin
    y <= in_1 when sel = '0' else in_0;
end;
