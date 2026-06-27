library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration
entity repetitve_addtion is
    port (
        CLK    : in  std_logic;                     -- System clock
        RESET  : in  std_logic;                     -- Active-high reset
        start  : in  std_logic;                     -- Start computation signal
        a_in   : in  std_logic_vector(4 downto 0);  -- Multiplicand input
        b_in   : in  std_logic_vector(4 downto 0);  -- Multiplier input
        r      : out std_logic_vector(9 downto 0); -- 16-bit result output
        ready  : out std_logic                      -- Computation complete flag
    );
end entity repetitve_addtion;

architecture Behavioral of repetitve_addtion is
    constant WIDTH : integer := 5;                 -- Data width configuration
    type state_type is (idle,  ab0, load, op);    -- FSM states:
        -- idle: Initial/waiting state
        -- ab0:  Handle zero input case
        -- load: Initialize registers
        -- op:   Multiplication operation state
    
    -- State and data registers
    signal state_reg, state_next : state_type;
    signal a_reg, a_next         : std_logic_vector(WIDTH-1 downto 0); -- Multiplicand storage
    signal n_reg, n_next         : std_logic_vector(WIDTH-1 downto 0); -- Counter storage
    signal r_reg, r_next         : std_logic_vector(2*WIDTH-1 downto 0); -- Result accumulation

begin
    -- Synchronous State and Data Registers Update Process
    process (CLK, RESET) is
    begin
        if RESET = '1' then          -- Asynchronous reset
            state_reg <= idle;       -- Return to initial state
            a_reg     <= (others => '0');  -- Clear multiplicand register
            n_reg     <= (others => '0');  -- Clear counter register
            r_reg     <= (others => '0'); -- Clear result register
        elsif CLK'event and CLK = '1' then  -- Clock edge triggered update
            state_reg <= state_next;  -- Update state register
            a_reg     <= a_next;      -- Update multiplicand register
            n_reg     <= n_next;      -- Update counter register
            r_reg     <= r_next;      -- Update result register
        end if;
    end process;

    -- Combinational Next-State and Data Path Logic
    process (start, state_reg, a_reg, n_reg, r_reg, a_in, b_in) is
    begin
        -- Default register values (prevent latches)
        a_next  <= a_reg;
        n_next  <= n_reg;
        r_next  <= r_reg;
        ready   <= '0';  -- Default ready signal state
        
        case state_reg is
            when idle =>
                ready <= '1';  -- System ready for new operation
                if start = '1' then
                    -- Handle zero input special case
                    if (a_in = x"00" or b_in = x"00") then
                        state_next <= ab0;
                    else
                        state_next <= load;  -- Proceed to normal operation
                    end if;
                else
                    state_next <= idle;  -- Maintain idle state
                end if;

            when ab0 =>
                -- Immediate result for zero input case
                a_next   <= a_in;        -- Store multiplicand
                n_next   <= b_in;        -- Store multiplier
                r_next   <= (others => '0');  -- Clear result
                state_next <= idle;       -- Return to idle

            when load =>
                -- Initialize registers for multiplication
                a_next   <= a_in;         -- Load multiplicand
                n_next   <= b_in;         -- Initialize counter
                r_next   <= (others => '0');  -- Reset accumulator
                state_next <= op;         -- Proceed to operation

            when op =>
                -- Core multiplication iteration
                n_next   <= n_reg - 1;          -- Decrement counter
                r_next   <= ("0000" & a_reg) + r_reg;  -- Accumulate sum
                
                -- Check completion condition
                if (n_reg = x"01") then  -- Last iteration
                    state_next <= idle;  -- Return to idle
                else
                    state_next <= op;    -- Continue iterations
                end if;
        end case;
    end process;

    -- Connect internal register to output port
    r <= r_reg;

end architecture Behavioral;