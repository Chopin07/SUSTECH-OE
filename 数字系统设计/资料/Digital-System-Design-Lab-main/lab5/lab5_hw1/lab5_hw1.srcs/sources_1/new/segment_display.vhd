----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/04/11 17:03:17
-- Design Name: 
-- Module Name: segment_display - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity segment_display is
    Port (
        clk : in  std_logic;
        number : in  std_logic_vector (31 downto 0);
        SEG : out  std_logic_vector (7 downto 0);
        AN : out  std_logic_vector (7 downto 0)
    );
end segment_display;

architecture Behavioral of segment_display is
    signal cnt : std_logic_vector (19 downto 0) := (others => '0');
    signal anode_select : std_logic_vector (2 downto 0);
    signal digit_data : std_logic_vector (3 downto 0);
    signal segment_data : std_logic_vector (6 downto 0);
    signal an_tmp : std_logic_vector (7 downto 0);
begin

    -- counter
    process(clk)
    begin
        if rising_edge(clk) then
            cnt <= cnt + 1;
        end if;
    end process;
    
    -- the number of digits to be displayed
    anode_select <= cnt(19 downto 17);

    -- 3-8 decoder
    with anode_select select
        an_tmp <=
            "11111110" when "000",
            "11111101" when "001",
            "11111011" when "010",
            "11110111" when "011",
            "11101111" when "100",
            "11011111" when "101",
            "10111111" when "110",
            "01111111" when "111",
            "11111111" when others;

    -- the number to be displayed
    with anode_select select
        digit_data <=
            number(3 downto 0) when "000",
            number(7 downto 4) when "001",
            number(11 downto 8) when "010",
            number(15 downto 12) when "011",
            number(19 downto 16) when "100",
            number(23 downto 20) when "101",
            number(27 downto 24) when "110",
            number(31 downto 28) when "111",
            "0000" when others;

    -- gfedcba
    with digit_data select
        segment_data <=
            "1000000" when "0000", -- 0
            "1111001" when "0001", -- 1
            "0100100" when "0010", -- 2
            "0110000" when "0011", -- 3
            "0011001" when "0100", -- 4
            "0010010" when "0101", -- 5
            "0000010" when "0110", -- 6
            "1111000" when "0111", -- 7
            "0000000" when "1000", -- 8
            "0010000" when "1001", -- 9
            "0001000" when "1010", -- A
            "1101010" when "1011", -- M
            "0001100" when "1100", -- P
            "1111111" when others;

    -- output
    SEG <= '1' & segment_data;
    AN <= an_tmp;

end Behavioral;