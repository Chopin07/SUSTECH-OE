----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/24 17:12:18
-- Design Name: 
-- Module Name: sequnetial_signal - Behavioral
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
        dataout : out STD_LOGIC
    );
end sequence_generator;

architecture Behavioral of sequence_generator is
    signal current_state : std_logic_vector  (2 downto 0) := (others => '0');
    signal next_state :  std_logic_vector  (2 downto 0) := (others => '0');
begin
    -- accident
process (clk, reset) is
begin
    if reset = '1' then
        current_state <= "000";
    elsif clk'event and clk = '1' then
        current_state <= next_state;
    end if;
end process;

-- state transfer
process (current_state) is
begin
    case current_state is
        when "000" =>
            dataout <= '1';
            next_state <= "001";
        when "001" =>
            dataout <= '1';
            next_state <= "010";
        when "010" =>
            dataout <= '0';
            next_state <= "011";
        when "011" =>
            dataout <= '1';
            next_state <= "100";
        when "100" =>
            dataout <= '1';
            next_state <= "101";
        when "101" =>
            dataout <= '1';
            next_state <= "110";
        when "110" =>
            dataout <= '0';
            next_state <= "000";
        when others =>
            dataout <= '0';
            next_state <= "000";
    end case;
end process;
end Behavioral;
