library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seq_detect is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           datain : in STD_LOGIC;
           match : out STD_LOGIC);
end seq_detect;

architecture Behavioral of seq_detect is
    -- 定义状态机的四个状态
    type state_type is (S00, S01, S10, S11);
    signal current_state, next_state : state_type;
begin

    -- 进程1：时序逻辑，负责状态更新（包含异步复位）
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S00;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- 进程2：组合逻辑，负责状态转移条件和输出
    process(current_state, datain)
    begin
        -- 默认输出为0，避免产生锁存器(Latch)
        match <= '0'; 
        
        case current_state is
            when S00 =>
                if datain = '1' then
                    next_state <= S01;
                else
                    next_state <= S00;
                end if;
                
            when S01 =>
                if datain = '0' then
                    next_state <= S10;
                else
                    next_state <= S01;
                end if;
                
            when S10 =>
                if datain = '1' then
                    next_state <= S11;
                    match <= '1'; -- 转移到S11时输出1 (对应图中的 1/1)
                else
                    next_state <= S00;
                end if;
                
            when S11 =>
                next_state <= S11; -- 锁定状态
                match <= '1';      -- 保持输出为1 (对应图中的 0/1, 1/1)
                
            when others =>
                next_state <= S00;
        end case;
    end process;

end Behavioral;