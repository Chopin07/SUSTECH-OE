library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pipeline_testbench is
end pipeline_testbench;

architecture Behavioral of pipeline_testbench is
    component pipeline_multiplier is
        port(
            clk   : in  std_logic;
            reset : in  std_logic;
            a     : in  std_logic_vector(4 downto 0);
            b     : in  std_logic_vector(4 downto 0);
            y     : out std_logic_vector(9 downto 0)
        );
    end component;

    constant CLK_PERIOD : time := 30 ns;
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal a, b  : std_logic_vector(4 downto 0);
    signal y     : std_logic_vector(9 downto 0);

begin
    -- Clock generation
    clk <= not clk after CLK_PERIOD/2;

    -- Instantiate DUT
    uut: pipeline_multiplier
        port map(
            clk   => clk,
            reset => reset,
            a     => a,
            b     => b,
            y     => y
        );

    -- Test stimulus
    stimulus: process
    begin
        -- Initialize and reset
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD;

        -- Test 1: 0 * 0
        a <= "00000"; b <= "00000";
        wait for CLK_PERIOD;
        assert y = "0000000000" report "Test 1 failed: 0*0" severity error;

        -- Test 2: 1 * 1
        a <= "00001"; b <= "00001";
        wait for CLK_PERIOD;
        assert y = "0000000001" report "Test 2 failed: 1*1" severity error;

        -- Test 3: 31 * 31
        a <= "11111"; b <= "11111";
        wait for CLK_PERIOD;
        assert y = "1111100001" report "Test 3 failed: 31*31" severity error;

        -- Test 4: Max * 1
        a <= "11111"; b <= "00001";
        wait for CLK_PERIOD;
        assert y = "1111100001" report "Test 4 failed: 31*1" severity error;

        -- Test 5: 1 * Max
        a <= "00001"; b <= "11111";
        wait for CLK_PERIOD;
        assert y = "0000011111" report "Test 5 failed: 1*31" severity error;

        -- Test 6: 4 * 8
        a <= "00100"; b <= "01000";
        wait for CLK_PERIOD;
        assert y = "0000100000" report "Test 6 failed: 4*8" severity error;

        -- End of test
        wait;
    end process;

end Behavioral;