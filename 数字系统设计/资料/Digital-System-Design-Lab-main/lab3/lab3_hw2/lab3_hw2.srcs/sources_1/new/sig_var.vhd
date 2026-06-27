----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/03 17:35:45
-- Design Name: 
-- Module Name: sig_var - Behavioral
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

entity sig_var is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           res1 : out STD_LOGIC;
           res2 : out STD_LOGIC);
end sig_var;

architecture Behavioral of sig_var is

signal sig_s1, sig_s2 : std_logic;

begin

    proc1: process (x, y, z) is
    variable var_s1, var_s2 : std_logic;
    begin
        var_s1 := x and y;
        var_s2 := var_s1 xor z;
        res1 <= var_s1 nand var_s2;
    end process proc1;
    
    proc2: process (x, y, z) is
    begin
        sig_s1 <= x and y;
        sig_s2 <= sig_s1 xor z;
        res2 <= sig_s1 nand sig_s2;
    end process proc2;

end Behavioral;
