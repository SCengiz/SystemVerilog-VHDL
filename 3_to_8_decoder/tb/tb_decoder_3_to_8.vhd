library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_decoder_3_to_8 is
end;

-- signals for testbench a initially "000"
architecture sim of tb_decoder_3_to_8 is 
    signal a        : std_logic_vector(2 downto 0) := "000";
    signal y        : std_logic_vector(7 downto 0);

-- variable cnt is std_logic_vector type must be initally "000"
-- in for loop VHDL 0 to 7 means [0 downto 7]
-- need to cast variable to std_logic_vector and decide it is signed or unsigned
-- because we sum two variable or signal.
begin
dut : entity work.decoder_3_to_8
    port map(in_a => a, out_y => y);

    process is
        variable cnt : std_logic_vector(2 downto 0) := "000";
    begin
        for kk in 0 to 7 loop
            a <= std_logic_vector(unsigned(a) + unsigned(cnt));   wait for 100ns;
            cnt := std_logic_vector(unsigned(cnt) + "001");
        end loop;
        wait;
    end process;
end;