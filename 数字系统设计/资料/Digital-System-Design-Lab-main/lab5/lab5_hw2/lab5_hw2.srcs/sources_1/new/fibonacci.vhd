library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fibonacci_fsm is
    Port (
        clk    : in  STD_LOGIC;
        rst    : in  STD_LOGIC;
        start  : in  STD_LOGIC;
        n      : in  STD_LOGIC_VECTOR (5 downto 0);
        fib_n  : out STD_LOGIC_VECTOR (63 downto 0);
        finish : out STD_LOGIC
    );
end fibonacci_fsm;

architecture Behavioral of fibonacci_fsm is
    type state_type is (IDLE, CALC, DONE);
    signal state   : state_type := IDLE;
    signal prev    : unsigned(63 downto 0);
    signal current : unsigned(63 downto 0);
    signal counter : unsigned(5 downto 0); -- 使用 unsigned 类型节省资源并匹配输入 n
begin

    process(clk, rst)
    begin
        if rst = '1' then
            state   <= IDLE;
            prev    <= (others => '0');
            current <= (others => '0');
            counter <= (others => '0');
            fib_n   <= (others => '0');
            finish  <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    finish <= '0';
                    if start = '1' then
                        -- 初始化逻辑：处理 n=0 的特殊情况
                        prev    <= (others => '0');
                        counter <= (others => '0');
                        if unsigned(n) = 0 then
                            current <= (others => '0');
                            state   <= DONE; -- 直接跳转到结束
                        else
                            current <= to_unsigned(1, 64);
                            state   <= CALC;
                        end if;
                    end if;

                when CALC =>
                    -- 计算核心逻辑
                    if counter < unsigned(n) - 1 then
                        prev    <= current;
                        current <= current + prev;
                        counter <= counter + 1;
                    else
                        state   <= DONE;
                    end if;

                when DONE =>
                    -- 结果保持稳定输出
                    fib_n  <= std_logic_vector(current);
                    finish <= '1';
                    if start = '0' then -- 等待外部 start 信号拉低后再回到 IDLE，防止重复触发
                        state <= IDLE;
                    end if;

                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process;

end Behavioral;