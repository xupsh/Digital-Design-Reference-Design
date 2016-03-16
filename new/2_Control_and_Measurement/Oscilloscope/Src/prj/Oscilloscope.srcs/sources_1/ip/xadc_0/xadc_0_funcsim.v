// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Mon Feb 09 19:21:57 2015
// Host        : xshxup15 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/zhenyul/Xilinx_Proj_Feb/B3_Git/Measurement/Oscilloscope/Oscilloscope.srcs/sources_1/ip/xadc_0/xadc_0_funcsim.v
// Design      : xadc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "xadc,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "xadc_0,xadc,{}" *) (* CORE_GENERATION_INFO = "xadc_0,xadc,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=XUP,x_ipName=xadc,x_ipVersion=1.0,x_ipCoreRevision=3,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,init_read=00000000,read_waitdrdy=00000001,write_waitdrdy=00000011,read_reg00=00000100,reg00_waitdrdy=00000101,read_reg01=00000110,reg01_waitdrdy=00000111,read_reg02=00001000,reg02_waitdrdy=00001001,read_reg06=00001010,reg06_waitdrdy=00001011,read_reg10=00001100,reg10_waitdrdy=00001101,read_reg11=00001110,reg11_waitdrdy=00001111,read_reg12=00010000,reg12_waitdrdy=00010001,read_reg13=00010010,reg13_waitdrdy=00010011}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
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

xadc_0_xadcHIER inst
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
module xadc_0_xadcHIER
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

  wire [15:0]aux_out_14;
  wire [15:0]aux_out_15;
  wire [15:0]aux_out_6;
  wire [15:0]aux_out_7;
  wire busy;
  wire clk100;
  wire dclk_bufg;
  wire [15:0]do_drp;
  wire drdy;
  wire eos;
  wire \n_0_FSM_sequential_state[0]_i_1 ;
  wire \n_0_FSM_sequential_state[0]_i_2 ;
  wire \n_0_FSM_sequential_state[0]_i_3 ;
  wire \n_0_FSM_sequential_state[1]_i_1 ;
  wire \n_0_FSM_sequential_state[2]_i_1 ;
  wire \n_0_FSM_sequential_state[3]_i_1 ;
  wire \n_0_FSM_sequential_state[4]_i_1 ;
  wire \n_0_FSM_sequential_state[4]_i_2 ;
  wire \n_0_FSM_sequential_state[4]_i_3 ;
(* RTL_KEEP = "yes" *)   wire \n_0_FSM_sequential_state_reg[0] ;
(* RTL_KEEP = "yes" *)   wire \n_0_FSM_sequential_state_reg[1] ;
(* RTL_KEEP = "yes" *)   wire \n_0_FSM_sequential_state_reg[2] ;
(* RTL_KEEP = "yes" *)   wire \n_0_FSM_sequential_state_reg[3] ;
(* RTL_KEEP = "yes" *)   wire \n_0_FSM_sequential_state_reg[4] ;
  wire \n_0_MEASURED_AUX0[15]_i_1 ;
  wire \n_0_MEASURED_AUX1[15]_i_1 ;
  wire \n_0_MEASURED_AUX2[15]_i_1 ;
  wire \n_0_MEASURED_AUX2[15]_i_2 ;
  wire \n_0_MEASURED_AUX3[15]_i_1 ;
  wire \n_0_MEASURED_AUX3[15]_i_2 ;
  wire \n_0_MEASURED_TEMP[15]_i_1 ;
  wire \n_0_MEASURED_TEMP[15]_i_2 ;
  wire \n_0_daddr[0]_i_1 ;
  wire \n_0_daddr[1]_i_1 ;
  wire \n_0_daddr[2]_i_1 ;
  wire \n_0_daddr[4]_i_1 ;
  wire \n_0_daddr[6]_i_1 ;
  wire \n_0_daddr[6]_i_2 ;
  wire \n_0_daddr[6]_i_3 ;
  wire \n_0_daddr[6]_i_4 ;
  wire \n_0_daddr[6]_i_5 ;
  wire \n_0_daddr_reg[0] ;
  wire \n_0_daddr_reg[1] ;
  wire \n_0_daddr_reg[2] ;
  wire \n_0_daddr_reg[4] ;
  wire \n_0_daddr_reg[6] ;
  wire \n_0_den_reg[0]_i_1 ;
  wire \n_0_den_reg[0]_i_2 ;
  wire \n_0_den_reg[0]_i_3 ;
  wire \n_0_den_reg[1]_i_1 ;
  wire \n_0_den_reg[1]_i_2 ;
  wire \n_0_den_reg[1]_i_3 ;
  wire \n_0_den_reg_reg[0] ;
  wire \n_0_den_reg_reg[1] ;
  wire \n_0_di_drp[9]_i_1 ;
  wire \n_0_di_drp_reg[0] ;
  wire \n_0_di_drp_reg[1] ;
  wire \n_0_di_drp_reg[2] ;
  wire \n_0_di_drp_reg[3] ;
  wire \n_0_di_drp_reg[4] ;
  wire \n_0_di_drp_reg[5] ;
  wire \n_0_di_drp_reg[6] ;
  wire \n_0_di_drp_reg[7] ;
  wire \n_0_di_drp_reg[8] ;
  wire \n_0_di_drp_reg[9] ;
  wire \n_0_dwe_reg[0]_i_1 ;
  wire \n_0_dwe_reg[0]_i_2 ;
  wire \n_0_dwe_reg[1]_i_1 ;
  wire \n_0_dwe_reg[1]_i_2 ;
  wire \n_0_dwe_reg[1]_i_3 ;
  wire \n_0_dwe_reg_reg[0] ;
  wire \n_0_dwe_reg_reg[1] ;
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
  wire NLW_u_xadc_alarm_out_UNCONNECTED;
  wire NLW_u_xadc_eoc_out_UNCONNECTED;
  wire NLW_u_xadc_ot_out_UNCONNECTED;
  wire NLW_u_xadc_user_temp_alarm_out_UNCONNECTED;
  wire NLW_u_xadc_vccaux_alarm_out_UNCONNECTED;
  wire NLW_u_xadc_vccint_alarm_out_UNCONNECTED;
  wire [4:0]NLW_u_xadc_channel_out_UNCONNECTED;

LUT6 #(
    .INIT(64'h0000333300F0F3F7)) 
     \FSM_sequential_state[0]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(\n_0_FSM_sequential_state[0]_i_2 ),
        .I2(drdy),
        .I3(\n_0_FSM_sequential_state[0]_i_3 ),
        .I4(\n_0_FSM_sequential_state_reg[4] ),
        .I5(\n_0_FSM_sequential_state_reg[0] ),
        .O(\n_0_FSM_sequential_state[0]_i_1 ));
LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_sequential_state[0]_i_2 
       (.I0(eos),
        .I1(\n_0_FSM_sequential_state_reg[1] ),
        .I2(\n_0_FSM_sequential_state_reg[2] ),
        .I3(\n_0_FSM_sequential_state_reg[3] ),
        .O(\n_0_FSM_sequential_state[0]_i_2 ));
LUT2 #(
    .INIT(4'hE)) 
     \FSM_sequential_state[0]_i_3 
       (.I0(\n_0_FSM_sequential_state_reg[2] ),
        .I1(\n_0_FSM_sequential_state_reg[3] ),
        .O(\n_0_FSM_sequential_state[0]_i_3 ));
LUT6 #(
    .INIT(64'h001F1F00001E1F00)) 
     \FSM_sequential_state[1]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[4] ),
        .I3(\n_0_FSM_sequential_state_reg[1] ),
        .I4(\n_0_FSM_sequential_state_reg[0] ),
        .I5(eos),
        .O(\n_0_FSM_sequential_state[1]_i_1 ));
LUT4 #(
    .INIT(16'h006C)) 
     \FSM_sequential_state[2]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[0] ),
        .I3(\n_0_FSM_sequential_state_reg[4] ),
        .O(\n_0_FSM_sequential_state[2]_i_1 ));
LUT5 #(
    .INIT(32'h14505050)) 
     \FSM_sequential_state[3]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[4] ),
        .I1(\n_0_FSM_sequential_state_reg[0] ),
        .I2(\n_0_FSM_sequential_state_reg[3] ),
        .I3(\n_0_FSM_sequential_state_reg[2] ),
        .I4(\n_0_FSM_sequential_state_reg[1] ),
        .O(\n_0_FSM_sequential_state[3]_i_1 ));
LUT6 #(
    .INIT(64'hDDDCDDDEDDDFDDDE)) 
     \FSM_sequential_state[4]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[4] ),
        .I1(\n_0_FSM_sequential_state[4]_i_3 ),
        .I2(\n_0_FSM_sequential_state_reg[3] ),
        .I3(\n_0_FSM_sequential_state_reg[2] ),
        .I4(\n_0_FSM_sequential_state_reg[0] ),
        .I5(\n_0_FSM_sequential_state_reg[1] ),
        .O(\n_0_FSM_sequential_state[4]_i_1 ));
LUT6 #(
    .INIT(64'h00A0000000005700)) 
     \FSM_sequential_state[4]_i_2 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(drdy),
        .I2(\n_0_FSM_sequential_state_reg[0] ),
        .I3(\n_0_FSM_sequential_state_reg[4] ),
        .I4(\n_0_FSM_sequential_state_reg[2] ),
        .I5(\n_0_FSM_sequential_state_reg[3] ),
        .O(\n_0_FSM_sequential_state[4]_i_2 ));
LUT5 #(
    .INIT(32'h0000F0BB)) 
     \FSM_sequential_state[4]_i_3 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(busy),
        .I2(eos),
        .I3(\n_0_FSM_sequential_state_reg[0] ),
        .I4(\n_0_FSM_sequential_state_reg[4] ),
        .O(\n_0_FSM_sequential_state[4]_i_3 ));
(* KEEP = "yes" *) 
   FDRE \FSM_sequential_state_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_FSM_sequential_state[4]_i_1 ),
        .D(\n_0_FSM_sequential_state[0]_i_1 ),
        .Q(\n_0_FSM_sequential_state_reg[0] ),
        .R(rst));
(* KEEP = "yes" *) 
   FDRE \FSM_sequential_state_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_FSM_sequential_state[4]_i_1 ),
        .D(\n_0_FSM_sequential_state[1]_i_1 ),
        .Q(\n_0_FSM_sequential_state_reg[1] ),
        .R(rst));
(* KEEP = "yes" *) 
   FDRE \FSM_sequential_state_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_FSM_sequential_state[4]_i_1 ),
        .D(\n_0_FSM_sequential_state[2]_i_1 ),
        .Q(\n_0_FSM_sequential_state_reg[2] ),
        .R(rst));
(* KEEP = "yes" *) 
   FDRE \FSM_sequential_state_reg[3] 
       (.C(dclk_bufg),
        .CE(\n_0_FSM_sequential_state[4]_i_1 ),
        .D(\n_0_FSM_sequential_state[3]_i_1 ),
        .Q(\n_0_FSM_sequential_state_reg[3] ),
        .R(rst));
(* KEEP = "yes" *) 
   FDRE \FSM_sequential_state_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_FSM_sequential_state[4]_i_1 ),
        .D(\n_0_FSM_sequential_state[4]_i_2 ),
        .Q(\n_0_FSM_sequential_state_reg[4] ),
        .R(rst));
LUT6 #(
    .INIT(64'h0000000020000000)) 
     \MEASURED_AUX0[15]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[2] ),
        .I1(\n_0_FSM_sequential_state_reg[1] ),
        .I2(\n_0_FSM_sequential_state_reg[3] ),
        .I3(drdy),
        .I4(\n_0_MEASURED_TEMP[15]_i_2 ),
        .I5(rst),
        .O(\n_0_MEASURED_AUX0[15]_i_1 ));
FDRE \MEASURED_AUX0_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[0]),
        .Q(aux_out_14[0]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[10] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[10]),
        .Q(aux_out_14[10]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[11] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[11]),
        .Q(aux_out_14[11]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[12] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[12]),
        .Q(aux_out_14[12]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[13] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[13]),
        .Q(aux_out_14[13]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[14] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[14]),
        .Q(aux_out_14[14]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[15] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[15]),
        .Q(aux_out_14[15]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[1]),
        .Q(aux_out_14[1]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[2]),
        .Q(aux_out_14[2]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[3] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[3]),
        .Q(aux_out_14[3]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[4]),
        .Q(aux_out_14[4]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[5] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[5]),
        .Q(aux_out_14[5]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[6] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[6]),
        .Q(aux_out_14[6]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[7] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[7]),
        .Q(aux_out_14[7]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[8] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[8]),
        .Q(aux_out_14[8]),
        .R(1'b0));
FDRE \MEASURED_AUX0_reg[9] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX0[15]_i_1 ),
        .D(do_drp[9]),
        .Q(aux_out_14[9]),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000080000000)) 
     \MEASURED_AUX1[15]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[3] ),
        .I3(drdy),
        .I4(\n_0_MEASURED_TEMP[15]_i_2 ),
        .I5(rst),
        .O(\n_0_MEASURED_AUX1[15]_i_1 ));
FDRE \MEASURED_AUX1_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[0]),
        .Q(aux_out_15[0]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[10] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[10]),
        .Q(aux_out_15[10]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[11] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[11]),
        .Q(aux_out_15[11]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[12] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[12]),
        .Q(aux_out_15[12]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[13] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[13]),
        .Q(aux_out_15[13]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[14] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[14]),
        .Q(aux_out_15[14]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[15] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[15]),
        .Q(aux_out_15[15]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[1]),
        .Q(aux_out_15[1]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[2]),
        .Q(aux_out_15[2]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[3] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[3]),
        .Q(aux_out_15[3]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[4]),
        .Q(aux_out_15[4]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[5] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[5]),
        .Q(aux_out_15[5]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[6] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[6]),
        .Q(aux_out_15[6]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[7] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[7]),
        .Q(aux_out_15[7]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[8] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[8]),
        .Q(aux_out_15[8]),
        .R(1'b0));
FDRE \MEASURED_AUX1_reg[9] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX1[15]_i_1 ),
        .D(do_drp[9]),
        .Q(aux_out_15[9]),
        .R(1'b0));
LUT4 #(
    .INIT(16'h0008)) 
     \MEASURED_AUX2[15]_i_1 
       (.I0(\n_0_MEASURED_AUX2[15]_i_2 ),
        .I1(drdy),
        .I2(\n_0_FSM_sequential_state_reg[0] ),
        .I3(rst),
        .O(\n_0_MEASURED_AUX2[15]_i_1 ));
LUT4 #(
    .INIT(16'h0004)) 
     \MEASURED_AUX2[15]_i_2 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(\n_0_FSM_sequential_state_reg[4] ),
        .I2(\n_0_FSM_sequential_state_reg[2] ),
        .I3(\n_0_FSM_sequential_state_reg[3] ),
        .O(\n_0_MEASURED_AUX2[15]_i_2 ));
FDRE \MEASURED_AUX2_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[0]),
        .Q(aux_out_6[0]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[10] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[10]),
        .Q(aux_out_6[10]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[11] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[11]),
        .Q(aux_out_6[11]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[12] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[12]),
        .Q(aux_out_6[12]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[13] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[13]),
        .Q(aux_out_6[13]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[14] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[14]),
        .Q(aux_out_6[14]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[15] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[15]),
        .Q(aux_out_6[15]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[1]),
        .Q(aux_out_6[1]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[2]),
        .Q(aux_out_6[2]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[3] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[3]),
        .Q(aux_out_6[3]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[4]),
        .Q(aux_out_6[4]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[5] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[5]),
        .Q(aux_out_6[5]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[6] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[6]),
        .Q(aux_out_6[6]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[7] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[7]),
        .Q(aux_out_6[7]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[8] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[8]),
        .Q(aux_out_6[8]),
        .R(1'b0));
FDRE \MEASURED_AUX2_reg[9] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX2[15]_i_1 ),
        .D(do_drp[9]),
        .Q(aux_out_6[9]),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000004000000)) 
     \MEASURED_AUX3[15]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[0] ),
        .I1(\n_0_FSM_sequential_state_reg[4] ),
        .I2(\n_0_MEASURED_AUX3[15]_i_2 ),
        .I3(drdy),
        .I4(\n_0_FSM_sequential_state_reg[1] ),
        .I5(rst),
        .O(\n_0_MEASURED_AUX3[15]_i_1 ));
LUT2 #(
    .INIT(4'hE)) 
     \MEASURED_AUX3[15]_i_2 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .O(\n_0_MEASURED_AUX3[15]_i_2 ));
FDRE \MEASURED_AUX3_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[0]),
        .Q(aux_out_7[0]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[10] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[10]),
        .Q(aux_out_7[10]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[11] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[11]),
        .Q(aux_out_7[11]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[12] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[12]),
        .Q(aux_out_7[12]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[13] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[13]),
        .Q(aux_out_7[13]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[14] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[14]),
        .Q(aux_out_7[14]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[15] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[15]),
        .Q(aux_out_7[15]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[1]),
        .Q(aux_out_7[1]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[2]),
        .Q(aux_out_7[2]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[3] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[3]),
        .Q(aux_out_7[3]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[4]),
        .Q(aux_out_7[4]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[5] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[5]),
        .Q(aux_out_7[5]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[6] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[6]),
        .Q(aux_out_7[6]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[7] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[7]),
        .Q(aux_out_7[7]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[8] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[8]),
        .Q(aux_out_7[8]),
        .R(1'b0));
FDRE \MEASURED_AUX3_reg[9] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_AUX3[15]_i_1 ),
        .D(do_drp[9]),
        .Q(aux_out_7[9]),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000002000000)) 
     \MEASURED_TEMP[15]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[2] ),
        .I1(\n_0_FSM_sequential_state_reg[1] ),
        .I2(\n_0_FSM_sequential_state_reg[3] ),
        .I3(drdy),
        .I4(\n_0_MEASURED_TEMP[15]_i_2 ),
        .I5(rst),
        .O(\n_0_MEASURED_TEMP[15]_i_1 ));
LUT2 #(
    .INIT(4'h1)) 
     \MEASURED_TEMP[15]_i_2 
       (.I0(\n_0_FSM_sequential_state_reg[0] ),
        .I1(\n_0_FSM_sequential_state_reg[4] ),
        .O(\n_0_MEASURED_TEMP[15]_i_2 ));
FDRE \MEASURED_TEMP_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[0]),
        .Q(temperature_out[0]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[10] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[10]),
        .Q(temperature_out[10]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[11] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[11]),
        .Q(temperature_out[11]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[12] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[12]),
        .Q(temperature_out[12]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[13] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[13]),
        .Q(temperature_out[13]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[14] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[14]),
        .Q(temperature_out[14]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[15] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[15]),
        .Q(temperature_out[15]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[1]),
        .Q(temperature_out[1]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[2]),
        .Q(temperature_out[2]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[3] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[3]),
        .Q(temperature_out[3]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[4]),
        .Q(temperature_out[4]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[5] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[5]),
        .Q(temperature_out[5]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[6] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[6]),
        .Q(temperature_out[6]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[7] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[7]),
        .Q(temperature_out[7]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[8] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[8]),
        .Q(temperature_out[8]),
        .R(1'b0));
FDRE \MEASURED_TEMP_reg[9] 
       (.C(dclk_bufg),
        .CE(\n_0_MEASURED_TEMP[15]_i_1 ),
        .D(do_drp[9]),
        .Q(temperature_out[9]),
        .R(1'b0));
LUT4 #(
    .INIT(16'h001C)) 
     \daddr[0]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[4] ),
        .I3(\n_0_FSM_sequential_state_reg[1] ),
        .O(\n_0_daddr[0]_i_1 ));
LUT4 #(
    .INIT(16'h3006)) 
     \daddr[1]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[4] ),
        .I2(\n_0_FSM_sequential_state_reg[1] ),
        .I3(\n_0_FSM_sequential_state_reg[2] ),
        .O(\n_0_daddr[1]_i_1 ));
LUT4 #(
    .INIT(16'h0A1A)) 
     \daddr[2]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[4] ),
        .I3(\n_0_FSM_sequential_state_reg[1] ),
        .O(\n_0_daddr[2]_i_1 ));
LUT4 #(
    .INIT(16'h0A18)) 
     \daddr[4]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[4] ),
        .I3(\n_0_FSM_sequential_state_reg[1] ),
        .O(\n_0_daddr[4]_i_1 ));
LUT6 #(
    .INIT(64'h00000000FFFFFFF8)) 
     \daddr[6]_i_1 
       (.I0(\n_0_FSM_sequential_state_reg[0] ),
        .I1(\n_0_MEASURED_AUX2[15]_i_2 ),
        .I2(\n_0_daddr[6]_i_3 ),
        .I3(\n_0_daddr[6]_i_4 ),
        .I4(\n_0_daddr[6]_i_5 ),
        .I5(rst),
        .O(\n_0_daddr[6]_i_1 ));
LUT4 #(
    .INIT(16'h0001)) 
     \daddr[6]_i_2 
       (.I0(\n_0_FSM_sequential_state_reg[4] ),
        .I1(\n_0_FSM_sequential_state_reg[1] ),
        .I2(\n_0_FSM_sequential_state_reg[2] ),
        .I3(\n_0_FSM_sequential_state_reg[3] ),
        .O(\n_0_daddr[6]_i_2 ));
LUT5 #(
    .INIT(32'h00000001)) 
     \daddr[6]_i_3 
       (.I0(\n_0_FSM_sequential_state_reg[4] ),
        .I1(\n_0_FSM_sequential_state_reg[0] ),
        .I2(\n_0_FSM_sequential_state_reg[1] ),
        .I3(\n_0_FSM_sequential_state_reg[2] ),
        .I4(\n_0_FSM_sequential_state_reg[3] ),
        .O(\n_0_daddr[6]_i_3 ));
LUT6 #(
    .INIT(64'h0000FFFE00000000)) 
     \daddr[6]_i_4 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[1] ),
        .I3(eos),
        .I4(\n_0_FSM_sequential_state_reg[4] ),
        .I5(\n_0_FSM_sequential_state_reg[0] ),
        .O(\n_0_daddr[6]_i_4 ));
LUT6 #(
    .INIT(64'h0000000000080000)) 
     \daddr[6]_i_5 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(drdy),
        .I2(\n_0_FSM_sequential_state_reg[3] ),
        .I3(\n_0_FSM_sequential_state_reg[2] ),
        .I4(\n_0_FSM_sequential_state_reg[4] ),
        .I5(\n_0_FSM_sequential_state_reg[0] ),
        .O(\n_0_daddr[6]_i_5 ));
FDRE \daddr_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_daddr[6]_i_1 ),
        .D(\n_0_daddr[0]_i_1 ),
        .Q(\n_0_daddr_reg[0] ),
        .R(1'b0));
FDRE \daddr_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_daddr[6]_i_1 ),
        .D(\n_0_daddr[1]_i_1 ),
        .Q(\n_0_daddr_reg[1] ),
        .R(1'b0));
FDRE \daddr_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_daddr[6]_i_1 ),
        .D(\n_0_daddr[2]_i_1 ),
        .Q(\n_0_daddr_reg[2] ),
        .R(1'b0));
FDRE \daddr_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_daddr[6]_i_1 ),
        .D(\n_0_daddr[4]_i_1 ),
        .Q(\n_0_daddr_reg[4] ),
        .R(1'b0));
FDRE \daddr_reg[6] 
       (.C(dclk_bufg),
        .CE(\n_0_daddr[6]_i_1 ),
        .D(\n_0_daddr[6]_i_2 ),
        .Q(\n_0_daddr_reg[6] ),
        .R(1'b0));
LUT6 #(
    .INIT(64'h8F88FFFF8F880000)) 
     \den_reg[0]_i_1 
       (.I0(\n_0_den_reg_reg[1] ),
        .I1(\n_0_den_reg[0]_i_2 ),
        .I2(\n_0_dwe_reg[1]_i_3 ),
        .I3(\n_0_den_reg[0]_i_3 ),
        .I4(\n_0_den_reg[1]_i_2 ),
        .I5(\n_0_den_reg_reg[0] ),
        .O(\n_0_den_reg[0]_i_1 ));
LUT5 #(
    .INIT(32'h000003FE)) 
     \den_reg[0]_i_2 
       (.I0(\n_0_FSM_sequential_state_reg[1] ),
        .I1(\n_0_FSM_sequential_state_reg[3] ),
        .I2(\n_0_FSM_sequential_state_reg[2] ),
        .I3(\n_0_FSM_sequential_state_reg[4] ),
        .I4(\n_0_FSM_sequential_state_reg[0] ),
        .O(\n_0_den_reg[0]_i_2 ));
LUT4 #(
    .INIT(16'h0008)) 
     \den_reg[0]_i_3 
       (.I0(\n_0_den_reg_reg[1] ),
        .I1(\n_0_FSM_sequential_state_reg[0] ),
        .I2(\n_0_FSM_sequential_state_reg[4] ),
        .I3(eos),
        .O(\n_0_den_reg[0]_i_3 ));
LUT4 #(
    .INIT(16'h00E2)) 
     \den_reg[1]_i_1 
       (.I0(\n_0_den_reg_reg[1] ),
        .I1(\n_0_den_reg[1]_i_2 ),
        .I2(\n_0_den_reg[1]_i_3 ),
        .I3(rst),
        .O(\n_0_den_reg[1]_i_1 ));
LUT6 #(
    .INIT(64'h3333333F11111157)) 
     \den_reg[1]_i_2 
       (.I0(drdy),
        .I1(\n_0_FSM_sequential_state_reg[4] ),
        .I2(\n_0_FSM_sequential_state_reg[1] ),
        .I3(\n_0_FSM_sequential_state_reg[2] ),
        .I4(\n_0_FSM_sequential_state_reg[3] ),
        .I5(\n_0_FSM_sequential_state_reg[0] ),
        .O(\n_0_den_reg[1]_i_2 ));
LUT6 #(
    .INIT(64'h00FF03FE00000003)) 
     \den_reg[1]_i_3 
       (.I0(eos),
        .I1(\n_0_FSM_sequential_state_reg[3] ),
        .I2(\n_0_FSM_sequential_state_reg[2] ),
        .I3(\n_0_FSM_sequential_state_reg[4] ),
        .I4(\n_0_FSM_sequential_state_reg[1] ),
        .I5(\n_0_FSM_sequential_state_reg[0] ),
        .O(\n_0_den_reg[1]_i_3 ));
FDRE \den_reg_reg[0] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\n_0_den_reg[0]_i_1 ),
        .Q(\n_0_den_reg_reg[0] ),
        .R(rst));
FDRE \den_reg_reg[1] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\n_0_den_reg[1]_i_1 ),
        .Q(\n_0_den_reg_reg[1] ),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000000000008)) 
     \di_drp[9]_i_1 
       (.I0(eos),
        .I1(\n_0_FSM_sequential_state_reg[0] ),
        .I2(\n_0_FSM_sequential_state_reg[4] ),
        .I3(\n_0_FSM_sequential_state_reg[1] ),
        .I4(\n_0_FSM_sequential_state_reg[2] ),
        .I5(\n_0_FSM_sequential_state_reg[3] ),
        .O(\n_0_di_drp[9]_i_1 ));
FDRE \di_drp_reg[0] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[0]),
        .Q(\n_0_di_drp_reg[0] ),
        .R(rst));
FDRE \di_drp_reg[1] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[1]),
        .Q(\n_0_di_drp_reg[1] ),
        .R(rst));
FDRE \di_drp_reg[2] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[2]),
        .Q(\n_0_di_drp_reg[2] ),
        .R(rst));
FDRE \di_drp_reg[3] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[3]),
        .Q(\n_0_di_drp_reg[3] ),
        .R(rst));
FDRE \di_drp_reg[4] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[4]),
        .Q(\n_0_di_drp_reg[4] ),
        .R(rst));
FDRE \di_drp_reg[5] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[5]),
        .Q(\n_0_di_drp_reg[5] ),
        .R(rst));
FDRE \di_drp_reg[6] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[6]),
        .Q(\n_0_di_drp_reg[6] ),
        .R(rst));
FDRE \di_drp_reg[7] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[7]),
        .Q(\n_0_di_drp_reg[7] ),
        .R(rst));
FDRE \di_drp_reg[8] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[8]),
        .Q(\n_0_di_drp_reg[8] ),
        .R(rst));
FDRE \di_drp_reg[9] 
       (.C(dclk_bufg),
        .CE(\n_0_di_drp[9]_i_1 ),
        .D(do_drp[9]),
        .Q(\n_0_di_drp_reg[9] ),
        .R(rst));
LUT4 #(
    .INIT(16'h00E2)) 
     \dwe_reg[0]_i_1 
       (.I0(\n_0_dwe_reg_reg[0] ),
        .I1(\n_0_dwe_reg[1]_i_2 ),
        .I2(\n_0_dwe_reg[0]_i_2 ),
        .I3(rst),
        .O(\n_0_dwe_reg[0]_i_1 ));
LUT6 #(
    .INIT(64'h00004444000CCCCC)) 
     \dwe_reg[0]_i_2 
       (.I0(eos),
        .I1(\n_0_dwe_reg_reg[1] ),
        .I2(\n_0_FSM_sequential_state_reg[2] ),
        .I3(\n_0_FSM_sequential_state_reg[3] ),
        .I4(\n_0_FSM_sequential_state_reg[4] ),
        .I5(\n_0_FSM_sequential_state_reg[0] ),
        .O(\n_0_dwe_reg[0]_i_2 ));
LUT6 #(
    .INIT(64'h0000000022222E22)) 
     \dwe_reg[1]_i_1 
       (.I0(\n_0_dwe_reg_reg[1] ),
        .I1(\n_0_dwe_reg[1]_i_2 ),
        .I2(\n_0_dwe_reg[1]_i_3 ),
        .I3(eos),
        .I4(\n_0_FSM_sequential_state_reg[4] ),
        .I5(rst),
        .O(\n_0_dwe_reg[1]_i_1 ));
LUT6 #(
    .INIT(64'h0000010100035554)) 
     \dwe_reg[1]_i_2 
       (.I0(drdy),
        .I1(\n_0_FSM_sequential_state_reg[3] ),
        .I2(\n_0_FSM_sequential_state_reg[2] ),
        .I3(\n_0_FSM_sequential_state_reg[1] ),
        .I4(\n_0_FSM_sequential_state_reg[0] ),
        .I5(\n_0_FSM_sequential_state_reg[4] ),
        .O(\n_0_dwe_reg[1]_i_2 ));
LUT3 #(
    .INIT(8'hFE)) 
     \dwe_reg[1]_i_3 
       (.I0(\n_0_FSM_sequential_state_reg[3] ),
        .I1(\n_0_FSM_sequential_state_reg[2] ),
        .I2(\n_0_FSM_sequential_state_reg[1] ),
        .O(\n_0_dwe_reg[1]_i_3 ));
FDRE \dwe_reg_reg[0] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\n_0_dwe_reg[0]_i_1 ),
        .Q(\n_0_dwe_reg_reg[0] ),
        .R(1'b0));
FDRE \dwe_reg_reg[1] 
       (.C(dclk_bufg),
        .CE(1'b1),
        .D(\n_0_dwe_reg[1]_i_1 ),
        .Q(\n_0_dwe_reg_reg[1] ),
        .R(1'b0));
(* BOX_TYPE = "PRIMITIVE" *) 
   BUFG i_bufg
       (.I(clk100),
        .O(dclk_bufg));
(* CORE_GENERATION_INFO = "xadc_wiz_0,xadc_wiz_v3_0,{component_name=xadc_wiz_0,enable_axi=false,enable_axi4stream=false,dclk_frequency=100,enable_busy=true,enable_convst=false,enable_convstclk=false,enable_dclk=true,enable_drp=true,enable_eoc=true,enable_eos=true,enable_vbram_alaram=false,enable_vccddro_alaram=false,enable_Vccint_Alaram=true,enable_Vccaux_alaram=true,enable_vccpaux_alaram=false,enable_vccpint_alaram=false,ot_alaram=true,user_temp_alaram=true,timing_mode=continuous,channel_averaging=16,sequencer_mode=on,startup_channel_selection=contineous_sequence}" *) 
   xadc_0_xadc_wiz_0 u_xadc
       (.alarm_out(NLW_u_xadc_alarm_out_UNCONNECTED),
        .busy_out(busy),
        .channel_out(NLW_u_xadc_channel_out_UNCONNECTED[4:0]),
        .daddr_in({\n_0_daddr_reg[6] ,1'b0,\n_0_daddr_reg[4] ,1'b0,\n_0_daddr_reg[2] ,\n_0_daddr_reg[1] ,\n_0_daddr_reg[0] }),
        .dclk_in(dclk_bufg),
        .den_in(\n_0_den_reg_reg[0] ),
        .di_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\n_0_di_drp_reg[9] ,\n_0_di_drp_reg[8] ,\n_0_di_drp_reg[7] ,\n_0_di_drp_reg[6] ,\n_0_di_drp_reg[5] ,\n_0_di_drp_reg[4] ,\n_0_di_drp_reg[3] ,\n_0_di_drp_reg[2] ,\n_0_di_drp_reg[1] ,\n_0_di_drp_reg[0] }),
        .do_out(do_drp),
        .drdy_out(drdy),
        .dwe_in(\n_0_dwe_reg_reg[0] ),
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

(* CORE_GENERATION_INFO = "xadc_wiz_0,xadc_wiz_v3_0,{component_name=xadc_wiz_0,enable_axi=false,enable_axi4stream=false,dclk_frequency=100,enable_busy=true,enable_convst=false,enable_convstclk=false,enable_dclk=true,enable_drp=true,enable_eoc=true,enable_eos=true,enable_vbram_alaram=false,enable_vccddro_alaram=false,enable_Vccint_Alaram=true,enable_Vccaux_alaram=true,enable_vccpaux_alaram=false,enable_vccpint_alaram=false,ot_alaram=true,user_temp_alaram=true,timing_mode=continuous,channel_averaging=16,sequencer_mode=on,startup_channel_selection=contineous_sequence}" *) (* ORIG_REF_NAME = "xadc_wiz_0" *) 
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
