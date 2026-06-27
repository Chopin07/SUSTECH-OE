library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timer is
    Port ( 
        clk    : in std_logic;
        btnc   : in std_logic;
        btnu   : in std_logic;
        number : out std_logic_vector (31 downto 0)
    );
end timer;

architecture Behavioral of timer is

    -- ==========================================
    -- 核心警告：仿真时，请把 MAX_COUNT 改为 999 ！！！
    -- 下板测试时，请改回 99999999 ！！！
    -- ==========================================
    constant MAX_COUNT : integer := 99999999; -- 目前为仿真加速状态 

    signal clk_cnt    : integer range 0 to 99999999 := 0;
    signal blink_cnt  : integer range 0 to 49999999 := 0;
    signal blink_flag : std_logic := '0';

    -- 时间寄存器 (因为包含12点，所以 range 必须是 0 到 12)
    signal sec   : integer range 0 to 59 := 0;
    signal min   : integer range 0 to 59 := 0;
    signal hr    : integer range 0 to 12 := 0;  -- 初始值为 0
    signal am_pm : std_logic := '0';            -- 0=AM, 1=PM

    signal state : integer range 0 to 3 := 0;

begin

    -- 核心时序控制
    process(clk)
    begin
        if rising_edge(clk) then
            -- 1. 1Hz 计时逻辑
            if clk_cnt >= MAX_COUNT then
                clk_cnt <= 0;
                if state = 0 then -- 只有在空闲状态才走时
                    if sec = 59 then
                        sec <= 0;
                        if min = 59 then
                            min <= 0;
                            -- ================================================
                            -- 【你专属的特殊时间跳变逻辑】
                            -- ================================================
                            if hr = 11 and am_pm = '1' then      -- 11 PM -> 0 AM
                                hr <= 0;
                                am_pm <= '0';
                            elsif hr = 11 and am_pm = '0' then   -- 11 AM -> 12 AM
                                hr <= 12;
                                am_pm <= '0';
                            elsif hr = 12 then                   -- 12 AM -> 1 PM (包括防御性容错)
                                hr <= 1;
                                am_pm <= '1';
                            else                                 -- 其他正常加1
                                hr <= hr + 1;
                            end if;
                            -- ================================================
                        else
                            min <= min + 1;
                        end if;
                    else
                        sec <= sec + 1;
                    end if;
                end if;
            else
                clk_cnt <= clk_cnt + 1;
            end if;

            -- 2. 2Hz 闪烁逻辑 (0.5秒亮，0.5秒灭)
            if blink_cnt >= MAX_COUNT / 2 then
                blink_cnt <= 0;
                blink_flag <= not blink_flag;
            else
                blink_cnt <= blink_cnt + 1;
            end if;

            -- 3. 处理状态切换 (BTNC)
            if btnc = '1' then
                if state = 3 then
                    state <= 0;
                else
                    state <= state + 1;
                end if;
            end if;

            -- 4. 处理数值调整 (BTNU)
            if btnu = '1' then
                case state is
                    when 1 => -- 调分
                        if min = 59 then min <= 0; else min <= min + 1; end if;
                    when 2 => -- 调时
                        -- 【手动调时也严格遵守上述跳变逻辑】
                        if hr = 11 and am_pm = '1' then
                            hr <= 0; am_pm <= '0';
                        elsif hr = 11 and am_pm = '0' then
                            hr <= 12; am_pm <= '0';
                        elsif hr = 12 then
                            hr <= 1; am_pm <= '1';
                        else
                            hr <= hr + 1;
                        end if;
                    when 3 => -- 调AM/PM
                        am_pm <= not am_pm;
                    when others => null;
                end case;
            end if;

        end if;
    end process;

    -- 组合逻辑：格式化输出给数码管
    process(sec, min, hr, am_pm, state, blink_flag)
        variable am_pm_code : std_logic_vector(7 downto 0);
    begin
        -- 判断 AM 还是 PM (A=1010, P=1100, M/n=1011)
        if am_pm = '0' then
            am_pm_code := "10101011"; -- "AM"
        else
            am_pm_code := "11001011"; -- "PM"
        end if;

        -- 正常数值输出 (hr 范围为 0-12，/10 和 mod 10 可以完美处理)
        number(31 downto 24) <= am_pm_code;
        number(23 downto 20) <= std_logic_vector(to_unsigned(hr / 10,  4));
        number(19 downto 16) <= std_logic_vector(to_unsigned(hr mod 10, 4));
        number(15 downto 12) <= std_logic_vector(to_unsigned(min / 10, 4));
        number(11 downto  8) <= std_logic_vector(to_unsigned(min mod 10, 4));
        number( 7 downto  4) <= std_logic_vector(to_unsigned(sec / 10, 4));
        number( 3 downto  0) <= std_logic_vector(to_unsigned(sec mod 10, 4));

        -- 闪烁覆盖逻辑 (全灭=1111)
        if state = 1 and blink_flag = '1' then
            number(15 downto 8) <= "11111111";
        elsif state = 2 and blink_flag = '1' then
            number(23 downto 16) <= "11111111";
        elsif state = 3 and blink_flag = '1' then
            number(31 downto 24) <= "11111111";
        end if;
    end process;

end Behavioral;