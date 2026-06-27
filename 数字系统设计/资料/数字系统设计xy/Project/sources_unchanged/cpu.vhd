----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:50 10/31/2024 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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

entity cpu is
	Port ( 
			 clk_in : in STD_LOGIC;
			 reset : in STD_LOGIC
		   );
end cpu;

architecture Behavioral of cpu is
	-- COMPONENT DECLARATION --
	
	component registerfile
	Port ( clk_in : in  STD_LOGIC;
          enable_in : in  STD_LOGIC;
			 write_enable_in : in  STD_LOGIC;
			 rA_data_out : out  STD_LOGIC_VECTOR (15 downto 0);
			 rB_data_out : out  STD_LOGIC_VECTOR (15 downto 0);
			 rD_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
			 sel_rA_in : in  STD_LOGIC_VECTOR (2 downto 0);
			 sel_rB_in : in  STD_LOGIC_VECTOR (2 downto 0);
			 sel_rD_in : in  STD_LOGIC_VECTOR (2 downto 0)
			);
	end component;
	
	component decoder
	Port ( clk_in : in  STD_LOGIC;
          enable_in : in  STD_LOGIC;
          instruction_in : in  STD_LOGIC_VECTOR (15 downto 0);
          alu_op_out : out  STD_LOGIC_VECTOR (4 downto 0);
          imm_data_out : out  STD_LOGIC_VECTOR (7 downto 0);
          write_enable_out : out  STD_LOGIC;
          sel_rA_out : out  STD_LOGIC_VECTOR (2 downto 0);
          sel_rB_out : out  STD_LOGIC_VECTOR (2 downto 0);
          sel_rD_out : out  STD_LOGIC_VECTOR (2 downto 0)
			);
	end component;
	
	component alu
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
          rD_write_enable_out : out  STD_LOGIC
			);
	end component;
	
	component controlunit
	Port ( clk_in : in  STD_LOGIC;
          reset_in : in  STD_LOGIC;
          alu_op_in : in  STD_LOGIC_VECTOR (4 downto 0);
          stage_out : out  STD_LOGIC_VECTOR (5 downto 0)
			);
	end component;
	
	component pcunit
	Port ( clk_in : in  STD_LOGIC;
          pc_op_in : in  STD_LOGIC_VECTOR (1 downto 0);
          pc_in : in  STD_LOGIC_VECTOR (15 downto 0);
          pc_out : out  STD_LOGIC_VECTOR (15 downto 0)
			);
	end component;
	
	component ram
	Port ( clk_in : in  STD_LOGIC;
          reset : in  STD_LOGIC;
          write_enable_in : in  STD_LOGIC;
          address_in : in  STD_LOGIC_VECTOR (15 downto 0);
          data_in : in  STD_LOGIC_VECTOR (15 downto 0);
          data_out : out  STD_LOGIC_VECTOR (15 downto 0)
			);
	end component;
	
	-- SIGNAL DECLERATION --
	
	-- REGFILE --
	
	signal reg_enable : std_logic := '0';
	signal reg_write_enable : std_logic := '0';
	signal rA_data : std_logic_vector (15 downto 0) := (others => '0'); 
   signal rB_data : std_logic_vector (15 downto 0) := (others => '0'); 
   signal rD_data : std_logic_vector (15 downto 0) := (others => '0'); 
	signal rA_sel : std_logic_vector (2 downto 0) := (others => '0'); 
   signal rB_sel : std_logic_vector (2 downto 0) := (others => '0'); 
	signal rD_sel : std_logic_vector (2 downto 0) := (others => '0'); 

	-- ALU --
	
	signal result : std_logic_vector (15 downto 0) := (others => '0'); 
   signal branch : std_logic := '0'; 
   signal rD_write_enable : std_logic := '0'; 
   signal alu_write_enable_out : std_logic := '0'; 
	
	-- PCUNIT --
	
	signal pc_op : std_logic_vector (1 downto 0) := (others => '0'); 
   signal pc_in : std_logic_vector (15 downto 0) := (others => '0'); 
   signal pc_out : std_logic_vector (15 downto 0) := (others => '0'); 
	
	-- RAM -- 
	
	signal ram_write_enable : std_logic := '0'; 
   signal address : std_logic_vector (15 downto 0) := (others => '0'); 
   signal ram_data_in : std_logic_vector (15 downto 0) := (others => '0'); 
   signal ram_data_out : std_logic_vector (15 downto 0) := (others => '0'); 
	
	
	-- PIPELINE --
	
	signal fetch_enable : std_logic := '0'; 
   signal reg_read : std_logic := '0'; 
   signal decoder_enable : std_logic := '0'; 
   signal alu_enable : std_logic := '0';
   signal ram_enable : std_logic := '0'; 
   signal reg_write : std_logic := '0'; 
	
	-- OTHERS -- 
	
	signal instruction : std_logic_vector (15 downto 0) := (others => '0');
	signal alu_op : std_logic_vector (4 downto 0) := (others => '0'); -- DECODER + ALU + CONTROLUNIT 
	signal immediate : std_logic_vector (7 downto 0) := (others => '0'); -- DECODER + ALU 
	signal cpu_reset : std_logic := '0'; -- CONTROLUNIT + RAM 
	signal stage : std_logic_vector (5 downto 0) := (others => '0'); -- CONTROLUNIT 

	
begin
	
	cpu_registerfile : registerfile PORT MAP (
        clk_in => clk_in,
        enable_in => reg_enable,
        write_enable_in => reg_write_enable,
        rA_data_out => rA_data,
        rB_data_out => rB_data,
        rD_data_in => rD_data,
        sel_rA_in => rA_sel,
        sel_rB_in => rB_sel,
        sel_rD_in => rD_sel
    );
	
	cpu_decoder : decoder PORT MAP (
		  clk_in => clk_in,
		  enable_in => decoder_enable,
		  instruction_in => instruction,
		  alu_op_out => alu_op,
		  imm_data_out => immediate,
		  write_enable_out => rD_write_enable,
		  sel_rA_out => rA_sel,
		  sel_rB_out => rB_sel,
		  sel_rD_out => rD_sel
    );
	 
	 cpu_alu : alu PORT MAP (
        clk_in => clk_in,
        enable_in => alu_enable,
        alu_op_in => alu_op,
        pc_in => pc_out,
        rA_data_in => rA_data,
        rB_data_in => rB_data,
        imm_data_in => immediate,
        result_out => result,
        branch_out => branch,
        rD_write_enable_in => rD_write_enable,
        rD_write_enable_out => alu_write_enable_out
    );
	 
	 cpu_controlunit : controlunit PORT MAP (
        clk_in => clk_in,
        reset_in => reset,
        alu_op_in => alu_op,
        stage_out => stage
    );
	 
	 cpu_pcunit : pcunit PORT MAP (
        clk_in => clk_in,
        pc_op_in => pc_op,
        pc_in => pc_in,
        pc_out => pc_out
    );
	 
	 cpu_ram : ram PORT MAP (
        clk_in => clk_in,
        reset => reset,
        write_enable_in => ram_write_enable,
        address_in => address,
        data_in => ram_data_in,
        data_out => ram_data_out
    );
	 
	 
	 -- REGFILE --
	 
    reg_enable <= reg_read or reg_write;
    reg_write_enable <= alu_write_enable_out and reg_write;
	 
	 -- PIPELINE --
	 
    fetch_enable <= stage(0); -- FETCH 
    decoder_enable <= stage(1); -- DECODE 
    reg_read <= stage(2); -- REGISTER READ 
    alu_enable <= stage(3); -- EXECUTE 
    ram_enable <= stage(4); -- MEMORY 
    reg_write <= stage(5); -- REGISTER WRITE 
	 
	 -- PC --
	 
    pc_op <= "00" when cpu_reset = '1' else -- RESET
             "01" when branch = '0' and stage(5) = '1' else -- INCREMENT
             "10" when branch = '1' and stage(5) = '1' else -- BRANCH
             "11"; -- NOP

    pc_in <= result;
	 
	 -- MEMORY --
	 
    address <= result when ram_enable = '1' else pc_out; -- RAM ACCESS MEMORY/FETCH STAGE
    ram_data_in <= rB_data; -- rB = DATA, rA = ADDRESS, FOR ST OPERATION
    ram_write_enable <= '1' when ram_enable = '1' and alu_op(3 downto 0) = "1101" else '0'; -- RAM ENABLE + ST OPERATION
    
    rD_data <= ram_data_out when reg_write = '1' and alu_op(3 downto 0) = "1100" else result; -- REG DATA IS RAM WHEN LD OR ALU RESULT
	 
	 instruction <= ram_data_out when fetch_enable = '1'; -- DATA FROM RAM GOES TO DECODER

end Behavioral;

