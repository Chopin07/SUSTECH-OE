library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decimal_counter is
-- 测试平台没有输入输出端口
end tb_decimal_counter;

architecture sim of tb_decimal_counter is

    -- 1. 声明被测组件 (UUT)
    component decimal_counter
        Port ( CLK : in STD_LOGIC;
               RESET : in STD_LOGIC;
               LOAD : in STD_LOGIC;
               BCD_IN : in std_logic_vector(11 downto 0);
               LED : out std_logic_vector(11 downto 0));
    end component;

    -- 2. 声明内部信号，连接到 UUT
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal load   : std_logic := '0';
    signal bcd_in : std_logic_vector(11 downto 0) := (others => '0');
    signal led    : std_logic_vector(11 downto 0);

    -- 定义时钟周期 (假设 100MHz = 10ns)
    constant clk_period : time := 10 ns;

begin

    -- 3. 实例化被测设计
    uut: decimal_counter 
        port map (
            CLK => clk,
            RESET => reset,
            LOAD => load,
            BCD_IN => bcd_in,
            LED => led
        );

    -- 4. 生成时钟信号
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- 5. 测试向量进程
    stim_proc: process
    begin		
        -- 步骤 A: 初始化复位
        reset <= '1';
        wait for 20 ns;	
        reset <= '0';
        wait for 20 ns;

        -- 步骤 B: 测试 LOAD 功能 (预设数字为 129)
        -- BCD: 百位=0001(1), 十位=0010(2), 个位=1001(9)
        bcd_in <= "000100101001"; 
        load <= '1';
        wait for 100 ns; -- 保持一段时间确保在时钟沿被捕获
        load <= '0';

        -- 步骤 C: 观察计数
        -- 注意：因为原代码分频器很大，实际仿真时你可能需要手动在仿真器中
        -- 将 clock_divider 信号直接 "Force" 为 101111101011110000011111110
        -- 这样下一跳就能看到数字变化。
        
        wait for 1 us;
        
        -- 结束仿真
        report "Simulation Finished";
        wait;
    end process;

end sim;