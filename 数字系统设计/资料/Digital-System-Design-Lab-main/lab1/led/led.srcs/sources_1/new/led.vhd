----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/17 17:31:22
-- Design Name: 
-- Module Name: led - Behavioral
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

entity led is
    Port ( input0 : in STD_LOGIC;
           output0 : out STD_LOGIC;
           input1 : in STD_LOGIC;
           output1 : out STD_LOGIC;
           input2 : in STD_LOGIC;
           output2 : out STD_LOGIC;
           input3 : in STD_LOGIC;
           output3 : out STD_LOGIC);
end led;

architecture Behavioral of led is

begin
    output0 <= input0;
    output1 <= input1;
    output2 <= input2;
    output3 <= input3;

end Behavioral;
