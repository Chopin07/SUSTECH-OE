library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    -- 常量定义
    constant CLK_PERIOD : time := 10 ns;

    -- 信号声明
    signal clk     : STD_LOGIC := '0';
    signal rst     : STD_LOGIC := '1';
    signal start   : STD_LOGIC := '0';
    signal n       : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
    signal fib_n   : STD_LOGIC_VECTOR (63 downto 0);
    signal finish  : STD_LOGIC;

begin

    -- 1. 时钟生成 (100MHz)
    clk <= not clk after CLK_PERIOD / 2;

    -- 2. 实例化 UUT
    uut: entity work.fibonacci_fsm
        port map (
            clk    => clk,
            rst    => rst,
            start  => start,
            n      => n,
            fib_n  => fib_n,
            finish => finish
        );

    -- 3. 激励进程
    stimulus_process : process
        -- 定义一个内部 Procedure，减少重复代码
        procedure check_fib(
            constant input_n : in integer;
            constant expected : in unsigned(63 downto 0)
        ) is
        begin
            wait until rising_edge(clk);
            n <= std_logic_vector(to_unsigned(input_n, 6));
            start <= '1';
            wait until rising_edge(clk);
            start <= '0';

            -- 等待完成或超时保护
            wait until finish = '1' for 2 us; 
            
            assert (finish = '1') 
                report "Error: Calculation timed out for n=" & integer'image(input_n)
                severity failure;

            -- 自动结果校验
            assert (unsigned(fib_n) = expected)
                report "Error: Result mismatch for n=" & integer'image(input_n) & 
                       " Got " & integer'image(to_integer(unsigned(fib_n))) &
                       " Expected " & integer'image(to_integer(expected))
                severity error;
            
            report "Test passed for n=" & integer'image(input_n);
            wait for 20 ns;
        end procedure;

    begin
        -- 初始化
        rst   <= '1';
        start <= '0';
        wait for 45 ns; -- 错开时钟边沿
        rst   <= '0';
        wait for 20 ns;

        -- 4. 测试用例
        -- 格式：check_fib( 输入n, 预期结果 )
        check_fib(0,  to_unsigned(0, 64));
        check_fib(4,  to_unsigned(3, 64));
        check_fib(8, to_unsigned(21, 64));
        
        -- 测试最大值 n=63
        -- 注：Fib(63) 是 633,825,300,114,114,700,748... 
        -- 但 unsigned 64位最大约 1.8e19，请确保结果未溢出
        -- 实际上 Fib(93) 是 64位 unsigned 的上限
        check_fib(63, unsigned'(x"00000005F5E10052"));

        -- 仿真结束
        report "All tests completed successfully!";
        wait;
    end process;

end Behavioral;