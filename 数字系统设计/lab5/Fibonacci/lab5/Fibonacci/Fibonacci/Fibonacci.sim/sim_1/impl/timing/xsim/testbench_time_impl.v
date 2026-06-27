// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Apr 15 20:43:37 2026
// Host        : Chopin running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/SUSTech/2026
//               Spring/lab5/Fibonacci/Fibonacci/Fibonacci.sim/sim_1/impl/timing/xsim/testbench_time_impl.v}
// Design      : fibonacci_fsm
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "1a110383" *) 
(* NotValidForBitStream *)
module fibonacci_fsm
   (clk,
    rst,
    start,
    n,
    fib_n,
    finish);
  input clk;
  input rst;
  input start;
  input [5:0]n;
  output [63:0]fib_n;
  output finish;

  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire \FSM_sequential_state[1]_i_5_n_0 ;
  wire \FSM_sequential_state[1]_i_6_n_0 ;
  wire \FSM_sequential_state_reg_n_0_[1] ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [5:1]counter;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[5]_i_3_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire [0:0]current;
  wire \current[0]_i_2_n_0 ;
  wire \current[10]_i_1_n_0 ;
  wire \current[11]_i_1_n_0 ;
  wire \current[11]_i_3_n_0 ;
  wire \current[11]_i_4_n_0 ;
  wire \current[11]_i_5_n_0 ;
  wire \current[11]_i_6_n_0 ;
  wire \current[12]_i_1_n_0 ;
  wire \current[13]_i_1_n_0 ;
  wire \current[14]_i_1_n_0 ;
  wire \current[15]_i_1_n_0 ;
  wire \current[15]_i_3_n_0 ;
  wire \current[15]_i_4_n_0 ;
  wire \current[15]_i_5_n_0 ;
  wire \current[15]_i_6_n_0 ;
  wire \current[16]_i_1_n_0 ;
  wire \current[17]_i_1_n_0 ;
  wire \current[18]_i_1_n_0 ;
  wire \current[19]_i_1_n_0 ;
  wire \current[19]_i_3_n_0 ;
  wire \current[19]_i_4_n_0 ;
  wire \current[19]_i_5_n_0 ;
  wire \current[19]_i_6_n_0 ;
  wire \current[1]_i_1_n_0 ;
  wire \current[20]_i_1_n_0 ;
  wire \current[21]_i_1_n_0 ;
  wire \current[22]_i_1_n_0 ;
  wire \current[23]_i_1_n_0 ;
  wire \current[23]_i_3_n_0 ;
  wire \current[23]_i_4_n_0 ;
  wire \current[23]_i_5_n_0 ;
  wire \current[23]_i_6_n_0 ;
  wire \current[24]_i_1_n_0 ;
  wire \current[25]_i_1_n_0 ;
  wire \current[26]_i_1_n_0 ;
  wire \current[27]_i_1_n_0 ;
  wire \current[27]_i_3_n_0 ;
  wire \current[27]_i_4_n_0 ;
  wire \current[27]_i_5_n_0 ;
  wire \current[27]_i_6_n_0 ;
  wire \current[28]_i_1_n_0 ;
  wire \current[29]_i_1_n_0 ;
  wire \current[2]_i_1_n_0 ;
  wire \current[30]_i_1_n_0 ;
  wire \current[31]_i_1_n_0 ;
  wire \current[31]_i_3_n_0 ;
  wire \current[31]_i_4_n_0 ;
  wire \current[31]_i_5_n_0 ;
  wire \current[31]_i_6_n_0 ;
  wire \current[32]_i_1_n_0 ;
  wire \current[33]_i_1_n_0 ;
  wire \current[34]_i_1_n_0 ;
  wire \current[35]_i_1_n_0 ;
  wire \current[35]_i_3_n_0 ;
  wire \current[35]_i_4_n_0 ;
  wire \current[35]_i_5_n_0 ;
  wire \current[35]_i_6_n_0 ;
  wire \current[36]_i_1_n_0 ;
  wire \current[37]_i_1_n_0 ;
  wire \current[38]_i_1_n_0 ;
  wire \current[39]_i_1_n_0 ;
  wire \current[39]_i_3_n_0 ;
  wire \current[39]_i_4_n_0 ;
  wire \current[39]_i_5_n_0 ;
  wire \current[39]_i_6_n_0 ;
  wire \current[3]_i_1_n_0 ;
  wire \current[3]_i_3_n_0 ;
  wire \current[3]_i_4_n_0 ;
  wire \current[3]_i_5_n_0 ;
  wire \current[3]_i_6_n_0 ;
  wire \current[40]_i_1_n_0 ;
  wire \current[41]_i_1_n_0 ;
  wire \current[42]_i_1_n_0 ;
  wire \current[43]_i_1_n_0 ;
  wire \current[43]_i_3_n_0 ;
  wire \current[43]_i_4_n_0 ;
  wire \current[43]_i_5_n_0 ;
  wire \current[43]_i_6_n_0 ;
  wire \current[44]_i_1_n_0 ;
  wire \current[45]_i_1_n_0 ;
  wire \current[46]_i_1_n_0 ;
  wire \current[47]_i_1_n_0 ;
  wire \current[47]_i_3_n_0 ;
  wire \current[47]_i_4_n_0 ;
  wire \current[47]_i_5_n_0 ;
  wire \current[47]_i_6_n_0 ;
  wire \current[48]_i_1_n_0 ;
  wire \current[49]_i_1_n_0 ;
  wire \current[4]_i_1_n_0 ;
  wire \current[50]_i_1_n_0 ;
  wire \current[51]_i_1_n_0 ;
  wire \current[51]_i_3_n_0 ;
  wire \current[51]_i_4_n_0 ;
  wire \current[51]_i_5_n_0 ;
  wire \current[51]_i_6_n_0 ;
  wire \current[52]_i_1_n_0 ;
  wire \current[53]_i_1_n_0 ;
  wire \current[54]_i_1_n_0 ;
  wire \current[55]_i_1_n_0 ;
  wire \current[55]_i_3_n_0 ;
  wire \current[55]_i_4_n_0 ;
  wire \current[55]_i_5_n_0 ;
  wire \current[55]_i_6_n_0 ;
  wire \current[56]_i_1_n_0 ;
  wire \current[57]_i_1_n_0 ;
  wire \current[58]_i_1_n_0 ;
  wire \current[59]_i_1_n_0 ;
  wire \current[59]_i_3_n_0 ;
  wire \current[59]_i_4_n_0 ;
  wire \current[59]_i_5_n_0 ;
  wire \current[59]_i_6_n_0 ;
  wire \current[5]_i_1_n_0 ;
  wire \current[60]_i_1_n_0 ;
  wire \current[61]_i_1_n_0 ;
  wire \current[62]_i_1_n_0 ;
  wire \current[63]_i_1_n_0 ;
  wire \current[63]_i_3_n_0 ;
  wire \current[63]_i_4_n_0 ;
  wire \current[63]_i_5_n_0 ;
  wire \current[63]_i_6_n_0 ;
  wire \current[6]_i_1_n_0 ;
  wire \current[7]_i_1_n_0 ;
  wire \current[7]_i_3_n_0 ;
  wire \current[7]_i_4_n_0 ;
  wire \current[7]_i_5_n_0 ;
  wire \current[7]_i_6_n_0 ;
  wire \current[8]_i_1_n_0 ;
  wire \current[9]_i_1_n_0 ;
  wire \current_reg[11]_i_2_n_0 ;
  wire \current_reg[15]_i_2_n_0 ;
  wire \current_reg[19]_i_2_n_0 ;
  wire \current_reg[23]_i_2_n_0 ;
  wire \current_reg[27]_i_2_n_0 ;
  wire \current_reg[31]_i_2_n_0 ;
  wire \current_reg[35]_i_2_n_0 ;
  wire \current_reg[39]_i_2_n_0 ;
  wire \current_reg[3]_i_2_n_0 ;
  wire \current_reg[43]_i_2_n_0 ;
  wire \current_reg[47]_i_2_n_0 ;
  wire \current_reg[51]_i_2_n_0 ;
  wire \current_reg[55]_i_2_n_0 ;
  wire \current_reg[59]_i_2_n_0 ;
  wire \current_reg[7]_i_2_n_0 ;
  wire \current_reg_n_0_[0] ;
  wire \current_reg_n_0_[10] ;
  wire \current_reg_n_0_[11] ;
  wire \current_reg_n_0_[12] ;
  wire \current_reg_n_0_[13] ;
  wire \current_reg_n_0_[14] ;
  wire \current_reg_n_0_[15] ;
  wire \current_reg_n_0_[16] ;
  wire \current_reg_n_0_[17] ;
  wire \current_reg_n_0_[18] ;
  wire \current_reg_n_0_[19] ;
  wire \current_reg_n_0_[1] ;
  wire \current_reg_n_0_[20] ;
  wire \current_reg_n_0_[21] ;
  wire \current_reg_n_0_[22] ;
  wire \current_reg_n_0_[23] ;
  wire \current_reg_n_0_[24] ;
  wire \current_reg_n_0_[25] ;
  wire \current_reg_n_0_[26] ;
  wire \current_reg_n_0_[27] ;
  wire \current_reg_n_0_[28] ;
  wire \current_reg_n_0_[29] ;
  wire \current_reg_n_0_[2] ;
  wire \current_reg_n_0_[30] ;
  wire \current_reg_n_0_[31] ;
  wire \current_reg_n_0_[32] ;
  wire \current_reg_n_0_[33] ;
  wire \current_reg_n_0_[34] ;
  wire \current_reg_n_0_[35] ;
  wire \current_reg_n_0_[36] ;
  wire \current_reg_n_0_[37] ;
  wire \current_reg_n_0_[38] ;
  wire \current_reg_n_0_[39] ;
  wire \current_reg_n_0_[3] ;
  wire \current_reg_n_0_[40] ;
  wire \current_reg_n_0_[41] ;
  wire \current_reg_n_0_[42] ;
  wire \current_reg_n_0_[43] ;
  wire \current_reg_n_0_[44] ;
  wire \current_reg_n_0_[45] ;
  wire \current_reg_n_0_[46] ;
  wire \current_reg_n_0_[47] ;
  wire \current_reg_n_0_[48] ;
  wire \current_reg_n_0_[49] ;
  wire \current_reg_n_0_[4] ;
  wire \current_reg_n_0_[50] ;
  wire \current_reg_n_0_[51] ;
  wire \current_reg_n_0_[52] ;
  wire \current_reg_n_0_[53] ;
  wire \current_reg_n_0_[54] ;
  wire \current_reg_n_0_[55] ;
  wire \current_reg_n_0_[56] ;
  wire \current_reg_n_0_[57] ;
  wire \current_reg_n_0_[58] ;
  wire \current_reg_n_0_[59] ;
  wire \current_reg_n_0_[5] ;
  wire \current_reg_n_0_[60] ;
  wire \current_reg_n_0_[61] ;
  wire \current_reg_n_0_[62] ;
  wire \current_reg_n_0_[63] ;
  wire \current_reg_n_0_[6] ;
  wire \current_reg_n_0_[7] ;
  wire \current_reg_n_0_[8] ;
  wire \current_reg_n_0_[9] ;
  wire [63:0]fib_n;
  wire \fib_n[63]_i_1_n_0 ;
  wire [63:0]fib_n_OBUF;
  wire finish;
  wire finish_OBUF;
  wire [63:0]in8;
  wire [5:0]n;
  wire [5:0]n_IBUF;
  wire \prev[0]_i_1_n_0 ;
  wire \prev[10]_i_1_n_0 ;
  wire \prev[11]_i_1_n_0 ;
  wire \prev[12]_i_1_n_0 ;
  wire \prev[13]_i_1_n_0 ;
  wire \prev[14]_i_1_n_0 ;
  wire \prev[15]_i_1_n_0 ;
  wire \prev[16]_i_1_n_0 ;
  wire \prev[17]_i_1_n_0 ;
  wire \prev[18]_i_1_n_0 ;
  wire \prev[19]_i_1_n_0 ;
  wire \prev[1]_i_1_n_0 ;
  wire \prev[20]_i_1_n_0 ;
  wire \prev[21]_i_1_n_0 ;
  wire \prev[22]_i_1_n_0 ;
  wire \prev[23]_i_1_n_0 ;
  wire \prev[24]_i_1_n_0 ;
  wire \prev[25]_i_1_n_0 ;
  wire \prev[26]_i_1_n_0 ;
  wire \prev[27]_i_1_n_0 ;
  wire \prev[28]_i_1_n_0 ;
  wire \prev[29]_i_1_n_0 ;
  wire \prev[2]_i_1_n_0 ;
  wire \prev[30]_i_1_n_0 ;
  wire \prev[31]_i_1_n_0 ;
  wire \prev[32]_i_1_n_0 ;
  wire \prev[33]_i_1_n_0 ;
  wire \prev[34]_i_1_n_0 ;
  wire \prev[35]_i_1_n_0 ;
  wire \prev[36]_i_1_n_0 ;
  wire \prev[37]_i_1_n_0 ;
  wire \prev[38]_i_1_n_0 ;
  wire \prev[39]_i_1_n_0 ;
  wire \prev[3]_i_1_n_0 ;
  wire \prev[40]_i_1_n_0 ;
  wire \prev[41]_i_1_n_0 ;
  wire \prev[42]_i_1_n_0 ;
  wire \prev[43]_i_1_n_0 ;
  wire \prev[44]_i_1_n_0 ;
  wire \prev[45]_i_1_n_0 ;
  wire \prev[46]_i_1_n_0 ;
  wire \prev[47]_i_1_n_0 ;
  wire \prev[48]_i_1_n_0 ;
  wire \prev[49]_i_1_n_0 ;
  wire \prev[4]_i_1_n_0 ;
  wire \prev[50]_i_1_n_0 ;
  wire \prev[51]_i_1_n_0 ;
  wire \prev[52]_i_1_n_0 ;
  wire \prev[53]_i_1_n_0 ;
  wire \prev[54]_i_1_n_0 ;
  wire \prev[55]_i_1_n_0 ;
  wire \prev[56]_i_1_n_0 ;
  wire \prev[57]_i_1_n_0 ;
  wire \prev[58]_i_1_n_0 ;
  wire \prev[59]_i_1_n_0 ;
  wire \prev[5]_i_1_n_0 ;
  wire \prev[60]_i_1_n_0 ;
  wire \prev[61]_i_1_n_0 ;
  wire \prev[62]_i_1_n_0 ;
  wire \prev[63]_i_1_n_0 ;
  wire \prev[6]_i_1_n_0 ;
  wire \prev[7]_i_1_n_0 ;
  wire \prev[8]_i_1_n_0 ;
  wire \prev[9]_i_1_n_0 ;
  wire \prev_reg_n_0_[0] ;
  wire \prev_reg_n_0_[10] ;
  wire \prev_reg_n_0_[11] ;
  wire \prev_reg_n_0_[12] ;
  wire \prev_reg_n_0_[13] ;
  wire \prev_reg_n_0_[14] ;
  wire \prev_reg_n_0_[15] ;
  wire \prev_reg_n_0_[16] ;
  wire \prev_reg_n_0_[17] ;
  wire \prev_reg_n_0_[18] ;
  wire \prev_reg_n_0_[19] ;
  wire \prev_reg_n_0_[1] ;
  wire \prev_reg_n_0_[20] ;
  wire \prev_reg_n_0_[21] ;
  wire \prev_reg_n_0_[22] ;
  wire \prev_reg_n_0_[23] ;
  wire \prev_reg_n_0_[24] ;
  wire \prev_reg_n_0_[25] ;
  wire \prev_reg_n_0_[26] ;
  wire \prev_reg_n_0_[27] ;
  wire \prev_reg_n_0_[28] ;
  wire \prev_reg_n_0_[29] ;
  wire \prev_reg_n_0_[2] ;
  wire \prev_reg_n_0_[30] ;
  wire \prev_reg_n_0_[31] ;
  wire \prev_reg_n_0_[32] ;
  wire \prev_reg_n_0_[33] ;
  wire \prev_reg_n_0_[34] ;
  wire \prev_reg_n_0_[35] ;
  wire \prev_reg_n_0_[36] ;
  wire \prev_reg_n_0_[37] ;
  wire \prev_reg_n_0_[38] ;
  wire \prev_reg_n_0_[39] ;
  wire \prev_reg_n_0_[3] ;
  wire \prev_reg_n_0_[40] ;
  wire \prev_reg_n_0_[41] ;
  wire \prev_reg_n_0_[42] ;
  wire \prev_reg_n_0_[43] ;
  wire \prev_reg_n_0_[44] ;
  wire \prev_reg_n_0_[45] ;
  wire \prev_reg_n_0_[46] ;
  wire \prev_reg_n_0_[47] ;
  wire \prev_reg_n_0_[48] ;
  wire \prev_reg_n_0_[49] ;
  wire \prev_reg_n_0_[4] ;
  wire \prev_reg_n_0_[50] ;
  wire \prev_reg_n_0_[51] ;
  wire \prev_reg_n_0_[52] ;
  wire \prev_reg_n_0_[53] ;
  wire \prev_reg_n_0_[54] ;
  wire \prev_reg_n_0_[55] ;
  wire \prev_reg_n_0_[56] ;
  wire \prev_reg_n_0_[57] ;
  wire \prev_reg_n_0_[58] ;
  wire \prev_reg_n_0_[59] ;
  wire \prev_reg_n_0_[5] ;
  wire \prev_reg_n_0_[60] ;
  wire \prev_reg_n_0_[61] ;
  wire \prev_reg_n_0_[62] ;
  wire \prev_reg_n_0_[63] ;
  wire \prev_reg_n_0_[6] ;
  wire \prev_reg_n_0_[7] ;
  wire \prev_reg_n_0_[8] ;
  wire \prev_reg_n_0_[9] ;
  wire rst;
  wire rst_IBUF;
  wire start;
  wire start_IBUF;
  wire [0:0]state;
  wire [1:0]state__0;
  wire [2:0]\NLW_current_reg[11]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[15]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[19]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[23]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[27]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[31]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[35]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[39]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[3]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[43]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[47]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[51]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[55]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[59]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_current_reg[63]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_current_reg[7]_i_2_CO_UNCONNECTED ;

initial begin
 $sdf_annotate("testbench_time_impl.sdf",,,,"tool_control");
end
  LUT4 #(
    .INIT(16'h2EFF)) 
    \FSM_sequential_state[0]_inv_i_1 
       (.I0(\FSM_sequential_state[1]_i_5_n_0 ),
        .I1(\FSM_sequential_state_reg_n_0_[1] ),
        .I2(start_IBUF),
        .I3(state),
        .O(state__0[0]));
  LUT6 #(
    .INIT(64'h6F6F6A6F6A6F6A6A)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state_reg_n_0_[1] ),
        .I1(start_IBUF),
        .I2(state),
        .I3(\FSM_sequential_state[1]_i_3_n_0 ),
        .I4(\FSM_sequential_state[1]_i_4_n_0 ),
        .I5(\counter_reg_n_0_[5] ),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB383)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(start_IBUF),
        .I1(\FSM_sequential_state_reg_n_0_[1] ),
        .I2(state),
        .I3(\FSM_sequential_state[1]_i_5_n_0 ),
        .O(state__0[1]));
  LUT6 #(
    .INIT(64'hB220000BFFFBB22F)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\FSM_sequential_state[1]_i_6_n_0 ),
        .I1(\counter_reg_n_0_[3] ),
        .I2(n_IBUF[3]),
        .I3(\current[0]_i_2_n_0 ),
        .I4(n_IBUF[4]),
        .I5(\counter_reg_n_0_[4] ),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFE)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(n_IBUF[4]),
        .I1(n_IBUF[2]),
        .I2(n_IBUF[0]),
        .I3(n_IBUF[1]),
        .I4(n_IBUF[3]),
        .I5(n_IBUF[5]),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_sequential_state[1]_i_5 
       (.I0(n_IBUF[5]),
        .I1(n_IBUF[4]),
        .I2(n_IBUF[1]),
        .I3(n_IBUF[0]),
        .I4(n_IBUF[3]),
        .I5(n_IBUF[2]),
        .O(\FSM_sequential_state[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h30100007FFF7301F)) 
    \FSM_sequential_state[1]_i_6 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(n_IBUF[1]),
        .I3(n_IBUF[0]),
        .I4(n_IBUF[2]),
        .I5(\counter_reg_n_0_[2] ),
        .O(\FSM_sequential_state[1]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "calc:01,done:10,idle:00,iSTATE:11" *) 
  (* inverted = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_sequential_state_reg[0]_inv 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_sequential_state[1]_i_1_n_0 ),
        .D(state__0[0]),
        .PRE(rst_IBUF),
        .Q(state));
  (* FSM_ENCODED_STATES = "calc:01,done:10,idle:00,iSTATE:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_sequential_state[1]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(state__0[1]),
        .Q(\FSM_sequential_state_reg_n_0_[1] ));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \counter[0]_i_1 
       (.I0(state),
        .I1(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \counter[1]_i_1 
       (.I0(state),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .O(counter[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1444)) 
    \counter[2]_i_1 
       (.I0(state),
        .I1(\counter_reg_n_0_[2] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .O(counter[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h14444444)) 
    \counter[3]_i_1 
       (.I0(state),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\counter_reg_n_0_[1] ),
        .O(counter[3]));
  LUT6 #(
    .INIT(64'h1444444444444444)) 
    \counter[4]_i_1 
       (.I0(state),
        .I1(\counter_reg_n_0_[4] ),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[0] ),
        .I5(\counter_reg_n_0_[2] ),
        .O(counter[4]));
  LUT6 #(
    .INIT(64'h000000008BBB888B)) 
    \counter[5]_i_1 
       (.I0(start_IBUF),
        .I1(state),
        .I2(\counter_reg_n_0_[5] ),
        .I3(\FSM_sequential_state[1]_i_4_n_0 ),
        .I4(\FSM_sequential_state[1]_i_3_n_0 ),
        .I5(\FSM_sequential_state_reg_n_0_[1] ),
        .O(\counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h1444)) 
    \counter[5]_i_2 
       (.I0(state),
        .I1(\counter_reg_n_0_[5] ),
        .I2(\counter_reg_n_0_[4] ),
        .I3(\counter[5]_i_3_n_0 ),
        .O(counter[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \counter[5]_i_3 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[2] ),
        .O(\counter[5]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(counter[1]),
        .Q(\counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(counter[2]),
        .Q(\counter_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(counter[3]),
        .Q(\counter_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(counter[4]),
        .Q(\counter_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(counter[5]),
        .Q(\counter_reg_n_0_[5] ));
  LUT6 #(
    .INIT(64'hFFFFFFFCAAAAAAAA)) 
    \current[0]_i_1 
       (.I0(in8[0]),
        .I1(n_IBUF[4]),
        .I2(n_IBUF[5]),
        .I3(\current[0]_i_2_n_0 ),
        .I4(n_IBUF[3]),
        .I5(state),
        .O(current));
  LUT3 #(
    .INIT(8'hFE)) 
    \current[0]_i_2 
       (.I0(n_IBUF[1]),
        .I1(n_IBUF[0]),
        .I2(n_IBUF[2]),
        .O(\current[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[10]_i_1 
       (.I0(state),
        .I1(in8[10]),
        .O(\current[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[11]_i_1 
       (.I0(state),
        .I1(in8[11]),
        .O(\current[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[11]_i_3 
       (.I0(\current_reg_n_0_[11] ),
        .I1(\prev_reg_n_0_[11] ),
        .O(\current[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[11]_i_4 
       (.I0(\current_reg_n_0_[10] ),
        .I1(\prev_reg_n_0_[10] ),
        .O(\current[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[11]_i_5 
       (.I0(\current_reg_n_0_[9] ),
        .I1(\prev_reg_n_0_[9] ),
        .O(\current[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[11]_i_6 
       (.I0(\current_reg_n_0_[8] ),
        .I1(\prev_reg_n_0_[8] ),
        .O(\current[11]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[12]_i_1 
       (.I0(state),
        .I1(in8[12]),
        .O(\current[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[13]_i_1 
       (.I0(state),
        .I1(in8[13]),
        .O(\current[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[14]_i_1 
       (.I0(state),
        .I1(in8[14]),
        .O(\current[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[15]_i_1 
       (.I0(state),
        .I1(in8[15]),
        .O(\current[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[15]_i_3 
       (.I0(\current_reg_n_0_[15] ),
        .I1(\prev_reg_n_0_[15] ),
        .O(\current[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[15]_i_4 
       (.I0(\current_reg_n_0_[14] ),
        .I1(\prev_reg_n_0_[14] ),
        .O(\current[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[15]_i_5 
       (.I0(\current_reg_n_0_[13] ),
        .I1(\prev_reg_n_0_[13] ),
        .O(\current[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[15]_i_6 
       (.I0(\current_reg_n_0_[12] ),
        .I1(\prev_reg_n_0_[12] ),
        .O(\current[15]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[16]_i_1 
       (.I0(state),
        .I1(in8[16]),
        .O(\current[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[17]_i_1 
       (.I0(state),
        .I1(in8[17]),
        .O(\current[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[18]_i_1 
       (.I0(state),
        .I1(in8[18]),
        .O(\current[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[19]_i_1 
       (.I0(state),
        .I1(in8[19]),
        .O(\current[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[19]_i_3 
       (.I0(\current_reg_n_0_[19] ),
        .I1(\prev_reg_n_0_[19] ),
        .O(\current[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[19]_i_4 
       (.I0(\current_reg_n_0_[18] ),
        .I1(\prev_reg_n_0_[18] ),
        .O(\current[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[19]_i_5 
       (.I0(\current_reg_n_0_[17] ),
        .I1(\prev_reg_n_0_[17] ),
        .O(\current[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[19]_i_6 
       (.I0(\current_reg_n_0_[16] ),
        .I1(\prev_reg_n_0_[16] ),
        .O(\current[19]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[1]_i_1 
       (.I0(state),
        .I1(in8[1]),
        .O(\current[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[20]_i_1 
       (.I0(state),
        .I1(in8[20]),
        .O(\current[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[21]_i_1 
       (.I0(state),
        .I1(in8[21]),
        .O(\current[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[22]_i_1 
       (.I0(state),
        .I1(in8[22]),
        .O(\current[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[23]_i_1 
       (.I0(state),
        .I1(in8[23]),
        .O(\current[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[23]_i_3 
       (.I0(\current_reg_n_0_[23] ),
        .I1(\prev_reg_n_0_[23] ),
        .O(\current[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[23]_i_4 
       (.I0(\current_reg_n_0_[22] ),
        .I1(\prev_reg_n_0_[22] ),
        .O(\current[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[23]_i_5 
       (.I0(\current_reg_n_0_[21] ),
        .I1(\prev_reg_n_0_[21] ),
        .O(\current[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[23]_i_6 
       (.I0(\current_reg_n_0_[20] ),
        .I1(\prev_reg_n_0_[20] ),
        .O(\current[23]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[24]_i_1 
       (.I0(state),
        .I1(in8[24]),
        .O(\current[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[25]_i_1 
       (.I0(state),
        .I1(in8[25]),
        .O(\current[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[26]_i_1 
       (.I0(state),
        .I1(in8[26]),
        .O(\current[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[27]_i_1 
       (.I0(state),
        .I1(in8[27]),
        .O(\current[27]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[27]_i_3 
       (.I0(\current_reg_n_0_[27] ),
        .I1(\prev_reg_n_0_[27] ),
        .O(\current[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[27]_i_4 
       (.I0(\current_reg_n_0_[26] ),
        .I1(\prev_reg_n_0_[26] ),
        .O(\current[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[27]_i_5 
       (.I0(\current_reg_n_0_[25] ),
        .I1(\prev_reg_n_0_[25] ),
        .O(\current[27]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[27]_i_6 
       (.I0(\current_reg_n_0_[24] ),
        .I1(\prev_reg_n_0_[24] ),
        .O(\current[27]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[28]_i_1 
       (.I0(state),
        .I1(in8[28]),
        .O(\current[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[29]_i_1 
       (.I0(state),
        .I1(in8[29]),
        .O(\current[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[2]_i_1 
       (.I0(state),
        .I1(in8[2]),
        .O(\current[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[30]_i_1 
       (.I0(state),
        .I1(in8[30]),
        .O(\current[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[31]_i_1 
       (.I0(state),
        .I1(in8[31]),
        .O(\current[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[31]_i_3 
       (.I0(\current_reg_n_0_[31] ),
        .I1(\prev_reg_n_0_[31] ),
        .O(\current[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[31]_i_4 
       (.I0(\current_reg_n_0_[30] ),
        .I1(\prev_reg_n_0_[30] ),
        .O(\current[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[31]_i_5 
       (.I0(\current_reg_n_0_[29] ),
        .I1(\prev_reg_n_0_[29] ),
        .O(\current[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[31]_i_6 
       (.I0(\current_reg_n_0_[28] ),
        .I1(\prev_reg_n_0_[28] ),
        .O(\current[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[32]_i_1 
       (.I0(state),
        .I1(in8[32]),
        .O(\current[32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[33]_i_1 
       (.I0(state),
        .I1(in8[33]),
        .O(\current[33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[34]_i_1 
       (.I0(state),
        .I1(in8[34]),
        .O(\current[34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[35]_i_1 
       (.I0(state),
        .I1(in8[35]),
        .O(\current[35]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[35]_i_3 
       (.I0(\current_reg_n_0_[35] ),
        .I1(\prev_reg_n_0_[35] ),
        .O(\current[35]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[35]_i_4 
       (.I0(\current_reg_n_0_[34] ),
        .I1(\prev_reg_n_0_[34] ),
        .O(\current[35]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[35]_i_5 
       (.I0(\current_reg_n_0_[33] ),
        .I1(\prev_reg_n_0_[33] ),
        .O(\current[35]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[35]_i_6 
       (.I0(\current_reg_n_0_[32] ),
        .I1(\prev_reg_n_0_[32] ),
        .O(\current[35]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[36]_i_1 
       (.I0(state),
        .I1(in8[36]),
        .O(\current[36]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[37]_i_1 
       (.I0(state),
        .I1(in8[37]),
        .O(\current[37]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[38]_i_1 
       (.I0(state),
        .I1(in8[38]),
        .O(\current[38]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[39]_i_1 
       (.I0(state),
        .I1(in8[39]),
        .O(\current[39]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[39]_i_3 
       (.I0(\current_reg_n_0_[39] ),
        .I1(\prev_reg_n_0_[39] ),
        .O(\current[39]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[39]_i_4 
       (.I0(\current_reg_n_0_[38] ),
        .I1(\prev_reg_n_0_[38] ),
        .O(\current[39]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[39]_i_5 
       (.I0(\current_reg_n_0_[37] ),
        .I1(\prev_reg_n_0_[37] ),
        .O(\current[39]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[39]_i_6 
       (.I0(\current_reg_n_0_[36] ),
        .I1(\prev_reg_n_0_[36] ),
        .O(\current[39]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[3]_i_1 
       (.I0(state),
        .I1(in8[3]),
        .O(\current[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[3]_i_3 
       (.I0(\current_reg_n_0_[3] ),
        .I1(\prev_reg_n_0_[3] ),
        .O(\current[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[3]_i_4 
       (.I0(\current_reg_n_0_[2] ),
        .I1(\prev_reg_n_0_[2] ),
        .O(\current[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[3]_i_5 
       (.I0(\current_reg_n_0_[1] ),
        .I1(\prev_reg_n_0_[1] ),
        .O(\current[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[3]_i_6 
       (.I0(\current_reg_n_0_[0] ),
        .I1(\prev_reg_n_0_[0] ),
        .O(\current[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[40]_i_1 
       (.I0(state),
        .I1(in8[40]),
        .O(\current[40]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[41]_i_1 
       (.I0(state),
        .I1(in8[41]),
        .O(\current[41]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[42]_i_1 
       (.I0(state),
        .I1(in8[42]),
        .O(\current[42]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[43]_i_1 
       (.I0(state),
        .I1(in8[43]),
        .O(\current[43]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[43]_i_3 
       (.I0(\current_reg_n_0_[43] ),
        .I1(\prev_reg_n_0_[43] ),
        .O(\current[43]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[43]_i_4 
       (.I0(\current_reg_n_0_[42] ),
        .I1(\prev_reg_n_0_[42] ),
        .O(\current[43]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[43]_i_5 
       (.I0(\current_reg_n_0_[41] ),
        .I1(\prev_reg_n_0_[41] ),
        .O(\current[43]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[43]_i_6 
       (.I0(\current_reg_n_0_[40] ),
        .I1(\prev_reg_n_0_[40] ),
        .O(\current[43]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[44]_i_1 
       (.I0(state),
        .I1(in8[44]),
        .O(\current[44]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[45]_i_1 
       (.I0(state),
        .I1(in8[45]),
        .O(\current[45]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[46]_i_1 
       (.I0(state),
        .I1(in8[46]),
        .O(\current[46]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[47]_i_1 
       (.I0(state),
        .I1(in8[47]),
        .O(\current[47]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[47]_i_3 
       (.I0(\current_reg_n_0_[47] ),
        .I1(\prev_reg_n_0_[47] ),
        .O(\current[47]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[47]_i_4 
       (.I0(\current_reg_n_0_[46] ),
        .I1(\prev_reg_n_0_[46] ),
        .O(\current[47]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[47]_i_5 
       (.I0(\current_reg_n_0_[45] ),
        .I1(\prev_reg_n_0_[45] ),
        .O(\current[47]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[47]_i_6 
       (.I0(\current_reg_n_0_[44] ),
        .I1(\prev_reg_n_0_[44] ),
        .O(\current[47]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[48]_i_1 
       (.I0(state),
        .I1(in8[48]),
        .O(\current[48]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[49]_i_1 
       (.I0(state),
        .I1(in8[49]),
        .O(\current[49]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[4]_i_1 
       (.I0(state),
        .I1(in8[4]),
        .O(\current[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[50]_i_1 
       (.I0(state),
        .I1(in8[50]),
        .O(\current[50]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[51]_i_1 
       (.I0(state),
        .I1(in8[51]),
        .O(\current[51]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[51]_i_3 
       (.I0(\current_reg_n_0_[51] ),
        .I1(\prev_reg_n_0_[51] ),
        .O(\current[51]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[51]_i_4 
       (.I0(\current_reg_n_0_[50] ),
        .I1(\prev_reg_n_0_[50] ),
        .O(\current[51]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[51]_i_5 
       (.I0(\current_reg_n_0_[49] ),
        .I1(\prev_reg_n_0_[49] ),
        .O(\current[51]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[51]_i_6 
       (.I0(\current_reg_n_0_[48] ),
        .I1(\prev_reg_n_0_[48] ),
        .O(\current[51]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[52]_i_1 
       (.I0(state),
        .I1(in8[52]),
        .O(\current[52]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[53]_i_1 
       (.I0(state),
        .I1(in8[53]),
        .O(\current[53]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[54]_i_1 
       (.I0(state),
        .I1(in8[54]),
        .O(\current[54]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[55]_i_1 
       (.I0(state),
        .I1(in8[55]),
        .O(\current[55]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[55]_i_3 
       (.I0(\current_reg_n_0_[55] ),
        .I1(\prev_reg_n_0_[55] ),
        .O(\current[55]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[55]_i_4 
       (.I0(\current_reg_n_0_[54] ),
        .I1(\prev_reg_n_0_[54] ),
        .O(\current[55]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[55]_i_5 
       (.I0(\current_reg_n_0_[53] ),
        .I1(\prev_reg_n_0_[53] ),
        .O(\current[55]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[55]_i_6 
       (.I0(\current_reg_n_0_[52] ),
        .I1(\prev_reg_n_0_[52] ),
        .O(\current[55]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[56]_i_1 
       (.I0(state),
        .I1(in8[56]),
        .O(\current[56]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[57]_i_1 
       (.I0(state),
        .I1(in8[57]),
        .O(\current[57]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[58]_i_1 
       (.I0(state),
        .I1(in8[58]),
        .O(\current[58]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[59]_i_1 
       (.I0(state),
        .I1(in8[59]),
        .O(\current[59]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[59]_i_3 
       (.I0(\current_reg_n_0_[59] ),
        .I1(\prev_reg_n_0_[59] ),
        .O(\current[59]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[59]_i_4 
       (.I0(\current_reg_n_0_[58] ),
        .I1(\prev_reg_n_0_[58] ),
        .O(\current[59]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[59]_i_5 
       (.I0(\current_reg_n_0_[57] ),
        .I1(\prev_reg_n_0_[57] ),
        .O(\current[59]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[59]_i_6 
       (.I0(\current_reg_n_0_[56] ),
        .I1(\prev_reg_n_0_[56] ),
        .O(\current[59]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[5]_i_1 
       (.I0(state),
        .I1(in8[5]),
        .O(\current[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[60]_i_1 
       (.I0(state),
        .I1(in8[60]),
        .O(\current[60]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[61]_i_1 
       (.I0(state),
        .I1(in8[61]),
        .O(\current[61]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[62]_i_1 
       (.I0(state),
        .I1(in8[62]),
        .O(\current[62]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \current[63]_i_1 
       (.I0(state),
        .I1(in8[63]),
        .O(\current[63]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[63]_i_3 
       (.I0(\current_reg_n_0_[63] ),
        .I1(\prev_reg_n_0_[63] ),
        .O(\current[63]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[63]_i_4 
       (.I0(\current_reg_n_0_[62] ),
        .I1(\prev_reg_n_0_[62] ),
        .O(\current[63]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[63]_i_5 
       (.I0(\current_reg_n_0_[61] ),
        .I1(\prev_reg_n_0_[61] ),
        .O(\current[63]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[63]_i_6 
       (.I0(\current_reg_n_0_[60] ),
        .I1(\prev_reg_n_0_[60] ),
        .O(\current[63]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[6]_i_1 
       (.I0(state),
        .I1(in8[6]),
        .O(\current[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[7]_i_1 
       (.I0(state),
        .I1(in8[7]),
        .O(\current[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[7]_i_3 
       (.I0(\current_reg_n_0_[7] ),
        .I1(\prev_reg_n_0_[7] ),
        .O(\current[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[7]_i_4 
       (.I0(\current_reg_n_0_[6] ),
        .I1(\prev_reg_n_0_[6] ),
        .O(\current[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[7]_i_5 
       (.I0(\current_reg_n_0_[5] ),
        .I1(\prev_reg_n_0_[5] ),
        .O(\current[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \current[7]_i_6 
       (.I0(\current_reg_n_0_[4] ),
        .I1(\prev_reg_n_0_[4] ),
        .O(\current[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[8]_i_1 
       (.I0(state),
        .I1(in8[8]),
        .O(\current[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \current[9]_i_1 
       (.I0(state),
        .I1(in8[9]),
        .O(\current[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(current),
        .Q(\current_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[10]_i_1_n_0 ),
        .Q(\current_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[11]_i_1_n_0 ),
        .Q(\current_reg_n_0_[11] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[11]_i_2 
       (.CI(\current_reg[7]_i_2_n_0 ),
        .CO({\current_reg[11]_i_2_n_0 ,\NLW_current_reg[11]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[11] ,\current_reg_n_0_[10] ,\current_reg_n_0_[9] ,\current_reg_n_0_[8] }),
        .O(in8[11:8]),
        .S({\current[11]_i_3_n_0 ,\current[11]_i_4_n_0 ,\current[11]_i_5_n_0 ,\current[11]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[12]_i_1_n_0 ),
        .Q(\current_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[13]_i_1_n_0 ),
        .Q(\current_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[14]_i_1_n_0 ),
        .Q(\current_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[15]_i_1_n_0 ),
        .Q(\current_reg_n_0_[15] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[15]_i_2 
       (.CI(\current_reg[11]_i_2_n_0 ),
        .CO({\current_reg[15]_i_2_n_0 ,\NLW_current_reg[15]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[15] ,\current_reg_n_0_[14] ,\current_reg_n_0_[13] ,\current_reg_n_0_[12] }),
        .O(in8[15:12]),
        .S({\current[15]_i_3_n_0 ,\current[15]_i_4_n_0 ,\current[15]_i_5_n_0 ,\current[15]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[16]_i_1_n_0 ),
        .Q(\current_reg_n_0_[16] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[17]_i_1_n_0 ),
        .Q(\current_reg_n_0_[17] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[18]_i_1_n_0 ),
        .Q(\current_reg_n_0_[18] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[19]_i_1_n_0 ),
        .Q(\current_reg_n_0_[19] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[19]_i_2 
       (.CI(\current_reg[15]_i_2_n_0 ),
        .CO({\current_reg[19]_i_2_n_0 ,\NLW_current_reg[19]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[19] ,\current_reg_n_0_[18] ,\current_reg_n_0_[17] ,\current_reg_n_0_[16] }),
        .O(in8[19:16]),
        .S({\current[19]_i_3_n_0 ,\current[19]_i_4_n_0 ,\current[19]_i_5_n_0 ,\current[19]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[1]_i_1_n_0 ),
        .Q(\current_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[20]_i_1_n_0 ),
        .Q(\current_reg_n_0_[20] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[21]_i_1_n_0 ),
        .Q(\current_reg_n_0_[21] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[22]_i_1_n_0 ),
        .Q(\current_reg_n_0_[22] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[23]_i_1_n_0 ),
        .Q(\current_reg_n_0_[23] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[23]_i_2 
       (.CI(\current_reg[19]_i_2_n_0 ),
        .CO({\current_reg[23]_i_2_n_0 ,\NLW_current_reg[23]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[23] ,\current_reg_n_0_[22] ,\current_reg_n_0_[21] ,\current_reg_n_0_[20] }),
        .O(in8[23:20]),
        .S({\current[23]_i_3_n_0 ,\current[23]_i_4_n_0 ,\current[23]_i_5_n_0 ,\current[23]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[24]_i_1_n_0 ),
        .Q(\current_reg_n_0_[24] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[25]_i_1_n_0 ),
        .Q(\current_reg_n_0_[25] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[26]_i_1_n_0 ),
        .Q(\current_reg_n_0_[26] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[27]_i_1_n_0 ),
        .Q(\current_reg_n_0_[27] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[27]_i_2 
       (.CI(\current_reg[23]_i_2_n_0 ),
        .CO({\current_reg[27]_i_2_n_0 ,\NLW_current_reg[27]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[27] ,\current_reg_n_0_[26] ,\current_reg_n_0_[25] ,\current_reg_n_0_[24] }),
        .O(in8[27:24]),
        .S({\current[27]_i_3_n_0 ,\current[27]_i_4_n_0 ,\current[27]_i_5_n_0 ,\current[27]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[28]_i_1_n_0 ),
        .Q(\current_reg_n_0_[28] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[29]_i_1_n_0 ),
        .Q(\current_reg_n_0_[29] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[2]_i_1_n_0 ),
        .Q(\current_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[30]_i_1_n_0 ),
        .Q(\current_reg_n_0_[30] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[31]_i_1_n_0 ),
        .Q(\current_reg_n_0_[31] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[31]_i_2 
       (.CI(\current_reg[27]_i_2_n_0 ),
        .CO({\current_reg[31]_i_2_n_0 ,\NLW_current_reg[31]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[31] ,\current_reg_n_0_[30] ,\current_reg_n_0_[29] ,\current_reg_n_0_[28] }),
        .O(in8[31:28]),
        .S({\current[31]_i_3_n_0 ,\current[31]_i_4_n_0 ,\current[31]_i_5_n_0 ,\current[31]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[32]_i_1_n_0 ),
        .Q(\current_reg_n_0_[32] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[33]_i_1_n_0 ),
        .Q(\current_reg_n_0_[33] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[34]_i_1_n_0 ),
        .Q(\current_reg_n_0_[34] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[35]_i_1_n_0 ),
        .Q(\current_reg_n_0_[35] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[35]_i_2 
       (.CI(\current_reg[31]_i_2_n_0 ),
        .CO({\current_reg[35]_i_2_n_0 ,\NLW_current_reg[35]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[35] ,\current_reg_n_0_[34] ,\current_reg_n_0_[33] ,\current_reg_n_0_[32] }),
        .O(in8[35:32]),
        .S({\current[35]_i_3_n_0 ,\current[35]_i_4_n_0 ,\current[35]_i_5_n_0 ,\current[35]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[36]_i_1_n_0 ),
        .Q(\current_reg_n_0_[36] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[37]_i_1_n_0 ),
        .Q(\current_reg_n_0_[37] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[38]_i_1_n_0 ),
        .Q(\current_reg_n_0_[38] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[39]_i_1_n_0 ),
        .Q(\current_reg_n_0_[39] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[39]_i_2 
       (.CI(\current_reg[35]_i_2_n_0 ),
        .CO({\current_reg[39]_i_2_n_0 ,\NLW_current_reg[39]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[39] ,\current_reg_n_0_[38] ,\current_reg_n_0_[37] ,\current_reg_n_0_[36] }),
        .O(in8[39:36]),
        .S({\current[39]_i_3_n_0 ,\current[39]_i_4_n_0 ,\current[39]_i_5_n_0 ,\current[39]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[3]_i_1_n_0 ),
        .Q(\current_reg_n_0_[3] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\current_reg[3]_i_2_n_0 ,\NLW_current_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[3] ,\current_reg_n_0_[2] ,\current_reg_n_0_[1] ,\current_reg_n_0_[0] }),
        .O(in8[3:0]),
        .S({\current[3]_i_3_n_0 ,\current[3]_i_4_n_0 ,\current[3]_i_5_n_0 ,\current[3]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[40]_i_1_n_0 ),
        .Q(\current_reg_n_0_[40] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[41]_i_1_n_0 ),
        .Q(\current_reg_n_0_[41] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[42]_i_1_n_0 ),
        .Q(\current_reg_n_0_[42] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[43]_i_1_n_0 ),
        .Q(\current_reg_n_0_[43] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[43]_i_2 
       (.CI(\current_reg[39]_i_2_n_0 ),
        .CO({\current_reg[43]_i_2_n_0 ,\NLW_current_reg[43]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[43] ,\current_reg_n_0_[42] ,\current_reg_n_0_[41] ,\current_reg_n_0_[40] }),
        .O(in8[43:40]),
        .S({\current[43]_i_3_n_0 ,\current[43]_i_4_n_0 ,\current[43]_i_5_n_0 ,\current[43]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[44]_i_1_n_0 ),
        .Q(\current_reg_n_0_[44] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[45]_i_1_n_0 ),
        .Q(\current_reg_n_0_[45] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[46]_i_1_n_0 ),
        .Q(\current_reg_n_0_[46] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[47]_i_1_n_0 ),
        .Q(\current_reg_n_0_[47] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[47]_i_2 
       (.CI(\current_reg[43]_i_2_n_0 ),
        .CO({\current_reg[47]_i_2_n_0 ,\NLW_current_reg[47]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[47] ,\current_reg_n_0_[46] ,\current_reg_n_0_[45] ,\current_reg_n_0_[44] }),
        .O(in8[47:44]),
        .S({\current[47]_i_3_n_0 ,\current[47]_i_4_n_0 ,\current[47]_i_5_n_0 ,\current[47]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[48]_i_1_n_0 ),
        .Q(\current_reg_n_0_[48] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[49]_i_1_n_0 ),
        .Q(\current_reg_n_0_[49] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[4]_i_1_n_0 ),
        .Q(\current_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[50]_i_1_n_0 ),
        .Q(\current_reg_n_0_[50] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[51]_i_1_n_0 ),
        .Q(\current_reg_n_0_[51] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[51]_i_2 
       (.CI(\current_reg[47]_i_2_n_0 ),
        .CO({\current_reg[51]_i_2_n_0 ,\NLW_current_reg[51]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[51] ,\current_reg_n_0_[50] ,\current_reg_n_0_[49] ,\current_reg_n_0_[48] }),
        .O(in8[51:48]),
        .S({\current[51]_i_3_n_0 ,\current[51]_i_4_n_0 ,\current[51]_i_5_n_0 ,\current[51]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[52]_i_1_n_0 ),
        .Q(\current_reg_n_0_[52] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[53]_i_1_n_0 ),
        .Q(\current_reg_n_0_[53] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[54]_i_1_n_0 ),
        .Q(\current_reg_n_0_[54] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[55]_i_1_n_0 ),
        .Q(\current_reg_n_0_[55] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[55]_i_2 
       (.CI(\current_reg[51]_i_2_n_0 ),
        .CO({\current_reg[55]_i_2_n_0 ,\NLW_current_reg[55]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[55] ,\current_reg_n_0_[54] ,\current_reg_n_0_[53] ,\current_reg_n_0_[52] }),
        .O(in8[55:52]),
        .S({\current[55]_i_3_n_0 ,\current[55]_i_4_n_0 ,\current[55]_i_5_n_0 ,\current[55]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[56]_i_1_n_0 ),
        .Q(\current_reg_n_0_[56] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[57]_i_1_n_0 ),
        .Q(\current_reg_n_0_[57] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[58]_i_1_n_0 ),
        .Q(\current_reg_n_0_[58] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[59]_i_1_n_0 ),
        .Q(\current_reg_n_0_[59] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[59]_i_2 
       (.CI(\current_reg[55]_i_2_n_0 ),
        .CO({\current_reg[59]_i_2_n_0 ,\NLW_current_reg[59]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[59] ,\current_reg_n_0_[58] ,\current_reg_n_0_[57] ,\current_reg_n_0_[56] }),
        .O(in8[59:56]),
        .S({\current[59]_i_3_n_0 ,\current[59]_i_4_n_0 ,\current[59]_i_5_n_0 ,\current[59]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[5]_i_1_n_0 ),
        .Q(\current_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[60]_i_1_n_0 ),
        .Q(\current_reg_n_0_[60] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[61]_i_1_n_0 ),
        .Q(\current_reg_n_0_[61] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[62]_i_1_n_0 ),
        .Q(\current_reg_n_0_[62] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[63]_i_1_n_0 ),
        .Q(\current_reg_n_0_[63] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[63]_i_2 
       (.CI(\current_reg[59]_i_2_n_0 ),
        .CO(\NLW_current_reg[63]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,\current_reg_n_0_[62] ,\current_reg_n_0_[61] ,\current_reg_n_0_[60] }),
        .O(in8[63:60]),
        .S({\current[63]_i_3_n_0 ,\current[63]_i_4_n_0 ,\current[63]_i_5_n_0 ,\current[63]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[6]_i_1_n_0 ),
        .Q(\current_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[7]_i_1_n_0 ),
        .Q(\current_reg_n_0_[7] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \current_reg[7]_i_2 
       (.CI(\current_reg[3]_i_2_n_0 ),
        .CO({\current_reg[7]_i_2_n_0 ,\NLW_current_reg[7]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\current_reg_n_0_[7] ,\current_reg_n_0_[6] ,\current_reg_n_0_[5] ,\current_reg_n_0_[4] }),
        .O(in8[7:4]),
        .S({\current[7]_i_3_n_0 ,\current[7]_i_4_n_0 ,\current[7]_i_5_n_0 ,\current[7]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[8]_i_1_n_0 ),
        .Q(\current_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \current_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current[9]_i_1_n_0 ),
        .Q(\current_reg_n_0_[9] ));
  LUT2 #(
    .INIT(4'h8)) 
    \fib_n[63]_i_1 
       (.I0(\FSM_sequential_state_reg_n_0_[1] ),
        .I1(state),
        .O(\fib_n[63]_i_1_n_0 ));
  OBUF \fib_n_OBUF[0]_inst 
       (.I(fib_n_OBUF[0]),
        .O(fib_n[0]));
  OBUF \fib_n_OBUF[10]_inst 
       (.I(fib_n_OBUF[10]),
        .O(fib_n[10]));
  OBUF \fib_n_OBUF[11]_inst 
       (.I(fib_n_OBUF[11]),
        .O(fib_n[11]));
  OBUF \fib_n_OBUF[12]_inst 
       (.I(fib_n_OBUF[12]),
        .O(fib_n[12]));
  OBUF \fib_n_OBUF[13]_inst 
       (.I(fib_n_OBUF[13]),
        .O(fib_n[13]));
  OBUF \fib_n_OBUF[14]_inst 
       (.I(fib_n_OBUF[14]),
        .O(fib_n[14]));
  OBUF \fib_n_OBUF[15]_inst 
       (.I(fib_n_OBUF[15]),
        .O(fib_n[15]));
  OBUF \fib_n_OBUF[16]_inst 
       (.I(fib_n_OBUF[16]),
        .O(fib_n[16]));
  OBUF \fib_n_OBUF[17]_inst 
       (.I(fib_n_OBUF[17]),
        .O(fib_n[17]));
  OBUF \fib_n_OBUF[18]_inst 
       (.I(fib_n_OBUF[18]),
        .O(fib_n[18]));
  OBUF \fib_n_OBUF[19]_inst 
       (.I(fib_n_OBUF[19]),
        .O(fib_n[19]));
  OBUF \fib_n_OBUF[1]_inst 
       (.I(fib_n_OBUF[1]),
        .O(fib_n[1]));
  OBUF \fib_n_OBUF[20]_inst 
       (.I(fib_n_OBUF[20]),
        .O(fib_n[20]));
  OBUF \fib_n_OBUF[21]_inst 
       (.I(fib_n_OBUF[21]),
        .O(fib_n[21]));
  OBUF \fib_n_OBUF[22]_inst 
       (.I(fib_n_OBUF[22]),
        .O(fib_n[22]));
  OBUF \fib_n_OBUF[23]_inst 
       (.I(fib_n_OBUF[23]),
        .O(fib_n[23]));
  OBUF \fib_n_OBUF[24]_inst 
       (.I(fib_n_OBUF[24]),
        .O(fib_n[24]));
  OBUF \fib_n_OBUF[25]_inst 
       (.I(fib_n_OBUF[25]),
        .O(fib_n[25]));
  OBUF \fib_n_OBUF[26]_inst 
       (.I(fib_n_OBUF[26]),
        .O(fib_n[26]));
  OBUF \fib_n_OBUF[27]_inst 
       (.I(fib_n_OBUF[27]),
        .O(fib_n[27]));
  OBUF \fib_n_OBUF[28]_inst 
       (.I(fib_n_OBUF[28]),
        .O(fib_n[28]));
  OBUF \fib_n_OBUF[29]_inst 
       (.I(fib_n_OBUF[29]),
        .O(fib_n[29]));
  OBUF \fib_n_OBUF[2]_inst 
       (.I(fib_n_OBUF[2]),
        .O(fib_n[2]));
  OBUF \fib_n_OBUF[30]_inst 
       (.I(fib_n_OBUF[30]),
        .O(fib_n[30]));
  OBUF \fib_n_OBUF[31]_inst 
       (.I(fib_n_OBUF[31]),
        .O(fib_n[31]));
  OBUF \fib_n_OBUF[32]_inst 
       (.I(fib_n_OBUF[32]),
        .O(fib_n[32]));
  OBUF \fib_n_OBUF[33]_inst 
       (.I(fib_n_OBUF[33]),
        .O(fib_n[33]));
  OBUF \fib_n_OBUF[34]_inst 
       (.I(fib_n_OBUF[34]),
        .O(fib_n[34]));
  OBUF \fib_n_OBUF[35]_inst 
       (.I(fib_n_OBUF[35]),
        .O(fib_n[35]));
  OBUF \fib_n_OBUF[36]_inst 
       (.I(fib_n_OBUF[36]),
        .O(fib_n[36]));
  OBUF \fib_n_OBUF[37]_inst 
       (.I(fib_n_OBUF[37]),
        .O(fib_n[37]));
  OBUF \fib_n_OBUF[38]_inst 
       (.I(fib_n_OBUF[38]),
        .O(fib_n[38]));
  OBUF \fib_n_OBUF[39]_inst 
       (.I(fib_n_OBUF[39]),
        .O(fib_n[39]));
  OBUF \fib_n_OBUF[3]_inst 
       (.I(fib_n_OBUF[3]),
        .O(fib_n[3]));
  OBUF \fib_n_OBUF[40]_inst 
       (.I(fib_n_OBUF[40]),
        .O(fib_n[40]));
  OBUF \fib_n_OBUF[41]_inst 
       (.I(fib_n_OBUF[41]),
        .O(fib_n[41]));
  OBUF \fib_n_OBUF[42]_inst 
       (.I(fib_n_OBUF[42]),
        .O(fib_n[42]));
  OBUF \fib_n_OBUF[43]_inst 
       (.I(fib_n_OBUF[43]),
        .O(fib_n[43]));
  OBUF \fib_n_OBUF[44]_inst 
       (.I(fib_n_OBUF[44]),
        .O(fib_n[44]));
  OBUF \fib_n_OBUF[45]_inst 
       (.I(fib_n_OBUF[45]),
        .O(fib_n[45]));
  OBUF \fib_n_OBUF[46]_inst 
       (.I(fib_n_OBUF[46]),
        .O(fib_n[46]));
  OBUF \fib_n_OBUF[47]_inst 
       (.I(fib_n_OBUF[47]),
        .O(fib_n[47]));
  OBUF \fib_n_OBUF[48]_inst 
       (.I(fib_n_OBUF[48]),
        .O(fib_n[48]));
  OBUF \fib_n_OBUF[49]_inst 
       (.I(fib_n_OBUF[49]),
        .O(fib_n[49]));
  OBUF \fib_n_OBUF[4]_inst 
       (.I(fib_n_OBUF[4]),
        .O(fib_n[4]));
  OBUF \fib_n_OBUF[50]_inst 
       (.I(fib_n_OBUF[50]),
        .O(fib_n[50]));
  OBUF \fib_n_OBUF[51]_inst 
       (.I(fib_n_OBUF[51]),
        .O(fib_n[51]));
  OBUF \fib_n_OBUF[52]_inst 
       (.I(fib_n_OBUF[52]),
        .O(fib_n[52]));
  OBUF \fib_n_OBUF[53]_inst 
       (.I(fib_n_OBUF[53]),
        .O(fib_n[53]));
  OBUF \fib_n_OBUF[54]_inst 
       (.I(fib_n_OBUF[54]),
        .O(fib_n[54]));
  OBUF \fib_n_OBUF[55]_inst 
       (.I(fib_n_OBUF[55]),
        .O(fib_n[55]));
  OBUF \fib_n_OBUF[56]_inst 
       (.I(fib_n_OBUF[56]),
        .O(fib_n[56]));
  OBUF \fib_n_OBUF[57]_inst 
       (.I(fib_n_OBUF[57]),
        .O(fib_n[57]));
  OBUF \fib_n_OBUF[58]_inst 
       (.I(fib_n_OBUF[58]),
        .O(fib_n[58]));
  OBUF \fib_n_OBUF[59]_inst 
       (.I(fib_n_OBUF[59]),
        .O(fib_n[59]));
  OBUF \fib_n_OBUF[5]_inst 
       (.I(fib_n_OBUF[5]),
        .O(fib_n[5]));
  OBUF \fib_n_OBUF[60]_inst 
       (.I(fib_n_OBUF[60]),
        .O(fib_n[60]));
  OBUF \fib_n_OBUF[61]_inst 
       (.I(fib_n_OBUF[61]),
        .O(fib_n[61]));
  OBUF \fib_n_OBUF[62]_inst 
       (.I(fib_n_OBUF[62]),
        .O(fib_n[62]));
  OBUF \fib_n_OBUF[63]_inst 
       (.I(fib_n_OBUF[63]),
        .O(fib_n[63]));
  OBUF \fib_n_OBUF[6]_inst 
       (.I(fib_n_OBUF[6]),
        .O(fib_n[6]));
  OBUF \fib_n_OBUF[7]_inst 
       (.I(fib_n_OBUF[7]),
        .O(fib_n[7]));
  OBUF \fib_n_OBUF[8]_inst 
       (.I(fib_n_OBUF[8]),
        .O(fib_n[8]));
  OBUF \fib_n_OBUF[9]_inst 
       (.I(fib_n_OBUF[9]),
        .O(fib_n[9]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[0] ),
        .Q(fib_n_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[10] ),
        .Q(fib_n_OBUF[10]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[11] ),
        .Q(fib_n_OBUF[11]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[12] ),
        .Q(fib_n_OBUF[12]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[13] ),
        .Q(fib_n_OBUF[13]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[14] ),
        .Q(fib_n_OBUF[14]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[15] ),
        .Q(fib_n_OBUF[15]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[16] ),
        .Q(fib_n_OBUF[16]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[17] ),
        .Q(fib_n_OBUF[17]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[18] ),
        .Q(fib_n_OBUF[18]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[19] ),
        .Q(fib_n_OBUF[19]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[1] ),
        .Q(fib_n_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[20] ),
        .Q(fib_n_OBUF[20]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[21] ),
        .Q(fib_n_OBUF[21]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[22] ),
        .Q(fib_n_OBUF[22]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[23] ),
        .Q(fib_n_OBUF[23]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[24] ),
        .Q(fib_n_OBUF[24]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[25] ),
        .Q(fib_n_OBUF[25]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[26] ),
        .Q(fib_n_OBUF[26]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[27] ),
        .Q(fib_n_OBUF[27]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[28] ),
        .Q(fib_n_OBUF[28]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[29] ),
        .Q(fib_n_OBUF[29]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[2] ),
        .Q(fib_n_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[30] ),
        .Q(fib_n_OBUF[30]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[31] ),
        .Q(fib_n_OBUF[31]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[32] ),
        .Q(fib_n_OBUF[32]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[33] ),
        .Q(fib_n_OBUF[33]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[34] ),
        .Q(fib_n_OBUF[34]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[35] ),
        .Q(fib_n_OBUF[35]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[36] ),
        .Q(fib_n_OBUF[36]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[37] ),
        .Q(fib_n_OBUF[37]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[38] ),
        .Q(fib_n_OBUF[38]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[39] ),
        .Q(fib_n_OBUF[39]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[3] ),
        .Q(fib_n_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[40] ),
        .Q(fib_n_OBUF[40]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[41] ),
        .Q(fib_n_OBUF[41]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[42] ),
        .Q(fib_n_OBUF[42]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[43] ),
        .Q(fib_n_OBUF[43]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[44] ),
        .Q(fib_n_OBUF[44]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[45] ),
        .Q(fib_n_OBUF[45]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[46] ),
        .Q(fib_n_OBUF[46]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[47] ),
        .Q(fib_n_OBUF[47]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[48] ),
        .Q(fib_n_OBUF[48]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[49] ),
        .Q(fib_n_OBUF[49]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[4] ),
        .Q(fib_n_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[50] ),
        .Q(fib_n_OBUF[50]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[51] ),
        .Q(fib_n_OBUF[51]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[52] ),
        .Q(fib_n_OBUF[52]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[53] ),
        .Q(fib_n_OBUF[53]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[54] ),
        .Q(fib_n_OBUF[54]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[55] ),
        .Q(fib_n_OBUF[55]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[56] ),
        .Q(fib_n_OBUF[56]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[57] ),
        .Q(fib_n_OBUF[57]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[58] ),
        .Q(fib_n_OBUF[58]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[59] ),
        .Q(fib_n_OBUF[59]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[5] ),
        .Q(fib_n_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[60] ),
        .Q(fib_n_OBUF[60]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[61] ),
        .Q(fib_n_OBUF[61]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[62] ),
        .Q(fib_n_OBUF[62]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[63] ),
        .Q(fib_n_OBUF[63]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[6] ),
        .Q(fib_n_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[7] ),
        .Q(fib_n_OBUF[7]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[8] ),
        .Q(fib_n_OBUF[8]));
  FDCE #(
    .INIT(1'b0)) 
    \fib_n_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\fib_n[63]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\current_reg_n_0_[9] ),
        .Q(fib_n_OBUF[9]));
  OBUF finish_OBUF_inst
       (.I(finish_OBUF),
        .O(finish));
  FDCE #(
    .INIT(1'b0)) 
    finish_reg
       (.C(clk_IBUF_BUFG),
        .CE(state),
        .CLR(rst_IBUF),
        .D(\FSM_sequential_state_reg_n_0_[1] ),
        .Q(finish_OBUF));
  IBUF \n_IBUF[0]_inst 
       (.I(n[0]),
        .O(n_IBUF[0]));
  IBUF \n_IBUF[1]_inst 
       (.I(n[1]),
        .O(n_IBUF[1]));
  IBUF \n_IBUF[2]_inst 
       (.I(n[2]),
        .O(n_IBUF[2]));
  IBUF \n_IBUF[3]_inst 
       (.I(n[3]),
        .O(n_IBUF[3]));
  IBUF \n_IBUF[4]_inst 
       (.I(n[4]),
        .O(n_IBUF[4]));
  IBUF \n_IBUF[5]_inst 
       (.I(n[5]),
        .O(n_IBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[0]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[0] ),
        .O(\prev[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[10]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[10] ),
        .O(\prev[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[11]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[11] ),
        .O(\prev[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[12]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[12] ),
        .O(\prev[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[13]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[13] ),
        .O(\prev[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[14]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[14] ),
        .O(\prev[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[15]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[15] ),
        .O(\prev[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[16]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[16] ),
        .O(\prev[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[17]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[17] ),
        .O(\prev[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[18]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[18] ),
        .O(\prev[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[19]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[19] ),
        .O(\prev[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[1]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[1] ),
        .O(\prev[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[20]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[20] ),
        .O(\prev[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[21]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[21] ),
        .O(\prev[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[22]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[22] ),
        .O(\prev[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[23]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[23] ),
        .O(\prev[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[24]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[24] ),
        .O(\prev[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[25]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[25] ),
        .O(\prev[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[26]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[26] ),
        .O(\prev[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[27]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[27] ),
        .O(\prev[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[28]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[28] ),
        .O(\prev[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[29]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[29] ),
        .O(\prev[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[2]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[2] ),
        .O(\prev[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[30]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[30] ),
        .O(\prev[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[31]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[31] ),
        .O(\prev[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[32]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[32] ),
        .O(\prev[32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[33]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[33] ),
        .O(\prev[33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[34]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[34] ),
        .O(\prev[34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[35]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[35] ),
        .O(\prev[35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[36]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[36] ),
        .O(\prev[36]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[37]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[37] ),
        .O(\prev[37]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[38]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[38] ),
        .O(\prev[38]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[39]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[39] ),
        .O(\prev[39]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[3]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[3] ),
        .O(\prev[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[40]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[40] ),
        .O(\prev[40]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[41]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[41] ),
        .O(\prev[41]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[42]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[42] ),
        .O(\prev[42]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[43]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[43] ),
        .O(\prev[43]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[44]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[44] ),
        .O(\prev[44]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[45]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[45] ),
        .O(\prev[45]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[46]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[46] ),
        .O(\prev[46]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[47]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[47] ),
        .O(\prev[47]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[48]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[48] ),
        .O(\prev[48]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[49]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[49] ),
        .O(\prev[49]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[4]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[4] ),
        .O(\prev[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[50]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[50] ),
        .O(\prev[50]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[51]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[51] ),
        .O(\prev[51]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[52]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[52] ),
        .O(\prev[52]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[53]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[53] ),
        .O(\prev[53]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[54]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[54] ),
        .O(\prev[54]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[55]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[55] ),
        .O(\prev[55]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[56]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[56] ),
        .O(\prev[56]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[57]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[57] ),
        .O(\prev[57]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[58]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[58] ),
        .O(\prev[58]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[59]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[59] ),
        .O(\prev[59]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[5]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[5] ),
        .O(\prev[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[60]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[60] ),
        .O(\prev[60]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[61]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[61] ),
        .O(\prev[61]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[62]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[62] ),
        .O(\prev[62]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[63]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[63] ),
        .O(\prev[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[6]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[6] ),
        .O(\prev[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[7]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[7] ),
        .O(\prev[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[8]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[8] ),
        .O(\prev[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \prev[9]_i_1 
       (.I0(state),
        .I1(\current_reg_n_0_[9] ),
        .O(\prev[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[0]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[10]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[11]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[12]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[13]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[14]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[15]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[16]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[16] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[17]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[17] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[18]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[18] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[19]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[19] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[1]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[20]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[20] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[21]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[21] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[22]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[22] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[23]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[23] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[24]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[24] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[25]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[25] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[26]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[26] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[27]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[27] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[28]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[28] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[29]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[29] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[2]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[30]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[30] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[31]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[31] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[32]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[32] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[33]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[33] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[34]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[34] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[35]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[35] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[36]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[36] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[37]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[37] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[38]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[38] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[39]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[39] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[3]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[40]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[40] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[41]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[41] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[42]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[42] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[43]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[43] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[44]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[44] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[45]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[45] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[46]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[46] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[47]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[47] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[48]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[48] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[49]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[49] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[4]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[50]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[50] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[51]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[51] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[52]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[52] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[53]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[53] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[54]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[54] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[55]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[55] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[56]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[56] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[57]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[57] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[58]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[58] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[59]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[59] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[5]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[60]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[60] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[61]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[61] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[62]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[62] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[63]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[63] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[6]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[7]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[8]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \prev_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[5]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\prev[9]_i_1_n_0 ),
        .Q(\prev_reg_n_0_[9] ));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF start_IBUF_inst
       (.I(start),
        .O(start_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
