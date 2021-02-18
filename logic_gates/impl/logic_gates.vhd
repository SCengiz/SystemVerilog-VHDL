library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logic_gates is 
    generic(N : integer := 2);
port 
(
    a, b: in std_logic_vector(N-1 downto 0);
    y   : out std_logic_vector(N-1 downto 0)
);
end;

architecture synth of logic_gates is 
    signal y1, y2, y3 : std_logic_vector(N-1 downto 0);
begin
    y1 <= a and b;
    y2 <= a nor b;
    y3 <= a xnor b;
    y <= y1 or y2 or y3;
end;
