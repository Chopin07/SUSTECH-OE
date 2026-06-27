----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/24 17:09:56
-- Design Name: 
-- Module Name: mux2_1_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2_1_tb is
--  Port ( );
end mux2_1_tb;

architecture Behavioral of mux2_1_tb is
    component mux2_1 is
    Port ( din0 : in std_logic;
           din1 : in std_logic;
           sel : in std_logic;
           dout : out std_logic );
    end component;
    
    signal d0, d1, s, do : std_logic := '0';
    constant per : time := 10ns;
    

begin
    dut : mux2_1 port map(
        din0=>d0, 
        din1=>d1, 
        sel=>s, 
        dout=>do
        );
    
    s <= not s after per*4;
    d0 <= not d0 after per*2;
    d1 <= not d1 after per;
    

end Behavioral;
