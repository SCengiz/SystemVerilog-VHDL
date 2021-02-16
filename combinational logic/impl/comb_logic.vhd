library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comb_logic is 
    port
    (
        a, b, c: in std_logic;
        y      : out std_logic
    );

end;

architecture synth of comb_logic is 
begin
    y <= (not a and not b and not c) or
         (a and not b and not c) or
         (a and not b and c);
end;
