library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
-- Testbench 没有端口
end testbench;

architecture tb of testbench is
    -- 声明待测试组件
    component seq_detect
    port(
         clk : in std_logic;
         reset : in std_logic;
         datain : in std_logic;
         match : out std_logic
        );
    end component;

    -- 内部信号定义
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal datain : std_logic := '0';
    signal match : std_logic;

    -- 定义时钟周期
    constant clk_period : time := 10 ns;

begin
    -- 实例化被测设计 (UUT)
    uut: seq_detect port map (
          clk => clk,
          reset => reset,
          datain => datain,
          match => match
        );

    -- 时钟生成进程
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- 激励信号产生进程
    stim_proc: process
    begin		
        -- 1. 系统复位
        reset <= '1';
        wait for 20 ns;	
        reset <= '0';
        wait for 10 ns;

        -- 2. 开始输入序列测试
        -- 尝试输入：0 -> 1 -> 1 -> 0 -> 1 (此处应触发match) -> 0 -> 0
        datain <= '0'; wait for clk_period;
        datain <= '1'; wait for clk_period; -- 状态 -> S01
        datain <= '1'; wait for clk_period; -- 状态保持 S01
        datain <= '0'; wait for clk_period; -- 状态 -> S10
        
        datain <= '1'; wait for clk_period; -- 状态 -> S11, 此时 match 变为 1
        
        -- 3. 验证锁定功能 (继续输入数据，看 match 是否保持为 1)
        datain <= '0'; wait for clk_period;
        datain <= '0'; wait for clk_period;
        
        -- 4. 验证复位功能
        reset <= '1'; wait for clk_period;
        reset <= '0'; wait for clk_period;
        
        --5. 验证正常功能
        datain <= '1'; wait for clk_period * 2;
        datain <= '0'; wait for clk_period;
        datain <= '1'; wait for clk_period;


        wait; -- 停止仿真
    end process;

end tb;