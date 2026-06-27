-- TestBench Template 

  library ieee;
  use ieee.std_logic_1164.ALL;
  use ieee.numeric_std.ALL;

  entity cpu_tb is
  end cpu_tb;

  architecture testbench of cpu_tb is
			 
			 -- Clock and reset signals
          signal clk_in : std_logic := '0';
			 signal reset : std_logic := '1';
			 
			 -- Constants
			 constant clk_period : time := 10ns;
			 	 
  begin
			 -- Clock generation process
			 clk_gen: process
			 begin
					clk_in <= '1';
					wait for clk_period / 2;
					clk_in <= '0';
					wait for clk_period / 2;
			 end process;
				
			 -- Component Instantiation
          cpu_inst: entity work.cpu port map(
                  clk_in => clk_in,
						reset => reset
          );	 

  -- Stimulus process
     stim_proc : process
     begin
			-- Initialize signals
			reset <= '1';
			wait for clk_period;
			reset <= '0';

			wait for 100 ns; -- Total runtime
       
			wait; 
     end process;
  --  End Test Bench 

  END;
