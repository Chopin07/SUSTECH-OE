library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity combinational_design is
    port (
        a, b : in std_logic_vector(4 downto 0); -- Input vectors a and b, both 5 bits wide
        y : out std_logic_vector(9 downto 0)   -- Output vector y, 10 bits wide to hold the product
    );
end combinational_design;

architecture Behavioral of combinational_design is

    constant WIDTH : integer := 5; -- Define the width of the input vectors
    signal au, bv0, bv1, bv2, bv3, bv4: std_logic_vector (WIDTH-1 downto 0); -- Intermediate signals
    signal pp0, pp1, pp2, pp3, pp4: std_logic_vector (WIDTH downto 0); -- Signals for partial products
    signal prod: std_logic_vector (2*WIDTH-1 downto 0); -- Signal to hold the final product

begin

    au <= a; -- Assign input a to signal au

    -- Create vectors bv0 to bv4 where each bit is replicated from the corresponding bit of b
    bv0 <= (others => b(0));
    bv1 <= (others => b(1));
    bv2 <= (others => b(2));
    bv3 <= (others => b(3));
    bv4 <= (others => b(4));

    -- Generate the first partial product pp0, Perform bitwise AND between bv0 and au, and prepend a '0'
    pp0 <= '0' & (bv0 and au);

    -- Generate the second partial product pp1, Shift pp0 right by one bit and add it to the result of bv1 AND au
    pp1 <= ('0' & pp0(WIDTH downto 1)) + ('0' & (bv1 and au));

    -- Generate the third partial product pp2, Shift pp1 right by one bit and add it to the result of bv2 AND au
    pp2 <= ('0' & pp1(WIDTH downto 1)) + ('0' & (bv2 and au));

    -- Generate the fourth partial product pp3, Shift pp2 right by one bit and add it to the result of bv3 AND au
    pp3 <= ('0' & pp2(WIDTH downto 1)) + ('0' & (bv3 and au));

    -- Generate the fifth partial product pp4, Shift pp3 right by one bit and add it to the result of bv4 AND au
    pp4 <= ('0' & pp3(WIDTH downto 1)) + ('0' & (bv4 and au));

    -- Concatenate the least significant bits of all partial products to form the final product
    prod <= pp4 & pp3(0) & pp2(0) & pp1(0) & pp0(0);

    -- Assign the final product to the output y
    y <= prod;

end Behavioral;
