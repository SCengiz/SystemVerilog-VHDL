library ieee;
use ieee.std_logic_1164.all;

entity decoder_3_to_8 is
port
(
    in_a        : in std_logic_vector(2 downto 0);
    out_y       : out std_logic_vector(7 downto 0)
);
end;

--NOTE: In VHDL same block but when we use x"XX" gives an error fix this !!!
architecture synth of decoder_3_to_8 is
begin
    process(all) begin
        case in_a is 
            when "000" =>    out_y <= x"01";
            when "001" =>    out_y <= x"02";
            when "010" =>    out_y <= x"04";
            when "011" =>    out_y <= x"08";
            when "100" =>    out_y <= x"10";
            when "101" =>    out_y <= x"20";
            when "110" =>    out_y <= x"40";
            when "111" =>    out_y <= x"80";
            when others =>   out_y <= x"00";
        end case;
    end process;
end;

