library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity repetitive_testbench is
end repetitive_testbench;

architecture Behavioral of repetitive_testbench is
    component repetitve_addtion
        port(
            CLK    : in std_logic;
            RESET  : in std_logic;
            start  : in std_logic;
            a_in   : in std_logic_vector(4 downto 0);
            b_in   : in std_logic_vector(4 downto 0);
            r      : out std_logic_vector(9 downto 0);
            ready  : out std_logic
        );
    end component;

    signal CLK     : std_logic := '0';
    signal RESET   : std_logic := '1';
    signal start   : std_logic := '0';
    signal a_in    : std_logic_vector(4 downto 0) := (others => '0');
    signal b_in    : std_logic_vector(4 downto 0) := (others => '0');
    signal r       : std_logic_vector(9 downto 0);
    signal ready   : std_logic;

    constant CLK_PERIOD : time := 10 ns;

begin
    uut: repetitve_addtion
        port map (
            CLK => CLK,
            RESET => RESET,
            start => start,
            a_in => a_in,
            b_in => b_in,
            r => r,
            ready => ready
        );

    -- Clock generation (100 MHz)
    CLK <= not CLK after CLK_PERIOD / 2;

    stimulus: process
        variable expected_r : std_logic_vector(9 downto 0);
    begin
        -- Initialize and reset
        RESET <= '1';
        wait for CLK_PERIOD * 2;
        RESET <= '0';
        wait for CLK_PERIOD;
        wait for 100 ns;

        -- Test 1: 0 * 0
        a_in <= "00000"; b_in <= "00000";
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';
        expected_r := std_logic_vector(to_unsigned(0, 10));
        wait until ready = '1';
        assert r = expected_r report "Test 1 failed: 0*0" severity error;

        -- Test 2: 1 * 1
        a_in <= "00001"; b_in <= "00001";
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';
        expected_r := std_logic_vector(to_unsigned(1, 10));
        wait until ready = '1';
        assert r = expected_r report "Test 2 failed: 1*1" severity error;

        -- Test 3: Max value * Max value (31*31)
        a_in <= "11111"; b_in <= "11111";
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';
        expected_r := std_logic_vector(to_unsigned(31*31, 10));
        wait until ready = '1';
        assert r = expected_r report "Test 3 failed: 31*31" severity error;

        -- Test 4: Max * 1
        a_in <= "11111"; b_in <= "00001";
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';
        expected_r := std_logic_vector(to_unsigned(31, 10));
        wait until ready = '1';
        assert r = expected_r report "Test 4 failed: 31*1" severity error;

        -- Test 5: 1 * Max
        a_in <= "00001"; b_in <= "11111";
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';
        expected_r := std_logic_vector(to_unsigned(31, 10));
        wait until ready = '1';
        assert r = expected_r report "Test 5 failed: 1*31" severity error;

        -- Test 6: Power of 2 multiplication
        a_in <= "00100"; b_in <= "01000";  -- 4 * 8
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';
        expected_r := std_logic_vector(to_unsigned(32, 10));
        wait until ready = '1';
        assert r = expected_r report "Test 6 failed: 4*8" severity error;

        -- End of test
        wait;
    end process;
end Behavioral;