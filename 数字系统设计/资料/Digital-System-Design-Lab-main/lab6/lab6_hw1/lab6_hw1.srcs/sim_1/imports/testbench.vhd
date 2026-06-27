library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity driver_tb is
end driver_tb;

architecture Behavioral of driver_tb is

    component driver is
        Port (
            clk  : in std_logic;
            en   : in std_logic;
            dir  : in std_logic;
            vel  : in std_logic_vector (3 downto 0);
            count : out integer range -1 to 60;
            PMOD : out std_logic_vector (3 downto 0)
        );
    end component;

    signal clk  : std_logic := '0';
    signal en   : std_logic := '0';
    signal dir  : std_logic := '0';
    signal vel  : std_logic_vector(3 downto 0) := (others => '0');

    signal PMOD : std_logic_vector(3 downto 0);
    
    constant clk_period : time := 10 ns;

begin

    uut: driver port map (
        clk  => clk,
        en   => en,
        dir  => dir,
        vel  => vel,
        PMOD => PMOD
    );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
        variable step_count : integer := 0;
    begin

        en <= '0';
        dir <= '0';
        vel <= "0000";
        wait for 100 ns;


        en <= '0';
        dir <= '1';
        vel <= "1111";
        wait for 500 ns;
        assert PMOD = "0000" report "Test Failed: PMOD should be 0000 when en=0" severity error;


        en <= '1';
        dir <= '1';
        vel <= "0111";
        wait until rising_edge(clk);
        
        wait for 1000000 ns;

        wait;
    end process;

end Behavioral;