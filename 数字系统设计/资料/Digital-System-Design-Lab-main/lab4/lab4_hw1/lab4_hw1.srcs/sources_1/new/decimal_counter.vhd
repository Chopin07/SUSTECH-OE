----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/17 16:52:23
-- Design Name: 
-- Module Name: decimal_counter - concurrent_arcg
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decimal_counter is
    Port ( CLK : in STD_LOGIC;--时钟
           RESET : in STD_LOGIC;--复位
           LOAD : in STD_LOGIC;--置位
           BCD_IN : in std_logic_vector(15 downto 0);--BCD码
           LED : out std_logic_vector(11 downto 0));--对应十进制，输出计数
end decimal_counter;

architecture concurrent_arch of decimal_counter is

signal d1_reg, d10_reg, d100_reg: std_logic_vector (3 downto 0);--寄存器
signal d1_next, d10_next, d100_next: std_logic_vector (3 downto 0);--组合逻辑
--27位宽内部信号
signal clock_divider : std_logic_vector (26 downto 0) := (others => '0');

begin

--寄存
process (CLK, RESET) is
begin
    if RESET = '1' then -- 只要reset触发，归零
        d1_reg <= "0000";
        d10_reg <= "0000";
        d100_reg <= "0000";
    elsif CLK'event and CLK='1' then
        if clock_divider = "101111101011110000011111111" then--系统时钟100MHz，数到这个值正好1s
            clock_divider <= (others => '0');
            if LOAD = '1' then -- 置位触发             
                if BCD_IN(11 downto 8) > 9 or 
                   BCD_IN(7 downto 4) > 9 or 
                   BCD_IN(3 downto 0) > 9 then
                  
                    d1_reg <= "0000";
                    d10_reg <= "0000";
                    d100_reg <= "0000";
                 else
                 d1_reg <= BCD_IN(3 downto 0);--读取输入
                 d10_reg <= BCD_IN(7 downto 4);
                 d100_reg <= BCD_IN(11 downto 8);
                 end if;
            else
                d1_reg <= d1_next;--没按正常计数
                d10_reg <= d10_next;
                d100_reg <= d100_next;
            end if;
        else
            clock_divider <= clock_divider + 1;--确保独立工作
        end if;
    end if;
end process;

-- 十进制进位
d1_next <= "0000" when d1_reg = 9 else d1_reg + 1;
d10_next <= "0000" when (d1_reg = 9 and d10_reg = 9) else d10_reg + 1 when d1_reg = 9 else d10_reg;
d100_next <= "0000" when (d1_reg = 9 and d10_reg = 9 and d100_reg = 9) else d100_reg + 1 when (d1_reg = 9 and d10_reg = 9) else d100_reg;

-- LED输出
LED(3 downto 0) <= d1_reg;
LED(7 downto 4) <= d10_reg;
LED(11 downto 8) <= d100_reg;

end concurrent_arch;