library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;    -- Legacy arithmetic package
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Unsigned operations

-- Entity Declaration
entity pipeline_multiplier is
    generic(WIDTH : integer := 5);  -- Default 5-bit operand width
    port(
        clk   : in  std_logic;                      -- System clock
        reset : in  std_logic;                      -- Active-high reset
        a     : in  std_logic_vector(WIDTH-1 downto 0); -- Multiplicand
        b     : in  std_logic_vector(WIDTH-1 downto 0); -- Multiplier
        y     : out std_logic_vector(9 downto 0)     -- 10-bit product output
    );
end entity;

architecture Behavioral of pipeline_multiplier is
    -- Pipeline registers for propagating multiplicand
    signal a2_reg, a3_reg, a4_reg      : std_logic_vector(WIDTH-1 downto 0);
    signal a1, a2_next, a3_next, a4_next: std_logic_vector(WIDTH-1 downto 0);
    
    -- Shifted multiplier bits for partial product generation
    signal b1          : std_logic_vector(4 downto 1);  -- Stage1 multiplier slice
    signal b2_next, b2_reg: std_logic_vector(4 downto 2); -- Stage2 multiplier slice
    signal b3_next, b3_reg: std_logic_vector(4 downto 3); -- Stage3 multiplier slice
    signal b4_next, b4_reg: std_logic_vector(4 downto 4); -- Stage4 multiplier slice
    
    -- Bit-vector replication and partial products
    signal bv0, bv1, bv2, bv3, bv4: std_logic_vector(4 downto 0); -- Bit replication buses
    signal bp0, bp1, bp2, bp3, bp4: std_logic_vector(5 downto 0); -- Partial products
    
    -- Pipelined accumulated results
    signal pp0              : std_logic_vector(5 downto 0);  -- Stage0 partial product
    signal pp1_next, pp1_reg: std_logic_vector(6 downto 0); -- Stage1 accumulation
    signal pp2_next, pp2_reg: std_logic_vector(7 downto 0); -- Stage2 accumulation
    signal pp3_next, pp3_reg: std_logic_vector(8 downto 0); -- Stage3 accumulation
    signal pp4_next, pp4_reg: std_logic_vector(9 downto 0); -- Stage4 final result

begin
    -- Pipeline Stage 0-1: Initial Partial Product Generation
    -- Generate LSB partial product (b[0] * a)
    bv0 <= (others => b(0));          -- Replicate b[0] for AND operation
    bp0 <= "0" & (bv0 and a);         -- Zero-extended AND result
    pp0 <= bp0;                       -- Direct partial product assignment
    a1  <= a;                         -- First stage multiplicand
    b1  <= b(4 downto 1);             -- Shifted multiplier bits

    -- Pipeline Stage 1-2: First Accumulation Stage
    -- Generate b[1] partial product and accumulate
    bv1 <= (others => b1(1));         -- Replicate b[1] bit
    bp1 <= "0" & (bv1 and a1);        -- Shifted partial product
    pp1_next(6 downto 1) <= ("0" & pp0(5 downto 1)) + bp1; -- Accumulate with shift
    pp1_next(0)          <= pp0(0);   -- Carry LSB through pipeline
    a2_next              <= a1;       -- Propagate multiplicand
    b2_next              <= b1(4 downto 2); -- Shift multiplier slice

    -- Pipeline Stage 2-3: Second Accumulation Stage
    bv2 <= (others => b2_reg(2));     -- Replicate current multiplier bit
    bp2 <= "0" & (bv2 and a2_reg);    -- Generate shifted partial product
    pp2_next(7 downto 2) <= ("0" & pp1_reg(6 downto 2)) + bp2; -- Accumulate
    pp2_next(1 downto 0) <= pp1_reg(1 downto 0); -- Preserve lower bits
    a3_next              <= a2_reg;   -- Continue multiplicand propagation
    b3_next              <= b2_reg(4 downto 3); -- Shift multiplier slice

    -- Pipeline Stage 3-4: Third Accumulation Stage
    bv3 <= (others => b3_reg(3));     -- Current multiplier bit replication
    bp3 <= "0" & (bv3 and a3_reg);    -- Shifted partial product
    pp3_next(8 downto 3) <= ("0" & pp2_reg(7 downto 3)) + bp3; -- Accumulate
    pp3_next(2 downto 0) <= pp2_reg(2 downto 0); -- Preserve lower bits
    a4_next              <= a3_reg;   -- Final multiplicand propagation
    b4_next              <= b3_reg(4 downto 4); -- Final multiplier bit

    -- Pipeline Stage 4-5: Final Accumulation Stage
    bv4 <= (others => b4_reg(4));     -- MSB replication
    bp4 <= "0" & (bv4 and a4_reg);    -- MSB partial product
    pp4_next(9 downto 4) <= ("0" & pp3_reg(8 downto 4)) + bp4; -- Final sum
    pp4_next(3 downto 0) <= pp3_reg(3 downto 0); -- Preserve LSBs

    -- Pipeline Register Update Process
    pipe_reg: process(clk, reset)
    begin
        if reset = '1' then
            -- Asynchronous reset clears all pipeline registers
            pp1_reg <= (others => '0');
            pp2_reg <= (others => '0');
            pp3_reg <= (others => '0');
            pp4_reg <= (others => '0');
            a2_reg  <= (others => '0');
            a3_reg  <= (others => '0');
            a4_reg  <= (others => '0');
            b2_reg  <= (others => '0');
            b3_reg  <= (others => '0');
            b4_reg  <= (others => '0');
        elsif rising_edge(clk) then
            -- Clock-driven pipeline propagation
            pp1_reg <= pp1_next;
            pp2_reg <= pp2_next;
            pp3_reg <= pp3_next;
            pp4_reg <= pp4_next;
            a2_reg  <= a2_next;
            a3_reg  <= a3_next;
            a4_reg  <= a4_next;
            b2_reg  <= b2_next;
            b3_reg  <= b3_next;
            b4_reg  <= b4_next;
        end if;
    end process;

    -- Connect final pipeline stage to output
    y <= pp4_reg;

end architecture Behavioral;