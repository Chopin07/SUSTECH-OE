----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/04/07 17:24:24
-- Design Name: 
-- Module Name: topmodule - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity topmodule is
    Port ( 
        CLK : in std_logic;
        BTNC : in std_logic;
        BTNU : in std_logic;
        AN : out std_logic_vector (7 downto 0);
        SEG : out std_logic_vector (7 downto 0)
    );
end topmodule;

architecture Behavioral of topmodule is

    component segment_display is
        Port (
            clk : in  std_logic;
            number : in  std_logic_vector (31 downto 0);
            SEG : out  std_logic_vector (7 downto 0);
            AN : out  std_logic_vector (7 downto 0)
        );
    end component segment_display;

    component timer is
        Port ( 
            clk : in std_logic;
            btnc : in std_logic;
            btnu : in std_logic;
            number : out std_logic_vector (31 downto 0)
        );
    end component timer;

    component ButtonDebounce is
        Port (
            clk : in std_logic;
            btn_in : in std_logic;
            btn_out : out std_logic
        );
    end component ButtonDebounce;

    signal number : std_logic_vector (31 downto 0);
    signal btnc_db : std_logic;
    signal btnu_db : std_logic;

begin

    btnc_instance : ButtonDebounce port map ( clk => CLK, btn_in => BTNC, btn_out => btnc_db );
    btnu_instance : ButtonDebounce port map ( clk => CLK, btn_in => BTNU, btn_out => btnu_db );
    timer_instance : timer port map ( clk => CLK, btnc => btnc_db, btnu => btnu_db, number => number );
    segment_display_instance : segment_display port map ( clk => CLK, number => number, SEG => SEG, AN => AN );

end Behavioral;
