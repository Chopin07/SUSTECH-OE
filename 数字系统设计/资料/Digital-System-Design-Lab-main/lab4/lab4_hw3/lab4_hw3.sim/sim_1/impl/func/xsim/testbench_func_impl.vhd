-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Mar 31 17:06:29 2025
-- Host        : DESKTOP-TFS429 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               G:/Digital-System-Design-Lab/lab4/lab4_hw3/lab4_hw3.sim/sim_1/impl/func/xsim/testbench_func_impl.vhd
-- Design      : sequence_generator
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sequence_generator is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    input : in STD_LOGIC;
    dataout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of sequence_generator : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of sequence_generator : entity is "a61c6b64";
end sequence_generator;

architecture STRUCTURE of sequence_generator is
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal dataout_OBUF : STD_LOGIC;
  signal dataout_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal reset_IBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \current_state[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \current_state[1]_i_1\ : label is "soft_lutpair0";
begin
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\current_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => dataout_OBUF_inst_i_2_n_0,
      I1 => p_0_in(1),
      I2 => p_0_in(2),
      O => next_state(0)
    );
\current_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => dataout_OBUF_inst_i_2_n_0,
      O => next_state(1)
    );
\current_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => next_state(0),
      Q => p_0_in(1)
    );
\current_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => next_state(1),
      Q => p_0_in(2)
    );
dataout_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => dataout_OBUF,
      O => dataout
    );
dataout_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => p_0_in(2),
      I1 => dataout_OBUF_inst_i_2_n_0,
      I2 => p_0_in(1),
      O => dataout_OBUF
    );
dataout_OBUF_inst_i_2: unisim.vcomponents.IBUF
     port map (
      I => input,
      O => dataout_OBUF_inst_i_2_n_0
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
end STRUCTURE;
