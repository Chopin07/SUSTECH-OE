----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/03/24 17:54:16
-- Design Name: 
-- Module Name: testbench - Behavioral
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
end testbench;

architecture tb of testbench is
component sequence_generator is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input : in STD_LOGIC;
        dataout : out STD_LOGIC
    );
end component;

signal clk : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';
signal input : STD_LOGIC;
signal dataout : STD_LOGIC;
constant period : time := 10 ns;

begin
    uut: sequence_generator port map (
        clk => clk,
        reset => reset,
        input => input,
        dataout => dataout
    );

    clk <= not clk after period / 2;
    
    tb: process is
    begin
        for i in 1 to 10 loop
            reset <= '1';
            wait for period;
            reset <= '0';
            wait for period;
            
            for j in 1 to 2 loop
                input <= '0';
                wait for period;
                input <= '1';
                wait for period;
                input <= '1';
                wait for period;
                input <= '1';
                wait for period;
                input <= '0';
                wait for period;
                input <= '1';
                wait for period;
                input <= '1';
                wait for period;
            end loop;
        end loop;
        wait;
    end process;

end tb;
