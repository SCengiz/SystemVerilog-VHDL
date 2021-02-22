library ieee;
use ieee.std_logic_1164.all;

entity mux2 is 
    generic(N : integer := 8);
port
(
    in_0, in_1   : in std_logic_vector(N-1 downto 0);
    sel          : in std_logic;
    outt         : out std_logic_vector(N-1 downto 0)
);
end;

-- NOTE: The concurrent assigment statement
-- ... should be written as like a when A = '0' else ..

architecture synth of mux2 is 
begin
    outt <= in_0 when sel = '0' else
            in_1;
end;

