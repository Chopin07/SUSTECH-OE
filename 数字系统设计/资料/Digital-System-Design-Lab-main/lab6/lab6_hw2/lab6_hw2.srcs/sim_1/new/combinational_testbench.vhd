library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity combinational_testbench is
end combinational_testbench;

architecture Behavioral of combinational_testbench is
    component combinational_design is
        port (
            a, b : in std_logic_vector(4 downto 0);
            y : out std_logic_vector(9 downto 0)
        );
    end component;

    signal a, b : std_logic_vector(4 downto 0);
    signal y : std_logic_vector(9 downto 0);
    signal clk : std_logic := '0';

begin
    -- Unit Under Test instantiation
    uut: combinational_design port map (a => a, b => b, y => y);

    clk_process: process
    begin
        clk <= not clk;
        wait for 5 ns;
    end process;

    stimulus: process
        variable expected_y : std_logic_vector(9 downto 0);
    begin
        -- Test 1: 0 * 0
        a <= "00000"; b <= "00000";
        wait for 10 ns;
        expected_y := std_logic_vector(unsigned(a) * unsigned(b));
        assert y = expected_y
            report "Test 1 failed"
            severity error;

        -- Test 2: 1 * 1
        a <= "00001"; b <= "00001";
        wait for 10 ns;
        expected_y := std_logic_vector(unsigned(a) * unsigned(b));
        assert y = expected_y
            report "Test 2 failed"
            severity error;

        -- Test 3: Max value * Max value (31*31)
        a <= "11111"; b <= "11111";
        wait for 10 ns;
        expected_y := std_logic_vector(unsigned(a) * unsigned(b));
        assert y = expected_y
            report "Test 3 failed"
            severity error;

        -- Test 4: Max * 1
        a <= "11111"; b <= "00001";
        wait for 10 ns;
        expected_y := std_logic_vector(unsigned(a) * unsigned(b));
        assert y = expected_y
            report "Test 4 failed"
            severity error;

        -- Test 5: 1 * Max
        a <= "00001"; b <= "11111";
        wait for 10 ns;
        expected_y := std_logic_vector(unsigned(a) * unsigned(b));
        assert y = expected_y
            report "Test 5 failed"
            severity error;

        -- Test 6: Power of 2 multiplication (4 * 8)
        a <= "00100"; b <= "01000";
        wait for 10 ns;
        expected_y := std_logic_vector(unsigned(a) * unsigned(b));
        assert y = expected_y
            report "Test 6 failed"
            severity error;

        -- End of test
        wait;
    end process;
end Behavioral;