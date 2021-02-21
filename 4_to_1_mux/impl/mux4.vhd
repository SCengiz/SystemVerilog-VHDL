library ieee; 
use ieee.std_logic_1164.all; 

entity mux4 is
port
(   
    in_0, in_1, in_2, in_3 : in std_logic_vector(3 downto 0);
    outt                   : out std_logic_vector(3 downto 0);
    sel                    : in std_logic_vector(1 downto 0)
);
end;

architecture synth of mux4 is 
begin
    outt <= in_0 when sel = "00" else
            in_1 when sel = "01" else
            in_2 when sel = "10" else
            in_3;
end; 

