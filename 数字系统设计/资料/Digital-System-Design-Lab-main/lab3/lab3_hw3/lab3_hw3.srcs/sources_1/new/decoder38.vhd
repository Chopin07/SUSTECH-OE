----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/10 16:25:44
-- Design Name: 
-- Module Name: decoder38 - dataflow
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

entity decoder38 is
    Port ( EN : in STD_LOGIC;
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC;
           Y3 : out STD_LOGIC;
           Y4 : out STD_LOGIC;
           Y5 : out STD_LOGIC;
           Y6 : out STD_LOGIC;
           Y7 : out STD_LOGIC);
end decoder38;

architecture dataflow of decoder38 is

constant gate_delay : time := 10 ns;

begin
    Y0 <= ( not EN ) and ( A0 or A1 or A2 );
    Y1 <= ( not EN ) and ( ( not A0 ) or A1 or A2 );
    Y2 <= ( not EN ) and ( A0 or ( not A1 ) or A2 );
    Y3 <= ( not EN ) and ( ( not A0 ) or ( not A1 ) or A2 );
    Y4 <=  ( not EN ) and ( A0 or A1 or ( not A2 ) );
    Y5 <= ( not EN ) and ( ( not A0 ) or A1 or ( not A2 ) );
    Y6 <= ( not EN ) and ( A0 or ( not A1 ) or ( not A2 ) );
    Y7 <= ( not EN ) and ( ( not A0 ) or ( not A1 ) or ( not A2 ) );

end dataflow;
