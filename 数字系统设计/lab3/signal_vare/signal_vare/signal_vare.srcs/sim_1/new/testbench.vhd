

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture tb of testbench is
component signal_vare is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           res1 : out STD_LOGIC;
           res2 : out STD_LOGIC);
end component;
--初始化为0
signal x, y, z: std_logic := '0' ;
signal r1, r2 : std_logic;
constant period: time := 10ns;

begin
    uut: signal_vare port
        map( x => x,
                y => y,
                z => z,
                res1 => r1,
                res2 => r2);
     --周期80ns
     process 
     begin
        wait for 40 ns;
        x <= not x;
     end process;
     --周期40ns
     process 
     begin
        wait for 20 ns;
        y <= not y;
     end process;
     --周期20ns
     process 
     begin
        wait for 10 ns;
        z <= not z;
     end process;

end tb;
