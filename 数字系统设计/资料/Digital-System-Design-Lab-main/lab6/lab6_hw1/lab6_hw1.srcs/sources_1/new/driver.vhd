----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/04/21 17:06:47
-- Design Name: 
-- Module Name: driver - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity driver is
    Port (
        clk : in std_logic;
        en : in std_logic; -- 1 enable, 0 disable
        dir : in std_logic; -- 1 forward, 0 backward
        vel : in std_logic_vector (3 downto 0);
        PMOD : out std_logic_vector (3 downto 0)
    );
end driver;

architecture Behavioral of driver is
    
    signal state : integer range 0 to 7 := 0;
    signal counter : integer range -1 to 1464843 := 0;
    signal counter_max : integer range -1 to 1464843 := 0;

begin

    counter_max <= 1464843/to_integer(unsigned(vel)) when vel /= "0000" else 0;

    process(clk)
    begin
        if rising_edge(clk) then
            if (counter = counter_max - 1) then
                counter <= 0;
                if en = '1' then
                    if dir = '1' then
                        case state is
                            when 0 => PMOD <= "1000"; state <= 1;
                            when 1 => PMOD <= "1100"; state <= 2;
                            when 2 => PMOD <= "0100"; state <= 3;
                            when 3 => PMOD <= "0110"; state <= 4;
                            when 4 => PMOD <= "0010"; state <= 5;
                            when 5 => PMOD <= "0011"; state <= 6;
                            when 6 => PMOD <= "0001"; state <= 7;
                            when 7 => PMOD <= "1001"; state <= 0;
                            when others => PMOD <= "0000"; state <= 0;
                        end case;
                    else
                        case state is
                            when 0 => PMOD <= "1000"; state <= 7;
                            when 1 => PMOD <= "1100"; state <= 0;
                            when 2 => PMOD <= "0100"; state <= 1;
                            when 3 => PMOD <= "0110"; state <= 2;
                            when 4 => PMOD <= "0010"; state <= 3;
                            when 5 => PMOD <= "0011"; state <= 4;
                            when 6 => PMOD <= "0001"; state <= 5;
                            when 7 => PMOD <= "1001"; state <= 6;
                            when others => PMOD <= "0000"; state <= 0;
                        end case;
                    end if;
                end if;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

end Behavioral;
