----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:46:57 10/31/2024 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( clk_in : in  STD_LOGIC;
           enable_in : in  STD_LOGIC;
           alu_op_in : in  STD_LOGIC_VECTOR (4 downto 0);
           pc_in : in  STD_LOGIC_VECTOR (15 downto 0);
           rA_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           rB_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           imm_data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           result_out : out  STD_LOGIC_VECTOR (15 downto 0);
           branch_out : out  STD_LOGIC;
           rD_write_enable_in : in  STD_LOGIC;
           rD_write_enable_out : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
	signal s_result: STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
	signal s_shouldBranch: STD_LOGIC := '0';
	
	constant CMP_BIT_EQ:  integer := 15;
	constant CMP_BIT_AGB: integer := 14;
	constant CMP_BIT_ALB: integer := 13;
	constant CMP_BIT_AZ:  integer := 12;
	constant CMP_BIT_BZ:  integer := 11;
	
begin
	process(clk_in, enable_in)
	begin
		if rising_edge(clk_in) and enable_in = '1' then
			rD_write_enable_out <= rD_write_enable_in;
			
			case alu_op_in(3 downto 0) is
				when "0000" => -- ADD
					if alu_op_in(4) = '0' then
						s_result(16 downto 0) <= std_logic_vector(unsigned('0' & rA_data_in) + unsigned('0' & rB_data_in));
					else
						s_result(16 downto 0) <= std_logic_vector(signed(rA_data_in(15) & rA_data_in) + signed(rB_data_in(15) & rB_data_in));
					end if;
					s_shouldBranch <= '0';
				when "0001" => -- SUB
					if alu_op_in(4) = '0' then
						s_result(16 downto 0) <= std_logic_vector(unsigned('0' & rA_data_in) - unsigned('0' & rB_data_in));
					else
						s_result(16 downto 0) <= std_logic_vector(signed(rA_data_in(15) & rA_data_in) - signed(rB_data_in(15) & rB_data_in));
					end if;
					s_shouldBranch <= '0';
				when "0010" => -- NOT
					s_result <= not rA_data_in;
					s_shouldBranch <= '0';
				when "0011" => -- AND
					s_result <= rA_data_in and rB_data_in;
					s_shouldBranch <= '0';
				when "0100" => -- OR
					s_result <= rA_data_in or rB_data_in;
					s_shouldBranch <= '0';
				when "0101" =>	-- XOR
					s_result <= rA_data_in xor rB_data_in;
					s_shouldBranch <= '0';
				when "0110" => -- LSL
					result_out <= std_logic_vector(shift_left(unsigned(rA_data_in), to_integer(unsigned(rB_data_in(3 downto 0)))));
					s_shouldBranch <= '0';
				when "0111" => -- LSR
					result_out <= std_logic_vector(shift_right(unsigned(rA_data_in), to_integer(unsigned(rB_data_in(3 downto 0)))));
					s_shouldBranch <= '0';
				when "1000" => -- CMP
					if rA_data_in = rB_data_in then
						s_result(CMP_BIT_EQ) <= '1';  
					else 
						s_result(CMP_BIT_EQ) <= '0';
					end if;
					
					if rA_data_in = x"0000" then
						s_result(CMP_BIT_AZ) <= '1';
					else
						s_result(CMP_BIT_AZ) <= '0';
					end if;
					
					if rB_data_in = x"0000" then
						s_result(CMP_BIT_BZ) <= '1';
					else
						s_result(CMP_BIT_BZ) <= '0';
					end if;
					
					if alu_op_in(4) = '0' then
						if unsigned(rA_data_in) > unsigned(rB_data_in) then
							s_result(CMP_BIT_AGB) <= '1';
						else
							s_result(CMP_BIT_AGB) <= '0';
						end if;
						
						if unsigned(rA_data_in) < unsigned(rB_data_in) then
							s_result(CMP_BIT_ALB) <= '1';
						else
							s_result(CMP_BIT_ALB) <= '0';
						end if;
						
					else
						if signed(rA_data_in) > signed(rB_data_in) then
							s_result(CMP_BIT_AGB) <= '1';
						else
							s_result(CMP_BIT_AGB) <= '0';
						end if;
						
						if signed(rA_data_in) < signed(rB_data_in) then
							s_result(CMP_BIT_ALB) <= '1';
						else
							s_result(CMP_BIT_ALB) <= '0';
						end if;
					end if;
					
					s_result(10 downto 0) <= (others => '0');
					s_shouldBranch <= '0';
					
				when "1001" => -- B
					if alu_op_in(4) = '1' then
						s_result(15 downto 0) <= rA_data_in;
					else
						s_result <= x"00" & imm_data_in;
					end if;
					s_shouldBranch <= '1';
				when "1010" => -- BEQ
					if s_result(CMP_BIT_EQ) = '1' then
						s_result(15 downto 0) <= rA_data_in;
						s_shouldBranch <= '1';
					else
						s_shouldBranch <= '0';
					end if;
				when "1011" => -- IMMEDIATE
					if alu_op_in(4) = '1' then
						s_result <= imm_data_in & x"00";
					else
						s_result <= x"00" & imm_data_in;
					end if;
					s_shouldBranch <= '0';
				when "1100" => -- LOAD
					s_result(15 downto 0) <= rA_data_in;
					s_shouldBranch <= '0';
				when "1101" => -- STORE
					s_result(15 downto 0) <= rA_data_in;
					s_shouldBranch <= '0';
				when others =>
				s_result(15 downto 0) <= x"DEAD"; -- ERROR
			end case;
		end if;
	end process;
	
result_out <= s_result(15 downto 0);
branch_out <= s_shouldBranch;
			
end Behavioral;

