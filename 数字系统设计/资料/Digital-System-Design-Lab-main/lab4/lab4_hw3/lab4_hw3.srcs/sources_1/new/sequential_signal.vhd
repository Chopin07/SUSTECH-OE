----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/24 17:53:20
-- Design Name: 
-- Module Name: sequential_signal - Behavioral
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

entity sequence_generator is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input : in STD_LOGIC;
        dataout : out STD_LOGIC
    );
end sequence_generator;

architecture Behavioral of sequence_generator is
    signal current_state : std_logic_vector(1 downto 0) := "00";
    signal next_state : std_logic_vector(1 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= "00";
        elsif CLK'event and CLK = '1' then
            current_state <= next_state;
        end if;
    end process;
    
    -- next state logic
    with current_state & input select
        next_state <= 
            "00" when "000",
            "01" when "001",
            "10" when "010",
            "01" when "011",
            "00" when "100",
            "11" when "101",
            "11" when "110",
            "11" when "111",
            "00" when others;

    with current_state & input select
        dataout <= 
            '0' when "000" | "001" | "010" | "011" | "100",
            '1' when "101" | "110" | "111",
            '0' when others;

end Behavioral;

