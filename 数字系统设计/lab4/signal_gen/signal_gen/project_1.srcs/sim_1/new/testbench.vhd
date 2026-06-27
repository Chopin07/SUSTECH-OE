library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
-- Testbench 没有端口
end testbench;

architecture tb of testbench is

    -- 组件声明
    component signal_gen
        Port ( 
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            dataout : out STD_LOGIC
        );
    end component;

    -- 内部信号定义
    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal dataout : STD_LOGIC;

    -- 定义时钟周期 (例如 10 ns -> 100 MHz)
    constant clk_period : time := 10 ns;

begin

    -- 实例化待测设计 (DUT)
    uut: signal_gen Port map (
        clk     => clk,
        reset   => reset,
        dataout => dataout
    );

    -- 时钟生成进程
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- 激励施加进程
    stim_proc: process
    begin
        -- 1. 初始化，施加复位信号
        reset <= '1';
        wait for 20 ns; 
        
        -- 2. 释放复位信号，开始正常工作
        reset <= '0';
        
        -- 3. 运行足够长的时间以观察多个完整的 "1101110" 序列循环
        -- 一个完整序列需要 7 个时钟周期 (70 ns)
        wait for 200 ns; 

        -- 仿真结束
        wait;
    end process;

end tb;