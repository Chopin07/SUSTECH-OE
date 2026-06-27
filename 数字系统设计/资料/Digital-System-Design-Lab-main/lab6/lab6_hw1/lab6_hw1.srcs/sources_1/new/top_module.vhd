----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/04/21 17:05:15
-- Design Name: 
-- Module Name: top_module - Behavioral
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

entity top_module is
    Port (
        CLK : in  std_logic;
        SW0 : in  std_logic;
        SW15 : in  std_logic;
        BTNU : in  std_logic;
        BTND : in  std_logic;
        AN : out  std_logic_vector (7 downto 0);
        SEG : out  std_logic_vector (7 downto 0);
        PMOD : out  std_logic_vector (3 downto 0)
    );
end top_module;

architecture Behavioral of top_module is

    component segment_display is
        Port (
            clk : in  std_logic;
            number : in  std_logic_vector (31 downto 0);
            SEG : out  std_logic_vector (7 downto 0);
            AN : out  std_logic_vector (7 downto 0)
        );
    end component segment_display;

    component button_debounce is
        Port (
            clk : in std_logic;
            btn_in : in std_logic;
            btn_out : out std_logic
        );
    end component button_debounce;

    component control is
        Port (
            clk : in std_logic;
            btnu : in std_logic;
            btnd : in std_logic;
            number : out std_logic_vector (3 downto 0)
        );
    end component control;

    component driver is
        Port (
            clk : in std_logic;
            en : in std_logic;
            dir : in std_logic;
            vel : in std_logic_vector (3 downto 0);
            PMOD : out std_logic_vector (3 downto 0)
        );
    end component driver;

    signal btnu_debounced : std_logic;
    signal btnd_debounced : std_logic;
    signal number : std_logic_vector (3 downto 0);
    signal full_number : std_logic_vector (31 downto 0);

begin

    full_number <= "1111111111111111111111111111" & number;
    
    btnu_debounce : button_debounce
        port map (
            clk => CLK,
            btn_in => BTNU,
            btn_out => btnu_debounced
        );

    btnd_debounce : button_debounce
        port map (
            clk => CLK,
            btn_in => BTND,
            btn_out => btnd_debounced
        );
    
    ctrl_inst : control
        port map (
            clk => CLK,
            btnu => btnu_debounced,
            btnd => btnd_debounced,
            number => number
        );
    
    seg_inst : segment_display
        port map (
            clk => CLK,
            number => full_number,
            SEG => SEG,
            AN => AN
        );

    driver_inst : driver
        port map (
            clk => CLK,
            en => SW0,
            dir => SW15,
            vel => number,
            PMOD => PMOD
        );

end Behavioral;
