library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_gen is
   Port ( 
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        dataout : out STD_LOGIC
    );
end signal_gen;

architecture Behavioral of signal_gen is
-- 定义状态信号，使用与状态转移图一致的3位二进制编码
    signal current_state : STD_LOGIC_VECTOR(2 downto 0);
begin
   -- 状态转移同步进程
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= "000"; -- 高电平复位，初始化为000
        elsif rising_edge(clk) then
            case current_state is
                when "000" => current_state <= "001";
                when "001" => current_state <= "010";
                when "010" => current_state <= "011";
                when "011" => current_state <= "100";
                when "100" => current_state <= "101";
                when "101" => current_state <= "110";
                when "110" => current_state <= "000";
                when "111" => current_state <= "000"; -- 未使用状态的处理
                when others => current_state <= "000";
            end case;
        end if;
    end process;

    -- 输出组合逻辑进程 (Moore机：输出仅与当前状态有关)
    process(current_state)
    begin
        case current_state is
            when "000" => dataout <= '1';
            when "001" => dataout <= '1';
            when "010" => dataout <= '0';
            when "011" => dataout <= '1';
            when "100" => dataout <= '1';
            when "101" => dataout <= '1';
            when "110" => dataout <= '0';
            when "111" => dataout <= 'X'; -- 对应图中的 /X
            when others => dataout <= '0';
        end case;
    end process;
end Behavioral;
