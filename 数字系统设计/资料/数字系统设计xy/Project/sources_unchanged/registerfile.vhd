----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:22:13 10/31/2024 
-- Design Name: 
-- Module Name:    registerfile - Behavioral 
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

entity registerfile is
    Port ( clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC;
           write_enable_in : in  STD_LOGIC;
           rA_data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           rB_data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           rD_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           sel_rA_in : in  STD_LOGIC_VECTOR (2 downto 0);
           sel_rB_in : in  STD_LOGIC_VECTOR (2 downto 0);
           sel_rD_in : in  STD_LOGIC_VECTOR (2 downto 0));
end registerfile;

architecture Behavioral of registerfile is
	type reg_array is array(0 to 7) of STD_LOGIC_VECTOR (15 downto 0);
	signal reg_file: reg_array := (others => x"0000");
begin
	process(clk_in) 
	begin
		if rising_edge(clk_in)then 
			if enable_in = '1' then
				rA_data_out <= reg_file(to_integer(unsigned(sel_rA_in)));
				rB_data_out <= reg_file(to_integer(unsigned(sel_rB_in)));
			
				if write_enable_in = '1' then
					reg_file(to_integer(unsigned(sel_rD_in))) <= rD_data_in;
				end if;
			end if;
		end if;
	end process;
	
end Behavioral;

