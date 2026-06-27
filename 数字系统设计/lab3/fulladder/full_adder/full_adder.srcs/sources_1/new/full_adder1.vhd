library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder1 is
Port ( A,B,C_in : in STD_LOGIC;
       Sum,C_out : out STD_LOGIC);
end full_adder1;

architecture dataflow of full_adder1 is
--内部信号
signal s1, s2, s3: STD_LOGIC;
constant gate_delay : time := 10ns;
begin
  --求和
  L1:s1 <= (A xor B) after gate_delay;
  --进位
  L2:s2 <= (C_in and s1) after gate_delay;
  --进位
  L3:s3 <= (A and B) after gate_delay;
  --本位
  L4:Sum <= (s1 xor C_in) after gate_delay;
  --进位相加
  L5:C_out <= (s2 or s3) after gate_delay;
end dataflow;
