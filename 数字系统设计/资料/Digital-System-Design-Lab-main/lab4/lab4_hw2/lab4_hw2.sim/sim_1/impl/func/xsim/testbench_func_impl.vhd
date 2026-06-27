-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Mar 24 17:48:47 2025
-- Host        : DESKTOP-TFS429 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               G:/Digital-System-Design-Lab/lab4/lab4_hw2/lab4_hw2.sim/sim_1/impl/func/xsim/testbench_func_impl.vhd
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
    dataout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of sequence_generator : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of sequence_generator : entity is "cc1f7380";
end sequence_generator;

architecture STRUCTURE of sequence_generator is
  signal \FSM_onehot_current_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[6]\ : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal dataout_OBUF : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[0]\ : label is "iSTATE:0000001,iSTATE0:0000010,iSTATE1:0000100,iSTATE2:0001000,iSTATE3:0010000,iSTATE4:0100000,iSTATE5:1000000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[1]\ : label is "iSTATE:0000001,iSTATE0:0000010,iSTATE1:0000100,iSTATE2:0001000,iSTATE3:0010000,iSTATE4:0100000,iSTATE5:1000000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[2]\ : label is "iSTATE:0000001,iSTATE0:0000010,iSTATE1:0000100,iSTATE2:0001000,iSTATE3:0010000,iSTATE4:0100000,iSTATE5:1000000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[3]\ : label is "iSTATE:0000001,iSTATE0:0000010,iSTATE1:0000100,iSTATE2:0001000,iSTATE3:0010000,iSTATE4:0100000,iSTATE5:1000000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[4]\ : label is "iSTATE:0000001,iSTATE0:0000010,iSTATE1:0000100,iSTATE2:0001000,iSTATE3:0010000,iSTATE4:0100000,iSTATE5:1000000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[5]\ : label is "iSTATE:0000001,iSTATE0:0000010,iSTATE1:0000100,iSTATE2:0001000,iSTATE3:0010000,iSTATE4:0100000,iSTATE5:1000000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[6]\ : label is "iSTATE:0000001,iSTATE0:0000010,iSTATE1:0000100,iSTATE2:0001000,iSTATE3:0010000,iSTATE4:0100000,iSTATE5:1000000,";
begin
\FSM_onehot_current_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \FSM_onehot_current_state_reg_n_0_[6]\,
      PRE => reset_IBUF,
      Q => \FSM_onehot_current_state_reg_n_0_[0]\
    );
\FSM_onehot_current_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_onehot_current_state_reg_n_0_[0]\,
      Q => \FSM_onehot_current_state_reg_n_0_[1]\
    );
\FSM_onehot_current_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_onehot_current_state_reg_n_0_[1]\,
      Q => \FSM_onehot_current_state_reg_n_0_[2]\
    );
\FSM_onehot_current_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_onehot_current_state_reg_n_0_[2]\,
      Q => \FSM_onehot_current_state_reg_n_0_[3]\
    );
\FSM_onehot_current_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_onehot_current_state_reg_n_0_[3]\,
      Q => \FSM_onehot_current_state_reg_n_0_[4]\
    );
\FSM_onehot_current_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_onehot_current_state_reg_n_0_[4]\,
      Q => \FSM_onehot_current_state_reg_n_0_[5]\
    );
\FSM_onehot_current_state_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_onehot_current_state_reg_n_0_[5]\,
      Q => \FSM_onehot_current_state_reg_n_0_[6]\
    );
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
dataout_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => dataout_OBUF,
      O => dataout
    );
dataout_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[5]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[3]\,
      O => dataout_OBUF
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
end STRUCTURE;
