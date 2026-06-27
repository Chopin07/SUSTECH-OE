----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/04/21 17:06:12
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
    Port (
        clk : in std_logic;
        btnu : in std_logic;
        btnd : in std_logic;
        number : out std_logic_vector (3 downto 0)
    );
end control;

architecture Behavioral of control is

    signal clock_divider : integer range 0 to 99999999 := 0;
    signal num : integer range 0 to 9 := 0;
    signal num_new : integer range 0 to 9;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if btnu = '1' and num < 9 then
                num_new <= num + 1;
            elsif btnd = '1' and num > 0 then
                num_new <= num - 1;
            end if;

            if clock_divider = 99999999 then
                num <= num_new;
                clock_divider <= 0;
            else
                clock_divider <= clock_divider + 1;
            end if;
        end if;
    end process;

    number <= std_logic_vector(to_unsigned(num, 4));

end Behavioral;
