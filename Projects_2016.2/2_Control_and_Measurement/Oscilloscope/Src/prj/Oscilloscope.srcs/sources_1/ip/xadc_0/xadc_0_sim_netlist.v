// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Tue Nov 01 08:30:05 2016
// Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/xadc_0_sim_netlist.v
// Design      : xadc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xadc_0,xadc,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "xadc,Vivado 2014.4" *) 
(* NotValidForBitStream *)
module xadc_0
   (clk100,
    rst,
    vauxp6,
    vauxn6,
    vauxp7,
    vauxn7,
    vauxp14,
    vauxn14,
    vauxp15,
    vauxn15,
    temperature_out,
    aux_out_6,
    aux_out_7,
    aux_out_14,
    aux_out_15);
  input clk100;
  input rst;
  input vauxp6;
  input vauxn6;
  input vauxp7;
  input vauxn7;
  input vauxp14;
  input vauxn14;
  input vauxp15;
  input vauxn15;
  output [15:0]temperature_out;
  output [15:0]aux_out_6;
  output [15:0]aux_out_7;
  output [15:0]aux_out_14;
  output [15:0]aux_out_15;

  wire [15:0]aux_out_14;
  wire [15:0]aux_out_15;
  wire [15:0]aux_out_6;
  wire [15:0]aux_out_7;
  wire clk100;
  wire rst;
  wire [15:0]temperature_out;
  wire vauxn14;
  wire vauxn15;
  wire vauxn6;
  wire vauxn7;
  wire vauxp14;
  wire vauxp15;
  wire vauxp6;
  wire vauxp7;

  xadc_0_xadc inst
       (.aux_out_14(aux_out_14),
        .aux_out_15(aux_out_15),
        .aux_out_6(aux_out_6),
        .aux_out_7(aux_out_7),
        .clk100(clk100),
        .rst(rst),
        .temperature_out(temperature_out),
        .vauxn14(vauxn14),
        .vauxn15(vauxn15),
        .vauxn6(vauxn6),
        .vauxn7(vauxn7),
        .vauxp14(vauxp14),
        .vauxp15(vauxp15),
        .vauxp6(vauxp6),
        .vauxp7(vauxp7));
endmodule

(* ORIG_REF_NAME = "xadc" *) 
module xadc_0_xadc
   (temperature_out,
    aux_out_6,
    aux_out_7,
    aux_out_14,
    aux_out_15,
    rst,
    clk100,
    vauxp6,
    vauxn6,
    vauxp7,
    vauxn7,
    vauxp14,
    vauxn14,
    vauxp15,
    vauxn15);
  output [15:0]temperature_out;
  output [15:0]aux_out_6;
  output [15:0]aux_out_7;
  output [15:0]aux_out_14;
  output [15:0]aux_out_15;
  input rst;
  input clk100;
  input vauxp6;
  input vauxn6;
  input vauxp7;
  input vauxn7;
  input vauxp14;
  input vauxn14;
  input vauxp15;
  input vauxn15;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[3]_i_1_n_0 ;
  wire \FSM_sequential_state[4]_i_1_n_0 ;
  wire \FSM_sequential_state[4]_i_2_n_0 ;
  wire \FSM_sequential_state[4]_i_3_n_0 ;
  wire \MEASURED_AUX0[15]_i_1_n_0 ;
  wire \MEASURED_AUX1[15]_i_1_n_0 ;
  wire \MEASURED_AUX2[15]_i_1_n_0 ;
  wire \MEASURED_AUX2[15]_i_2_n_0 ;
  wire MEASURED_AUX3;
  wire \MEASURED_AUX3[15]_i_1_n_0 ;
  wire \MEASURED_AUX3[15]_i_2_n_0 ;
  wire \MEASURED_TEMP[15]_i_1_n_0 ;
  wire \MEASURED_TEMP[15]_i_2_n_0 ;
  wire [15:0]aux_out_14;
  wire [15:0]aux_out_15;
  wire [15:0]aux_out_6;
  wire [15:0]aux_out_7;
  wire busy;
  wire clk100;
  wire \daddr[0]_i_1_n_0 ;
  wire \daddr[1]_i_1_n_0 ;
  wire \daddr[2]_i_1_n_0 ;
  wire \daddr[4]_i_1_n_0 ;
  wire \daddr[6]_i_1_n_0 ;
  wire \daddr[6]_i_2_n_0 ;
  wire \daddr_reg_n_0_[0] ;
  wire \daddr_reg_n_0_[1] ;
  wire \daddr_reg_n_0_[2] ;
  wire \daddr_reg_n_0_[4] ;
  wire \daddr_reg_n_0_[6] ;
  wire dclk_bufg;
  wire den_reg;
  wire \den_reg[0]_i_1_n_0 ;
  wire \den_reg[0]_i_2_n_0 ;
  wire \den_reg[0]_i_3_n_0 ;
  wire \den_reg[1]_i_1_n_0 ;
  wire \den_reg[1]_i_3_n_0 ;
  wire \den_reg_reg_n_0_[0] ;
  wire di_drp;
  wire \di_drp_reg_n_0_[0] ;
  wire \di_drp_reg_n_0_[1] ;
  wire \di_drp_reg_n_0_[2] ;
  wire \di_drp_reg_n_0_[3] ;
  wire \di_drp_reg_n_0_[4] ;
  wire \di_drp_reg_n_0_[5] ;
  wire \di_drp_reg_n_0_[6] ;
  wire \di_drp_reg_n_0_[7] ;
  wire \di_drp_reg_n_0_[8] ;
  wire \di_drp_reg_n_0_[9] ;
  wire [15:0]do_drp;
  wire drdy;
  wire dwe_reg;
  wire \dwe_reg[0]_i_1_n_0 ;
  wire \dwe_reg[0]_i_2_n_0 ;
  wire \dwe_reg[1]_i_1_n_0 ;
  wire \dwe_reg_reg_n_0_[0] ;
  wire \dwe_reg_reg_n_0_[1] ;
  wire eos;
  wire p_0_in;
  wire rst;
  (* RTL_KEEP = "yes" *) wire [4:0]state;
  wire [15:0]temperature_out;
  wire vauxn14;
  wire vauxn15;
  wire vauxn6;
  wire vauxn7;
  wire vauxp14;
  wire vauxp15;
  wire vauxp6;
  wire vauxp7;
  wire NLW_u_xadc_alarm_out_UNCONNECTED;
  wire NLW_u_xadc_eoc_out_UNCONNECTED;
  wire NLW_u_xadc_ot_out_UNCONNECTED;
  wire NLW_u_xadc_user_temp_alarm_out_UNCONNECTED;
  wire NLW_u_xadc_vccaux_alarm_out_UNCONNECTED;
  wire NLW_u_xadc_vccint_alarm_out_UNCONNECTED;
  wire [4:0]NLW_u_xadc_channel_out_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0000001100F0F0F5)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[1]),
        .I1(eos),
        .I2(drdy),
        .I3(\FSM_sequential_state[4]_i_3_n_0 ),
        .I4(state[4]),
        .I5(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h030C030C030C33C8)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(eos),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[1]),
        .I4(state[2]),
        .I5(state[3]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h006C)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[4]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000078F0)) 
    \FSM_sequential_state[3]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(state[0]),
        .I4(state[4]),
        .O(\FSM_sequential_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h333033FF33FF33DD)) 
    \FSM_sequential_state[4]_i_1 
       (.I0(busy),
        .I1(state[4]),
        .I2(eos),
        .I3(\FSM_sequential_state[4]_i_3_n_0 ),
        .I4(state[1]),
        .I5(state[0]),
        .O(\FSM_sequential_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000057A0000000)) 
    \FSM_sequential_state[4]_i_2 
       (.I0(state[1]),
        .I1(drdy),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[3]),
        .I5(state[4]),
        .O(\FSM_sequential_state[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_state[4]_i_3 
       (.I0(state[2]),
        .I1(state[3]),
        .O(\FSM_sequential_state[4]_i_3_n_0 ));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(dclk_bufg),
        .CE(\FSM_sequential_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(rst));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(dclk_bufg),
        .CE(\FSM_sequential_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(rst));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(dclk_bufg),
        .CE(\FSM_sequential_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(rst));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_state_reg[3] 
       (.C(dclk_bufg),
        .CE(\FSM_sequential_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_state[3]_i_1_n_0 ),
        .Q(state[3]),
        .R(rst));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_state_reg[4] 
       (.C(dclk_bufg),
        .CE(\FSM_sequential_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_state[4]_i_2_n_0 ),
        .Q(state[4]),
        .R(rst));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \MEASURED_AUX0[15]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(drdy),
        .I4(\MEASURED_TEMP[15]_i_2_n_0 ),
        .I5(rst),
        .O(\MEASURED_AUX0[15]_i_1_n_0 ));
  FDRE \MEASURED_AUX0_reg[0] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[0]),
        .Q(aux_out_14[0]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[10] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[10]),
        .Q(aux_out_14[10]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[11] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[11]),
        .Q(aux_out_14[11]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[12] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[12]),
        .Q(aux_out_14[12]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[13] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[13]),
        .Q(aux_out_14[13]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[14] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[14]),
        .Q(aux_out_14[14]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[15] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[15]),
        .Q(aux_out_14[15]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[1] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[1]),
        .Q(aux_out_14[1]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[2] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[2]),
        .Q(aux_out_14[2]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[3] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[3]),
        .Q(aux_out_14[3]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[4] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[4]),
        .Q(aux_out_14[4]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[5] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[5]),
        .Q(aux_out_14[5]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[6] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[6]),
        .Q(aux_out_14[6]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[7] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[7]),
        .Q(aux_out_14[7]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[8] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[8]),
        .Q(aux_out_14[8]),
        .R(1'b0));
  FDRE \MEASURED_AUX0_reg[9] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX0[15]_i_1_n_0 ),
        .D(do_drp[9]),
        .Q(aux_out_14[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \MEASURED_AUX1[15]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[3]),
        .I3(drdy),
        .I4(\MEASURED_TEMP[15]_i_2_n_0 ),
        .I5(rst),
        .O(\MEASURED_AUX1[15]_i_1_n_0 ));
  FDRE \MEASURED_AUX1_reg[0] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[0]),
        .Q(aux_out_15[0]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[10] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[10]),
        .Q(aux_out_15[10]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[11] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[11]),
        .Q(aux_out_15[11]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[12] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[12]),
        .Q(aux_out_15[12]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[13] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[13]),
        .Q(aux_out_15[13]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[14] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[14]),
        .Q(aux_out_15[14]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[15] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[15]),
        .Q(aux_out_15[15]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[1] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[1]),
        .Q(aux_out_15[1]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[2] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[2]),
        .Q(aux_out_15[2]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[3] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[3]),
        .Q(aux_out_15[3]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[4] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[4]),
        .Q(aux_out_15[4]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[5] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[5]),
        .Q(aux_out_15[5]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[6] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[6]),
        .Q(aux_out_15[6]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[7] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[7]),
        .Q(aux_out_15[7]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[8] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[8]),
        .Q(aux_out_15[8]),
        .R(1'b0));
  FDRE \MEASURED_AUX1_reg[9] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX1[15]_i_1_n_0 ),
        .D(do_drp[9]),
        .Q(aux_out_15[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000020)) 
    \MEASURED_AUX2[15]_i_1 
       (.I0(state[4]),
        .I1(\MEASURED_AUX2[15]_i_2_n_0 ),
        .I2(drdy),
        .I3(state[0]),
        .I4(rst),
        .O(\MEASURED_AUX2[15]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \MEASURED_AUX2[15]_i_2 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .O(\MEASURED_AUX2[15]_i_2_n_0 ));
  FDRE \MEASURED_AUX2_reg[0] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[0]),
        .Q(aux_out_6[0]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[10] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[10]),
        .Q(aux_out_6[10]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[11] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[11]),
        .Q(aux_out_6[11]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[12] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[12]),
        .Q(aux_out_6[12]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[13] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[13]),
        .Q(aux_out_6[13]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[14] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[14]),
        .Q(aux_out_6[14]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[15] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[15]),
        .Q(aux_out_6[15]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[1] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[1]),
        .Q(aux_out_6[1]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[2] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[2]),
        .Q(aux_out_6[2]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[3] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[3]),
        .Q(aux_out_6[3]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[4] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[4]),
        .Q(aux_out_6[4]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[5] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[5]),
        .Q(aux_out_6[5]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[6] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[6]),
        .Q(aux_out_6[6]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[7] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[7]),
        .Q(aux_out_6[7]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[8] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[8]),
        .Q(aux_out_6[8]),
        .R(1'b0));
  FDRE \MEASURED_AUX2_reg[9] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX2[15]_i_1_n_0 ),
        .D(do_drp[9]),
        .Q(aux_out_6[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0080)) 
    \MEASURED_AUX3[15]_i_1 
       (.I0(\MEASURED_AUX3[15]_i_2_n_0 ),
        .I1(drdy),
        .I2(state[1]),
        .I3(rst),
        .O(\MEASURED_AUX3[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \MEASURED_AUX3[15]_i_2 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[3]),
        .I3(state[4]),
        .O(\MEASURED_AUX3[15]_i_2_n_0 ));
  FDRE \MEASURED_AUX3_reg[0] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[0]),
        .Q(aux_out_7[0]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[10] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[10]),
        .Q(aux_out_7[10]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[11] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[11]),
        .Q(aux_out_7[11]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[12] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[12]),
        .Q(aux_out_7[12]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[13] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[13]),
        .Q(aux_out_7[13]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[14] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[14]),
        .Q(aux_out_7[14]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[15] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[15]),
        .Q(aux_out_7[15]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[1] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[1]),
        .Q(aux_out_7[1]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[2] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[2]),
        .Q(aux_out_7[2]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[3] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[3]),
        .Q(aux_out_7[3]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[4] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[4]),
        .Q(aux_out_7[4]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[5] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[5]),
        .Q(aux_out_7[5]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[6] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[6]),
        .Q(aux_out_7[6]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[7] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[7]),
        .Q(aux_out_7[7]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[8] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[8]),
        .Q(aux_out_7[8]),
        .R(1'b0));
  FDRE \MEASURED_AUX3_reg[9] 
       (.C(dclk_bufg),
        .CE(\MEASURED_AUX3[15]_i_1_n_0 ),
        .D(do_drp[9]),
        .Q(aux_out_7[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000002000000)) 
    \MEASURED_TEMP[15]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(drdy),
        .I4(\MEASURED_TEMP[15]_i_2_n_0 ),
        .I5(rst),
        .O(\MEASURED_TEMP[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \MEASURED_TEMP[15]_i_2 
       (.I0(state[0]),
        .I1(state[4]),
        .O(\MEASURED_TEMP[15]_i_2_n_0 ));
  FDRE \MEASURED_TEMP_reg[0] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[0]),
        .Q(temperature_out[0]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[10] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[10]),
        .Q(temperature_out[10]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[11] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[11]),
        .Q(temperature_out[11]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[12] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[12]),
        .Q(temperature_out[12]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[13] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[13]),
        .Q(temperature_out[13]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[14] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[14]),
        .Q(temperature_out[14]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[15] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[15]),
        .Q(temperature_out[15]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[1] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[1]),
        .Q(temperature_out[1]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[2] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[2]),
        .Q(temperature_out[2]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[3] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[3]),
        .Q(temperature_out[3]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[4] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[4]),
        .Q(temperature_out[4]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[5] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[5]),
        .Q(temperature_out[5]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[6] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[6]),
        .Q(temperature_out[6]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[7] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[7]),
        .Q(temperature_out[7]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[8] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[8]),
        .Q(temperature_out[8]),
        .R(1'b0));
  FDRE \MEASURED_TEMP_reg[9] 
       (.C(dclk_bufg),
        .CE(\MEASURED_TEMP[15]_i_1_n_0 ),
        .D(do_drp[9]),
        .Q(temperature_out[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h010C)) 
    \daddr[0]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .O(\daddr[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h3006)) 
    \daddr[1]_i_1 
       (.I0(state[3]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .O(\daddr[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h01AA)) 
    \daddr[2]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .O(\daddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h01A8)) 
    \daddr[4]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .O(\daddr[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF3E03)) 
    \daddr[6]_i_1 
       (.I0(eos),
        .I1(\MEASURED_AUX2[15]_i_2_n_0 ),
        .I2(state[4]),
        .I3(state[0]),
        .I4(MEASURED_AUX3),
        .I5(rst),
        .O(\daddr[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \daddr[6]_i_2 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[3]),
        .I3(state[4]),
        .O(\daddr[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \daddr[6]_i_3 
       (.I0(state[1]),
        .I1(drdy),
        .I2(state[4]),
        .I3(state[3]),
        .I4(state[2]),
        .I5(state[0]),
        .O(MEASURED_AUX3));
  FDRE \daddr_reg[0] 
       (.C(dclk_bufg),
        .CE(\daddr[6]_i_1_n_0 ),
        .D(\daddr[0]_i_1_n_0 ),
        .Q(\daddr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \daddr_reg[1] 
       (.C(dclk_bufg),
        .CE(\daddr[6]_i_1_n_0 ),
        .D(\daddr[1]_i_1_n_0 ),
        .Q(\daddr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \daddr_reg[2] 
       (.C(dclk_bufg),
        .CE(\daddr[6]_i_1_n_0 ),
        .D(\daddr[2]_i_1_n_0 ),
        .Q(\daddr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \daddr_reg[4] 
       (.C(dclk_bufg),
        .CE(\daddr[6]_i_1_n_0 ),
        .D(\daddr[4]_i_1_n_0 ),
        .Q(\daddr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \daddr_reg[6] 
       (.C(dclk_bufg),
        .CE(\daddr[6]_i_1_n_0 ),
        .D(\daddr[6]_i_2_n_0 ),
        .Q(\daddr_reg_n_0_[6] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8F88FFFF8F880000)) 
    \den_reg[0]_i_1 
       (.I0(p_0_in),
        .I1(\den_reg[0]_i_2_n_0 ),
        .I2(\MEASURED_AUX2[15]_i_2_n_0 ),
        .I3(\den_reg[0]_i_3_n_0 ),
        .I4(den_reg),
        .I5(\den_reg_reg_n_0_[0] ),
        .O(\den_reg[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000333E)) 
    \den_reg[0]_i_2 
       (.I0(state[1]),
        .I1(state[4]),
        .I2(state[3]),
        .I3(state[2]),
        .I4(state[0]),
        .O(\den_reg[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \den_reg[0]_i_3 
       (.I0(state[4]),
        .I1(state[0]),
        .I2(eos),
        .I3(p_0_in),
        .O(\den_reg[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \den_reg[1]_i_1 
       (.I0(p_0_in),
        .I1(den_reg),
        .I2(\den_reg[1]_i_3_n_0 ),
        .I3(rst),
        .O(\den_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0003FFFF00055557)) 
    \den_reg[1]_i_2 
       (.I0(drdy),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[4]),
        .I5(state[0]),
        .O(den_reg));
  LUT6 #(
    .INIT(64'h0003FFFE00000003)) 
    \den_reg[1]_i_3 
       (.I0(eos),
        .I1(state[3]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[4]),
        .I5(state[0]),
        .O(\den_reg[1]_i_3_n_0 ));
  FDRE \den_reg_reg[0] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\den_reg[0]_i_1_n_0 ),
        .Q(\den_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE \den_reg_reg[1] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\den_reg[1]_i_1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \di_drp[9]_i_1 
       (.I0(eos),
        .I1(state[0]),
        .I2(state[4]),
        .I3(state[1]),
        .I4(state[2]),
        .I5(state[3]),
        .O(di_drp));
  FDRE \di_drp_reg[0] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[0]),
        .Q(\di_drp_reg_n_0_[0] ),
        .R(rst));
  FDRE \di_drp_reg[1] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[1]),
        .Q(\di_drp_reg_n_0_[1] ),
        .R(rst));
  FDRE \di_drp_reg[2] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[2]),
        .Q(\di_drp_reg_n_0_[2] ),
        .R(rst));
  FDRE \di_drp_reg[3] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[3]),
        .Q(\di_drp_reg_n_0_[3] ),
        .R(rst));
  FDRE \di_drp_reg[4] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[4]),
        .Q(\di_drp_reg_n_0_[4] ),
        .R(rst));
  FDRE \di_drp_reg[5] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[5]),
        .Q(\di_drp_reg_n_0_[5] ),
        .R(rst));
  FDRE \di_drp_reg[6] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[6]),
        .Q(\di_drp_reg_n_0_[6] ),
        .R(rst));
  FDRE \di_drp_reg[7] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[7]),
        .Q(\di_drp_reg_n_0_[7] ),
        .R(rst));
  FDRE \di_drp_reg[8] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[8]),
        .Q(\di_drp_reg_n_0_[8] ),
        .R(rst));
  FDRE \di_drp_reg[9] 
       (.C(dclk_bufg),
        .CE(di_drp),
        .D(do_drp[9]),
        .Q(\di_drp_reg_n_0_[9] ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \dwe_reg[0]_i_1 
       (.I0(\dwe_reg_reg_n_0_[0] ),
        .I1(dwe_reg),
        .I2(\dwe_reg[0]_i_2_n_0 ),
        .I3(rst),
        .O(\dwe_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00004444000CCCCC)) 
    \dwe_reg[0]_i_2 
       (.I0(eos),
        .I1(\dwe_reg_reg_n_0_[1] ),
        .I2(state[2]),
        .I3(state[3]),
        .I4(state[4]),
        .I5(state[0]),
        .O(\dwe_reg[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000022222E22)) 
    \dwe_reg[1]_i_1 
       (.I0(\dwe_reg_reg_n_0_[1] ),
        .I1(dwe_reg),
        .I2(\MEASURED_AUX2[15]_i_2_n_0 ),
        .I3(eos),
        .I4(state[4]),
        .I5(rst),
        .O(\dwe_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000010100035554)) 
    \dwe_reg[1]_i_2 
       (.I0(drdy),
        .I1(state[3]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[4]),
        .O(dwe_reg));
  FDRE \dwe_reg_reg[0] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\dwe_reg[0]_i_1_n_0 ),
        .Q(\dwe_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \dwe_reg_reg[1] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\dwe_reg[1]_i_1_n_0 ),
        .Q(\dwe_reg_reg_n_0_[1] ),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG i_bufg
       (.I(clk100),
        .O(dclk_bufg));
  xadc_0_xadc_wiz_0 u_xadc
       (.alarm_out(NLW_u_xadc_alarm_out_UNCONNECTED),
        .busy_out(busy),
        .channel_out(NLW_u_xadc_channel_out_UNCONNECTED[4:0]),
        .daddr_in({\daddr_reg_n_0_[6] ,1'b0,\daddr_reg_n_0_[4] ,1'b0,\daddr_reg_n_0_[2] ,\daddr_reg_n_0_[1] ,\daddr_reg_n_0_[0] }),
        .dclk_in(dclk_bufg),
        .den_in(\den_reg_reg_n_0_[0] ),
        .di_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\di_drp_reg_n_0_[9] ,\di_drp_reg_n_0_[8] ,\di_drp_reg_n_0_[7] ,\di_drp_reg_n_0_[6] ,\di_drp_reg_n_0_[5] ,\di_drp_reg_n_0_[4] ,\di_drp_reg_n_0_[3] ,\di_drp_reg_n_0_[2] ,\di_drp_reg_n_0_[1] ,\di_drp_reg_n_0_[0] }),
        .do_out(do_drp),
        .drdy_out(drdy),
        .dwe_in(\dwe_reg_reg_n_0_[0] ),
        .eoc_out(NLW_u_xadc_eoc_out_UNCONNECTED),
        .eos_out(eos),
        .ot_out(NLW_u_xadc_ot_out_UNCONNECTED),
        .reset_in(rst),
        .user_temp_alarm_out(NLW_u_xadc_user_temp_alarm_out_UNCONNECTED),
        .vauxn14(vauxn14),
        .vauxn15(vauxn15),
        .vauxn6(vauxn6),
        .vauxn7(vauxn7),
        .vauxp14(vauxp14),
        .vauxp15(vauxp15),
        .vauxp6(vauxp6),
        .vauxp7(vauxp7),
        .vccaux_alarm_out(NLW_u_xadc_vccaux_alarm_out_UNCONNECTED),
        .vccint_alarm_out(NLW_u_xadc_vccint_alarm_out_UNCONNECTED),
        .vn_in(1'b0),
        .vp_in(1'b0));
endmodule

(* ORIG_REF_NAME = "xadc_wiz_0" *) 
module xadc_0_xadc_wiz_0
   (daddr_in,
    dclk_in,
    den_in,
    di_in,
    dwe_in,
    reset_in,
    vauxp6,
    vauxn6,
    vauxp7,
    vauxn7,
    vauxp14,
    vauxn14,
    vauxp15,
    vauxn15,
    busy_out,
    channel_out,
    do_out,
    drdy_out,
    eoc_out,
    eos_out,
    ot_out,
    vccaux_alarm_out,
    vccint_alarm_out,
    user_temp_alarm_out,
    alarm_out,
    vp_in,
    vn_in);
  input [6:0]daddr_in;
  input dclk_in;
  input den_in;
  input [15:0]di_in;
  input dwe_in;
  input reset_in;
  input vauxp6;
  input vauxn6;
  input vauxp7;
  input vauxn7;
  input vauxp14;
  input vauxn14;
  input vauxp15;
  input vauxn15;
  output busy_out;
  output [4:0]channel_out;
  output [15:0]do_out;
  output drdy_out;
  output eoc_out;
  output eos_out;
  output ot_out;
  output vccaux_alarm_out;
  output vccint_alarm_out;
  output user_temp_alarm_out;
  output alarm_out;
  input vp_in;
  input vn_in;

  wire alarm_out;
  wire busy_out;
  wire [4:0]channel_out;
  wire [6:0]daddr_in;
  wire dclk_in;
  wire den_in;
  wire [15:0]di_in;
  wire [15:0]do_out;
  wire drdy_out;
  wire dwe_in;
  wire eoc_out;
  wire eos_out;
  wire ot_out;
  wire reset_in;
  wire user_temp_alarm_out;
  wire vauxn14;
  wire vauxn15;
  wire vauxn6;
  wire vauxn7;
  wire vauxp14;
  wire vauxp15;
  wire vauxp6;
  wire vauxp7;
  wire vccaux_alarm_out;
  wire vccint_alarm_out;
  wire vn_in;
  wire vp_in;
  wire NLW_inst_JTAGBUSY_UNCONNECTED;
  wire NLW_inst_JTAGLOCKED_UNCONNECTED;
  wire NLW_inst_JTAGMODIFIED_UNCONNECTED;
  wire [6:3]NLW_inst_ALM_UNCONNECTED;
  wire [4:0]NLW_inst_MUXADDR_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  XADC #(
    .INIT_40(16'h9000),
    .INIT_41(16'h21F0),
    .INIT_42(16'h0400),
    .INIT_43(16'h0000),
    .INIT_44(16'h0000),
    .INIT_45(16'h0000),
    .INIT_46(16'h0000),
    .INIT_47(16'h0000),
    .INIT_48(16'h4701),
    .INIT_49(16'hC0C0),
    .INIT_4A(16'h0000),
    .INIT_4B(16'h0000),
    .INIT_4C(16'h0000),
    .INIT_4D(16'h0000),
    .INIT_4E(16'h0000),
    .INIT_4F(16'h0000),
    .INIT_50(16'hB5ED),
    .INIT_51(16'h57E4),
    .INIT_52(16'hA147),
    .INIT_53(16'hCA33),
    .INIT_54(16'hA93A),
    .INIT_55(16'h52C6),
    .INIT_56(16'h9555),
    .INIT_57(16'hAE4E),
    .INIT_58(16'h5999),
    .INIT_59(16'h0000),
    .INIT_5A(16'h0000),
    .INIT_5B(16'h0000),
    .INIT_5C(16'h5111),
    .INIT_5D(16'h0000),
    .INIT_5E(16'h0000),
    .INIT_5F(16'h0000),
    .IS_CONVSTCLK_INVERTED(1'b0),
    .IS_DCLK_INVERTED(1'b0),
    .SIM_DEVICE("7SERIES"),
    .SIM_MONITOR_FILE("c:/zhenyul/Xilinx_Proj_Feb/B3_Git/Measurement/Oscilloscope/Oscilloscope.srcs/sources_1/ip/xadc_0/ip/xadc_wiz_0/xadc_wiz_0/simulation/functional/design.txt")) 
    inst
       (.ALM({alarm_out,NLW_inst_ALM_UNCONNECTED[6:3],vccaux_alarm_out,vccint_alarm_out,user_temp_alarm_out}),
        .BUSY(busy_out),
        .CHANNEL(channel_out),
        .CONVST(1'b0),
        .CONVSTCLK(1'b0),
        .DADDR(daddr_in),
        .DCLK(dclk_in),
        .DEN(den_in),
        .DI(di_in),
        .DO(do_out),
        .DRDY(drdy_out),
        .DWE(dwe_in),
        .EOC(eoc_out),
        .EOS(eos_out),
        .JTAGBUSY(NLW_inst_JTAGBUSY_UNCONNECTED),
        .JTAGLOCKED(NLW_inst_JTAGLOCKED_UNCONNECTED),
        .JTAGMODIFIED(NLW_inst_JTAGMODIFIED_UNCONNECTED),
        .MUXADDR(NLW_inst_MUXADDR_UNCONNECTED[4:0]),
        .OT(ot_out),
        .RESET(reset_in),
        .VAUXN({vauxn15,vauxn14,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,vauxn7,vauxn6,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .VAUXP({vauxp15,vauxp14,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,vauxp7,vauxp6,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .VN(vn_in),
        .VP(vp_in));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule
`endif
