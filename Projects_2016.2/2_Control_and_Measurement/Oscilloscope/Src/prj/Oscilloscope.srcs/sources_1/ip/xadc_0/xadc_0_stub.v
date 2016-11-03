// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Tue Nov 01 08:30:05 2016
// Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/xadc_0_stub.v
// Design      : xadc_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xadc,Vivado 2014.4" *)
module xadc_0(clk100, rst, vauxp6, vauxn6, vauxp7, vauxn7, vauxp14, vauxn14, vauxp15, vauxn15, temperature_out, aux_out_6, aux_out_7, aux_out_14, aux_out_15)
/* synthesis syn_black_box black_box_pad_pin="clk100,rst,vauxp6,vauxn6,vauxp7,vauxn7,vauxp14,vauxn14,vauxp15,vauxn15,temperature_out[15:0],aux_out_6[15:0],aux_out_7[15:0],aux_out_14[15:0],aux_out_15[15:0]" */;
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
endmodule
