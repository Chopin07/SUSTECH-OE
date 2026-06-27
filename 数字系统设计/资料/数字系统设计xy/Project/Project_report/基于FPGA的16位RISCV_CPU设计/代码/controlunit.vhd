----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:25:05 10/31/2024 
-- Design Name: 
-- Module Name:    controlunit - Behavioral 
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

entity controlunit is
    Port ( clk_in : in  STD_LOGIC;
           reset_in : in  STD_LOGIC;
           alu_op_in : in  STD_LOGIC_VECTOR (4 downto 0);
           stage_out : out  STD_LOGIC_VECTOR (5 downto 0));
end controlunit;

architecture Behavioral of controlunit is
	signal stage: std_logic_vector(5 downto 0) := "000001";

begin
	process(clk_in)
	begin
		if rising_edge(clk_in) then
			if reset_in = '1' then
				stage <= "000001";
			else
				case stage is
					when "000001" => -- FETCH
						stage <= "000010";
					when "000010" => -- DECODE
						stage <= "000100";
					when "000100" => -- REG READ
						stage <= "001000";
					when "001000" => -- ALU
						if alu_op_in(3 downto 0) = "1100" or alu_op_in(3 downto 0) = "1101" then -- LOAD OR STORE
							stage <= "010000";
						else
							stage <= "100000";
						end if;
					when "010000" => -- MEMORY
						stage <= "100000";
					when "100000" => -- REG WRITE
						stage <= "000001";
					when others =>	
						stage <= "000001";
					end case;
				end if;
			end if;
		end process;
		
		stage_out <= stage;

end Behavioral;

