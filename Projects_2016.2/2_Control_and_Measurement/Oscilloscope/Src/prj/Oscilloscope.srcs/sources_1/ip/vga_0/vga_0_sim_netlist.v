// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Tue Nov 01 08:26:02 2016
// Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/vga_0/vga_0_sim_netlist.v
// Design      : vga_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "vga_0,vga,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "vga,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module vga_0
   (vga_pclk,
    vga_rst,
    vga_hsync,
    vga_vsync,
    vga_valid,
    vga_h_cnt,
    vga_v_cnt);
  input vga_pclk;
  input vga_rst;
  output vga_hsync;
  output vga_vsync;
  output vga_valid;
  output [11:0]vga_h_cnt;
  output [10:0]vga_v_cnt;

  wire \<const0> ;
  wire [9:0]\^vga_h_cnt ;
  wire vga_hsync;
  wire vga_pclk;
  wire vga_rst;
  wire [8:0]\^vga_v_cnt ;
  wire vga_valid;
  wire vga_vsync;

  assign vga_h_cnt[11] = \<const0> ;
  assign vga_h_cnt[10] = \<const0> ;
  assign vga_h_cnt[9:0] = \^vga_h_cnt [9:0];
  assign vga_v_cnt[10] = \<const0> ;
  assign vga_v_cnt[9] = \<const0> ;
  assign vga_v_cnt[8:0] = \^vga_v_cnt [8:0];
  GND GND
       (.G(\<const0> ));
  vga_0_vga inst
       (.vga_h_cnt(\^vga_h_cnt ),
        .vga_hsync(vga_hsync),
        .vga_pclk(vga_pclk),
        .vga_rst(vga_rst),
        .vga_v_cnt(\^vga_v_cnt ),
        .vga_valid(vga_valid),
        .vga_vsync(vga_vsync));
endmodule

(* ORIG_REF_NAME = "vga" *) 
module vga_0_vga
   (vga_hsync,
    vga_vsync,
    vga_h_cnt,
    vga_valid,
    vga_v_cnt,
    vga_pclk,
    vga_rst);
  output vga_hsync;
  output vga_vsync;
  output [9:0]vga_h_cnt;
  output vga_valid;
  output [8:0]vga_v_cnt;
  input vga_pclk;
  input vga_rst;

  wire hsync_i_2_n_0;
  wire line_cnt;
  wire \line_cnt[2]_i_2_n_0 ;
  wire \line_cnt[3]_i_2_n_0 ;
  wire \line_cnt[6]_i_2_n_0 ;
  wire \line_cnt[7]_i_1_n_0 ;
  wire \line_cnt[8]_i_2_n_0 ;
  wire \line_cnt[8]_i_3_n_0 ;
  wire \line_cnt[9]_i_3_n_0 ;
  wire \line_cnt[9]_i_4_n_0 ;
  wire \line_cnt[9]_i_5_n_0 ;
  wire \line_cnt[9]_i_6_n_0 ;
  wire [9:0]line_cnt_reg__0;
  wire [9:0]p_0_in;
  wire p_0_in__0;
  wire \pixel_cnt[0]_i_2_n_0 ;
  wire \pixel_cnt[0]_i_3_n_0 ;
  wire \pixel_cnt[0]_i_4_n_0 ;
  wire \pixel_cnt[0]_i_5_n_0 ;
  wire \pixel_cnt[0]_i_6_n_0 ;
  wire \pixel_cnt[4]_i_2_n_0 ;
  wire \pixel_cnt[4]_i_3_n_0 ;
  wire \pixel_cnt[4]_i_4_n_0 ;
  wire \pixel_cnt[4]_i_5_n_0 ;
  wire \pixel_cnt[8]_i_2_n_0 ;
  wire \pixel_cnt[8]_i_3_n_0 ;
  wire [10:0]pixel_cnt_reg;
  wire \pixel_cnt_reg[0]_i_1_n_0 ;
  wire \pixel_cnt_reg[0]_i_1_n_1 ;
  wire \pixel_cnt_reg[0]_i_1_n_2 ;
  wire \pixel_cnt_reg[0]_i_1_n_3 ;
  wire \pixel_cnt_reg[0]_i_1_n_4 ;
  wire \pixel_cnt_reg[0]_i_1_n_5 ;
  wire \pixel_cnt_reg[0]_i_1_n_6 ;
  wire \pixel_cnt_reg[0]_i_1_n_7 ;
  wire \pixel_cnt_reg[4]_i_1_n_0 ;
  wire \pixel_cnt_reg[4]_i_1_n_1 ;
  wire \pixel_cnt_reg[4]_i_1_n_2 ;
  wire \pixel_cnt_reg[4]_i_1_n_3 ;
  wire \pixel_cnt_reg[4]_i_1_n_4 ;
  wire \pixel_cnt_reg[4]_i_1_n_5 ;
  wire \pixel_cnt_reg[4]_i_1_n_6 ;
  wire \pixel_cnt_reg[4]_i_1_n_7 ;
  wire \pixel_cnt_reg[8]_i_1_n_1 ;
  wire \pixel_cnt_reg[8]_i_1_n_3 ;
  wire \pixel_cnt_reg[8]_i_1_n_6 ;
  wire \pixel_cnt_reg[8]_i_1_n_7 ;
  wire [9:0]vga_h_cnt;
  wire vga_hsync;
  wire vga_pclk;
  wire vga_rst;
  wire [8:0]vga_v_cnt;
  wire vga_valid;
  wire vga_valid_INST_0_i_1_n_0;
  wire vga_vsync;
  wire vsync_i_1_n_0;
  wire vsync_i_2_n_0;
  wire vsync_i_3_n_0;
  wire [3:1]\NLW_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_pixel_cnt_reg[8]_i_1_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hEBBBBBBBBBBBBBBB)) 
    hsync_i_1
       (.I0(hsync_i_2_n_0),
        .I1(pixel_cnt_reg[4]),
        .I2(pixel_cnt_reg[3]),
        .I3(pixel_cnt_reg[2]),
        .I4(pixel_cnt_reg[1]),
        .I5(pixel_cnt_reg[0]),
        .O(p_0_in__0));
  LUT6 #(
    .INIT(64'hFFFBFFFFFFFFFFFF)) 
    hsync_i_2
       (.I0(pixel_cnt_reg[8]),
        .I1(pixel_cnt_reg[5]),
        .I2(pixel_cnt_reg[6]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[9]),
        .I5(pixel_cnt_reg[7]),
        .O(hsync_i_2_n_0));
  FDPE hsync_reg
       (.C(vga_pclk),
        .CE(1'b1),
        .D(p_0_in__0),
        .PRE(vga_rst),
        .Q(vga_hsync));
  LUT6 #(
    .INIT(64'h0000000055555557)) 
    \line_cnt[0]_i_1 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[5]),
        .I3(line_cnt_reg__0[7]),
        .I4(vsync_i_2_n_0),
        .I5(line_cnt_reg__0[0]),
        .O(p_0_in[0]));
  LUT5 #(
    .INIT(32'h005D5D00)) 
    \line_cnt[1]_i_1 
       (.I0(line_cnt_reg__0[9]),
        .I1(vsync_i_3_n_0),
        .I2(vsync_i_2_n_0),
        .I3(line_cnt_reg__0[0]),
        .I4(line_cnt_reg__0[1]),
        .O(p_0_in[1]));
  LUT6 #(
    .INIT(64'h0000000055555557)) 
    \line_cnt[2]_i_1 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[5]),
        .I3(line_cnt_reg__0[7]),
        .I4(vsync_i_2_n_0),
        .I5(\line_cnt[2]_i_2_n_0 ),
        .O(p_0_in[2]));
  LUT3 #(
    .INIT(8'h95)) 
    \line_cnt[2]_i_2 
       (.I0(line_cnt_reg__0[2]),
        .I1(line_cnt_reg__0[0]),
        .I2(line_cnt_reg__0[1]),
        .O(\line_cnt[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000055555557)) 
    \line_cnt[3]_i_1 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[5]),
        .I3(line_cnt_reg__0[7]),
        .I4(vsync_i_2_n_0),
        .I5(\line_cnt[3]_i_2_n_0 ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h9555)) 
    \line_cnt[3]_i_2 
       (.I0(line_cnt_reg__0[3]),
        .I1(line_cnt_reg__0[2]),
        .I2(line_cnt_reg__0[1]),
        .I3(line_cnt_reg__0[0]),
        .O(\line_cnt[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0F070008)) 
    \line_cnt[4]_i_1 
       (.I0(line_cnt_reg__0[1]),
        .I1(line_cnt_reg__0[0]),
        .I2(line_cnt_reg__0[9]),
        .I3(\line_cnt[6]_i_2_n_0 ),
        .I4(line_cnt_reg__0[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h5555000000005557)) 
    \line_cnt[5]_i_1 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[7]),
        .I3(vsync_i_2_n_0),
        .I4(\line_cnt[9]_i_6_n_0 ),
        .I5(line_cnt_reg__0[5]),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'h000055555D550000)) 
    \line_cnt[6]_i_1 
       (.I0(line_cnt_reg__0[9]),
        .I1(vsync_i_3_n_0),
        .I2(line_cnt_reg__0[4]),
        .I3(\line_cnt[6]_i_2_n_0 ),
        .I4(\line_cnt[8]_i_3_n_0 ),
        .I5(line_cnt_reg__0[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \line_cnt[6]_i_2 
       (.I0(line_cnt_reg__0[2]),
        .I1(line_cnt_reg__0[3]),
        .O(\line_cnt[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0078007878780078)) 
    \line_cnt[7]_i_1 
       (.I0(\line_cnt[8]_i_3_n_0 ),
        .I1(line_cnt_reg__0[6]),
        .I2(line_cnt_reg__0[7]),
        .I3(line_cnt_reg__0[9]),
        .I4(vsync_i_3_n_0),
        .I5(vsync_i_2_n_0),
        .O(\line_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5D005D5D005D0000)) 
    \line_cnt[8]_i_1 
       (.I0(line_cnt_reg__0[9]),
        .I1(vsync_i_3_n_0),
        .I2(vsync_i_2_n_0),
        .I3(\line_cnt[8]_i_2_n_0 ),
        .I4(\line_cnt[8]_i_3_n_0 ),
        .I5(line_cnt_reg__0[8]),
        .O(p_0_in[8]));
  LUT2 #(
    .INIT(4'h7)) 
    \line_cnt[8]_i_2 
       (.I0(line_cnt_reg__0[6]),
        .I1(line_cnt_reg__0[7]),
        .O(\line_cnt[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \line_cnt[8]_i_3 
       (.I0(line_cnt_reg__0[5]),
        .I1(line_cnt_reg__0[4]),
        .I2(line_cnt_reg__0[3]),
        .I3(line_cnt_reg__0[2]),
        .I4(line_cnt_reg__0[0]),
        .I5(line_cnt_reg__0[1]),
        .O(\line_cnt[8]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \line_cnt[9]_i_1 
       (.I0(\line_cnt[9]_i_3_n_0 ),
        .I1(\line_cnt[9]_i_4_n_0 ),
        .I2(pixel_cnt_reg[9]),
        .I3(pixel_cnt_reg[8]),
        .O(line_cnt));
  LUT5 #(
    .INIT(32'h222200F0)) 
    \line_cnt[9]_i_2 
       (.I0(vsync_i_3_n_0),
        .I1(vsync_i_2_n_0),
        .I2(\line_cnt[9]_i_5_n_0 ),
        .I3(\line_cnt[9]_i_6_n_0 ),
        .I4(line_cnt_reg__0[9]),
        .O(p_0_in[9]));
  LUT4 #(
    .INIT(16'h0001)) 
    \line_cnt[9]_i_3 
       (.I0(pixel_cnt_reg[10]),
        .I1(pixel_cnt_reg[7]),
        .I2(pixel_cnt_reg[5]),
        .I3(pixel_cnt_reg[6]),
        .O(\line_cnt[9]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \line_cnt[9]_i_4 
       (.I0(pixel_cnt_reg[4]),
        .I1(pixel_cnt_reg[3]),
        .I2(pixel_cnt_reg[2]),
        .I3(pixel_cnt_reg[1]),
        .I4(pixel_cnt_reg[0]),
        .O(\line_cnt[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \line_cnt[9]_i_5 
       (.I0(line_cnt_reg__0[8]),
        .I1(line_cnt_reg__0[7]),
        .I2(line_cnt_reg__0[6]),
        .I3(line_cnt_reg__0[5]),
        .O(\line_cnt[9]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \line_cnt[9]_i_6 
       (.I0(line_cnt_reg__0[1]),
        .I1(line_cnt_reg__0[0]),
        .I2(line_cnt_reg__0[2]),
        .I3(line_cnt_reg__0[3]),
        .I4(line_cnt_reg__0[4]),
        .O(\line_cnt[9]_i_6_n_0 ));
  FDCE \line_cnt_reg[0] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[0]),
        .Q(line_cnt_reg__0[0]));
  FDCE \line_cnt_reg[1] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[1]),
        .Q(line_cnt_reg__0[1]));
  FDCE \line_cnt_reg[2] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[2]),
        .Q(line_cnt_reg__0[2]));
  FDCE \line_cnt_reg[3] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[3]),
        .Q(line_cnt_reg__0[3]));
  FDCE \line_cnt_reg[4] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[4]),
        .Q(line_cnt_reg__0[4]));
  FDCE \line_cnt_reg[5] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[5]),
        .Q(line_cnt_reg__0[5]));
  FDCE \line_cnt_reg[6] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[6]),
        .Q(line_cnt_reg__0[6]));
  FDCE \line_cnt_reg[7] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(\line_cnt[7]_i_1_n_0 ),
        .Q(line_cnt_reg__0[7]));
  FDCE \line_cnt_reg[8] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[8]),
        .Q(line_cnt_reg__0[8]));
  FDCE \line_cnt_reg[9] 
       (.C(vga_pclk),
        .CE(line_cnt),
        .CLR(vga_rst),
        .D(p_0_in[9]),
        .Q(line_cnt_reg__0[9]));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[0]_i_2 
       (.I0(pixel_cnt_reg[0]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[0]_i_3 
       (.I0(pixel_cnt_reg[3]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[0]_i_4 
       (.I0(pixel_cnt_reg[2]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[0]_i_5 
       (.I0(pixel_cnt_reg[1]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0404045504550455)) 
    \pixel_cnt[0]_i_6 
       (.I0(pixel_cnt_reg[0]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[4]_i_2 
       (.I0(pixel_cnt_reg[7]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[4]_i_3 
       (.I0(pixel_cnt_reg[6]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[4]_i_4 
       (.I0(pixel_cnt_reg[5]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h080808AA08AA08AA)) 
    \pixel_cnt[4]_i_5 
       (.I0(pixel_cnt_reg[4]),
        .I1(\line_cnt[9]_i_3_n_0 ),
        .I2(\line_cnt[9]_i_4_n_0 ),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .I5(pixel_cnt_reg[9]),
        .O(\pixel_cnt[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h222F0000)) 
    \pixel_cnt[8]_i_2 
       (.I0(\line_cnt[9]_i_3_n_0 ),
        .I1(\line_cnt[9]_i_4_n_0 ),
        .I2(pixel_cnt_reg[10]),
        .I3(pixel_cnt_reg[8]),
        .I4(pixel_cnt_reg[9]),
        .O(\pixel_cnt[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h22002F00)) 
    \pixel_cnt[8]_i_3 
       (.I0(\line_cnt[9]_i_3_n_0 ),
        .I1(\line_cnt[9]_i_4_n_0 ),
        .I2(pixel_cnt_reg[10]),
        .I3(pixel_cnt_reg[8]),
        .I4(pixel_cnt_reg[9]),
        .O(\pixel_cnt[8]_i_3_n_0 ));
  FDCE \pixel_cnt_reg[0] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[0]_i_1_n_7 ),
        .Q(pixel_cnt_reg[0]));
  CARRY4 \pixel_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\pixel_cnt_reg[0]_i_1_n_0 ,\pixel_cnt_reg[0]_i_1_n_1 ,\pixel_cnt_reg[0]_i_1_n_2 ,\pixel_cnt_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\pixel_cnt[0]_i_2_n_0 }),
        .O({\pixel_cnt_reg[0]_i_1_n_4 ,\pixel_cnt_reg[0]_i_1_n_5 ,\pixel_cnt_reg[0]_i_1_n_6 ,\pixel_cnt_reg[0]_i_1_n_7 }),
        .S({\pixel_cnt[0]_i_3_n_0 ,\pixel_cnt[0]_i_4_n_0 ,\pixel_cnt[0]_i_5_n_0 ,\pixel_cnt[0]_i_6_n_0 }));
  FDCE \pixel_cnt_reg[10] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[8]_i_1_n_1 ),
        .Q(pixel_cnt_reg[10]));
  FDCE \pixel_cnt_reg[1] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[0]_i_1_n_6 ),
        .Q(pixel_cnt_reg[1]));
  FDCE \pixel_cnt_reg[2] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[0]_i_1_n_5 ),
        .Q(pixel_cnt_reg[2]));
  FDCE \pixel_cnt_reg[3] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[0]_i_1_n_4 ),
        .Q(pixel_cnt_reg[3]));
  FDCE \pixel_cnt_reg[4] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[4]_i_1_n_7 ),
        .Q(pixel_cnt_reg[4]));
  CARRY4 \pixel_cnt_reg[4]_i_1 
       (.CI(\pixel_cnt_reg[0]_i_1_n_0 ),
        .CO({\pixel_cnt_reg[4]_i_1_n_0 ,\pixel_cnt_reg[4]_i_1_n_1 ,\pixel_cnt_reg[4]_i_1_n_2 ,\pixel_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pixel_cnt_reg[4]_i_1_n_4 ,\pixel_cnt_reg[4]_i_1_n_5 ,\pixel_cnt_reg[4]_i_1_n_6 ,\pixel_cnt_reg[4]_i_1_n_7 }),
        .S({\pixel_cnt[4]_i_2_n_0 ,\pixel_cnt[4]_i_3_n_0 ,\pixel_cnt[4]_i_4_n_0 ,\pixel_cnt[4]_i_5_n_0 }));
  FDCE \pixel_cnt_reg[5] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[4]_i_1_n_6 ),
        .Q(pixel_cnt_reg[5]));
  FDCE \pixel_cnt_reg[6] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[4]_i_1_n_5 ),
        .Q(pixel_cnt_reg[6]));
  FDCE \pixel_cnt_reg[7] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[4]_i_1_n_4 ),
        .Q(pixel_cnt_reg[7]));
  FDCE \pixel_cnt_reg[8] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[8]_i_1_n_7 ),
        .Q(pixel_cnt_reg[8]));
  CARRY4 \pixel_cnt_reg[8]_i_1 
       (.CI(\pixel_cnt_reg[4]_i_1_n_0 ),
        .CO({\NLW_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED [3],\pixel_cnt_reg[8]_i_1_n_1 ,\NLW_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED [1],\pixel_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_pixel_cnt_reg[8]_i_1_O_UNCONNECTED [3:2],\pixel_cnt_reg[8]_i_1_n_6 ,\pixel_cnt_reg[8]_i_1_n_7 }),
        .S({1'b0,1'b1,\pixel_cnt[8]_i_2_n_0 ,\pixel_cnt[8]_i_3_n_0 }));
  FDCE \pixel_cnt_reg[9] 
       (.C(vga_pclk),
        .CE(1'b1),
        .CLR(vga_rst),
        .D(\pixel_cnt_reg[8]_i_1_n_6 ),
        .Q(pixel_cnt_reg[9]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0022002A)) 
    \vga_h_cnt[0]_INST_0 
       (.I0(pixel_cnt_reg[0]),
        .I1(pixel_cnt_reg[9]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .O(vga_h_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h0022002A)) 
    \vga_h_cnt[1]_INST_0 
       (.I0(pixel_cnt_reg[1]),
        .I1(pixel_cnt_reg[9]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .O(vga_h_cnt[1]));
  LUT5 #(
    .INIT(32'h0022002A)) 
    \vga_h_cnt[2]_INST_0 
       (.I0(pixel_cnt_reg[2]),
        .I1(pixel_cnt_reg[9]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .O(vga_h_cnt[2]));
  LUT5 #(
    .INIT(32'h0022002A)) 
    \vga_h_cnt[3]_INST_0 
       (.I0(pixel_cnt_reg[3]),
        .I1(pixel_cnt_reg[9]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .O(vga_h_cnt[3]));
  LUT5 #(
    .INIT(32'h0022002A)) 
    \vga_h_cnt[4]_INST_0 
       (.I0(pixel_cnt_reg[4]),
        .I1(pixel_cnt_reg[9]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .O(vga_h_cnt[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0022002A)) 
    \vga_h_cnt[5]_INST_0 
       (.I0(pixel_cnt_reg[5]),
        .I1(pixel_cnt_reg[9]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .O(vga_h_cnt[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0022002A)) 
    \vga_h_cnt[6]_INST_0 
       (.I0(pixel_cnt_reg[6]),
        .I1(pixel_cnt_reg[9]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[10]),
        .I4(pixel_cnt_reg[8]),
        .O(vga_h_cnt[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \vga_h_cnt[7]_INST_0 
       (.I0(pixel_cnt_reg[9]),
        .I1(pixel_cnt_reg[7]),
        .I2(pixel_cnt_reg[10]),
        .O(vga_h_cnt[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \vga_h_cnt[8]_INST_0 
       (.I0(pixel_cnt_reg[9]),
        .I1(pixel_cnt_reg[10]),
        .I2(pixel_cnt_reg[8]),
        .O(vga_h_cnt[8]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \vga_h_cnt[9]_INST_0 
       (.I0(pixel_cnt_reg[9]),
        .I1(pixel_cnt_reg[7]),
        .I2(pixel_cnt_reg[10]),
        .I3(pixel_cnt_reg[8]),
        .O(vga_h_cnt[9]));
  LUT6 #(
    .INIT(64'h0222222222222222)) 
    \vga_v_cnt[0]_INST_0 
       (.I0(line_cnt_reg__0[0]),
        .I1(line_cnt_reg__0[9]),
        .I2(line_cnt_reg__0[8]),
        .I3(line_cnt_reg__0[7]),
        .I4(line_cnt_reg__0[6]),
        .I5(line_cnt_reg__0[5]),
        .O(vga_v_cnt[0]));
  LUT6 #(
    .INIT(64'h0222222222222222)) 
    \vga_v_cnt[1]_INST_0 
       (.I0(line_cnt_reg__0[1]),
        .I1(line_cnt_reg__0[9]),
        .I2(line_cnt_reg__0[8]),
        .I3(line_cnt_reg__0[7]),
        .I4(line_cnt_reg__0[6]),
        .I5(line_cnt_reg__0[5]),
        .O(vga_v_cnt[1]));
  LUT6 #(
    .INIT(64'h0222222222222222)) 
    \vga_v_cnt[2]_INST_0 
       (.I0(line_cnt_reg__0[2]),
        .I1(line_cnt_reg__0[9]),
        .I2(line_cnt_reg__0[8]),
        .I3(line_cnt_reg__0[7]),
        .I4(line_cnt_reg__0[6]),
        .I5(line_cnt_reg__0[5]),
        .O(vga_v_cnt[2]));
  LUT6 #(
    .INIT(64'h0222222222222222)) 
    \vga_v_cnt[3]_INST_0 
       (.I0(line_cnt_reg__0[3]),
        .I1(line_cnt_reg__0[9]),
        .I2(line_cnt_reg__0[8]),
        .I3(line_cnt_reg__0[7]),
        .I4(line_cnt_reg__0[6]),
        .I5(line_cnt_reg__0[5]),
        .O(vga_v_cnt[3]));
  LUT6 #(
    .INIT(64'h0222222222222222)) 
    \vga_v_cnt[4]_INST_0 
       (.I0(line_cnt_reg__0[4]),
        .I1(line_cnt_reg__0[9]),
        .I2(line_cnt_reg__0[8]),
        .I3(line_cnt_reg__0[7]),
        .I4(line_cnt_reg__0[6]),
        .I5(line_cnt_reg__0[5]),
        .O(vga_v_cnt[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h15550000)) 
    \vga_v_cnt[5]_INST_0 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[7]),
        .I3(line_cnt_reg__0[6]),
        .I4(line_cnt_reg__0[5]),
        .O(vga_v_cnt[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h15005500)) 
    \vga_v_cnt[6]_INST_0 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[7]),
        .I3(line_cnt_reg__0[6]),
        .I4(line_cnt_reg__0[5]),
        .O(vga_v_cnt[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h10505050)) 
    \vga_v_cnt[7]_INST_0 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[7]),
        .I3(line_cnt_reg__0[6]),
        .I4(line_cnt_reg__0[5]),
        .O(vga_v_cnt[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h04444444)) 
    \vga_v_cnt[8]_INST_0 
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[7]),
        .I3(line_cnt_reg__0[6]),
        .I4(line_cnt_reg__0[5]),
        .O(vga_v_cnt[8]));
  LUT6 #(
    .INIT(64'h0000000015555555)) 
    vga_valid_INST_0
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[8]),
        .I2(line_cnt_reg__0[7]),
        .I3(line_cnt_reg__0[6]),
        .I4(line_cnt_reg__0[5]),
        .I5(vga_valid_INST_0_i_1_n_0),
        .O(vga_valid));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFECC)) 
    vga_valid_INST_0_i_1
       (.I0(pixel_cnt_reg[8]),
        .I1(pixel_cnt_reg[10]),
        .I2(pixel_cnt_reg[7]),
        .I3(pixel_cnt_reg[9]),
        .O(vga_valid_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFD5FFFF)) 
    vsync_i_1
       (.I0(line_cnt_reg__0[9]),
        .I1(line_cnt_reg__0[1]),
        .I2(line_cnt_reg__0[3]),
        .I3(vsync_i_2_n_0),
        .I4(vsync_i_3_n_0),
        .O(vsync_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFFF8)) 
    vsync_i_2
       (.I0(line_cnt_reg__0[3]),
        .I1(line_cnt_reg__0[2]),
        .I2(line_cnt_reg__0[6]),
        .I3(line_cnt_reg__0[4]),
        .O(vsync_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h01)) 
    vsync_i_3
       (.I0(line_cnt_reg__0[7]),
        .I1(line_cnt_reg__0[5]),
        .I2(line_cnt_reg__0[8]),
        .O(vsync_i_3_n_0));
  FDPE vsync_reg
       (.C(vga_pclk),
        .CE(1'b1),
        .D(vsync_i_1_n_0),
        .PRE(vga_rst),
        .Q(vga_vsync));
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
