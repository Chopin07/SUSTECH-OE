----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/03 17:01:56
-- Design Name: 
-- Module Name: testbench - tb
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

entity testbench is
--  Port ( );
end testbench;

architecture tb of testbench is

component full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal a, b, ci, s, co : std_logic;
constant period : time := 10ns;

begin
    uut:  full_adder port
        map( A => a,
                 B => b,
                 Cin => ci,
                 Sum => s,
                 Cout => co);

    a <= '1' after period * 0, '0' after period * 1, '1' after period * 2, '0' after period * 3, 
            '1' after period * 4, '0' after period * 5, '1' after period * 6, '0' after period * 7;
    b <= '0' after period * 0, '0' after period * 1, '1' after period * 2, '1' after period * 3, 
            '0' after period * 4, '0' after period * 5, '1' after period * 6, '1' after period * 7;
    ci <= '0' after period * 0, '1' after period * 1, '0' after period * 2, '0' after period * 3, 
            '0' after period * 4, '1' after period * 5, '0' after period * 6, '0' after period * 7;

end tb;
