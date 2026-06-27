----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/03 17:43:25
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
component sig_var is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           res1 : out STD_LOGIC;
           res2 : out STD_LOGIC);
end component;

signal x, y, z, r1, r2 : std_logic ;
constant period: time := 10ns;

begin
    uut: sig_var port
        map( x => x,
                y => y,
                z => z,
                res1 => r1,
                res2 => r2);
    
    x <= '0' after period * 0, '1' after period * 4;
    y <= '0' after period * 0, '1' after period * 2, '0' after period * 4, '1' after period * 6;
    z <= '0' after period * 0, '1' after period * 1, '0' after period * 2, '1' after period * 3,
            '0' after period * 4, '1' after period * 5, '0' after period * 6, '1' after period * 7;

end tb;
