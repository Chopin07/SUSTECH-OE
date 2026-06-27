library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench is
-- Testbench 没有端口
end testbench;

architecture tb of testbench is

    signal clk   : std_logic := '0';
    signal btnc  : std_logic := '0';
    signal btnu  : std_logic := '0';
    signal an    : std_logic_vector(7 downto 0);
    signal seg   : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    uut: entity work.topmodule
        port map (
            CLK  => clk,
            BTNC => btnc,
            BTNU => btnu,
            AN   => an,
            SEG  => seg
        );

    clk_process : process
    begin
        while now < 150 ms loop -- 跑 150ms 就够看清所有逻辑了
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;

    stim_proc: process
    begin
        wait for 100 ns;

        -- 模拟消抖后单次点击 (由于我们没有给消抖模块加速，按键依然需要按住超过20ms)
        wait for 1 ms;
        
        -- 按下 BTNC (进设置分钟)
        btnc <= '1'; wait for 25 ms; btnc <= '0'; wait for 5 ms;
        
        -- 按下 BTNU 两下 (分钟加2)
        btnu <= '1'; wait for 25 ms; btnu <= '0'; wait for 5 ms;
        btnu <= '1'; wait for 25 ms; btnu <= '0'; wait for 5 ms;
        
        -- 按下 BTNC (进设置小时)
        btnc <= '1'; wait for 25 ms; btnc <= '0'; wait for 5 ms;
        
        -- 按下 BTNU 一下 (小时加1)
        btnu <= '1'; wait for 25 ms; btnu <= '0'; wait for 5 ms;

        wait;
    end process;

end tb;