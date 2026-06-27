library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbench is

end testbench;

architecture tb of testbench is
component full_adder1 is
  Port( A,B,C_in : in STD_LOGIC;
       Sum,C_out : out STD_LOGIC);
end component;
signal a,b,ci,s,co : STD_LOGIC;
constant period : time := 10ns;

begin
 uut: full_adder1 port
  map( A => a,
       B => b,
       C_in => ci, 
       C_out => co, 
       Sum => s); 
 a <= '1' after period * 0, '0' after period * 1, 
      '1' after period * 2, '0' after period * 3, 
      '1' after period * 4, '0' after period * 5, 
      '1' after period * 6, '0' after period * 7;
 b <= '0' after period * 0, '0' after period * 1, 
      '1' after period * 2, '1' after period * 3, 
      '0' after period * 4, '0' after period * 5, 
      '1' after period * 6, '1' after period * 7;
 ci <= '0' after period * 0, '1' after period * 1, 
       '0' after period * 2, '0' after period * 3, 
       '0' after period * 4, '1' after period * 5, 
       '0' after period * 6, '0' after period * 7;       
end tb;
