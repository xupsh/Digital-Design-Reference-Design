// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Tue Nov 01 08:26:02 2016
// Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/vga_0/vga_0_stub.v
// Design      : vga_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vga,Vivado 2016.2" *)
module vga_0(vga_pclk, vga_rst, vga_hsync, vga_vsync, vga_valid, vga_h_cnt, vga_v_cnt)
/* synthesis syn_black_box black_box_pad_pin="vga_pclk,vga_rst,vga_hsync,vga_vsync,vga_valid,vga_h_cnt[11:0],vga_v_cnt[10:0]" */;
  input vga_pclk;
  input vga_rst;
  output vga_hsync;
  output vga_vsync;
  output vga_valid;
  output [11:0]vga_h_cnt;
  output [10:0]vga_v_cnt;
endmodule
