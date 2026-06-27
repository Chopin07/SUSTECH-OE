----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:02:03 10/31/2024 
-- Design Name: 
-- Module Name:    pcunit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity pcunit is
    Port ( clk_in : in  STD_LOGIC;
           pc_op_in : in  STD_LOGIC_VECTOR (1 downto 0);
           pc_in : in  STD_LOGIC_VECTOR (15 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (15 downto 0));
end pcunit;

architecture Behavioral of pcunit is
	signal pc: std_logic_vector (15 downto 0) := x"0000";
	
begin
	process (clk_in)
	begin
		if rising_edge(clk_in) then
			case pc_op_in is
				when "00" => -- RESET
					pc <= x"0000";
				when "01" => -- INCREMENT
					pc <= std_logic_vector(unsigned(pc) + 1);
				when "10" => -- BRANCH
					pc <= pc_in;
				when "11" => -- HOLD
					null;
				when others =>
					pc <= pc;
			end case;
		end if;
	end process;
	
	pc_out <= pc;
			
end Behavioral;

