library ieee;
use ieee.std_logic_1164.all;

entity tb_d_ff is
end;

architecture sim of tb_d_ff is
    constant N : integer := 8;

-- No need this block!!!
--    component d_ff
--    port
--        (
--            clk, reset, en   : in std_logic;
--            in_d             : in std_logic_vector(N-1 downto 0);
--            out_q            : out std_logic_vector(N-1 downto 0)
--        );
--    end component;

    signal clk, res, en      : std_logic := '0';
    signal d, q              : std_logic_vector(N-1 downto 0);

begin
-- Thanks to "work" keyword we don't need to write the block above.
dut : entity work.d_ff
-- mapping with driver code
    generic map(N => N)
    port map(clk => clk, reset => res, en => en, in_d => d, out_q => q);

    -- clock signal generation.
    process begin
        for kk in 0 to 50 loop
            clk <= not clk;
            wait for 50ns;
        end loop;
        wait;
    end process;

-- NOTE: This while block 0 to 10 but we except 0 t0 12 configure
-- this loop later.
    process is
        variable cnt : integer := 0;
    begin
        while(cnt < 12) loop
            if(cnt mod 2 = 0) then
                d <= x"12"; res <= '1'; en <= '0'; wait for 100ns;
            elsif(cnt mod 5 = 0) then
                d <= x"A2"; res <= '0'; en <= '1'; wait for 100ns;
            else 
                d <= x"B2"; res <= '0'; en <= '0'; wait for 100ns;
            end if;
            cnt := cnt + 1;
        end loop;
        wait;
    end process;
end;

