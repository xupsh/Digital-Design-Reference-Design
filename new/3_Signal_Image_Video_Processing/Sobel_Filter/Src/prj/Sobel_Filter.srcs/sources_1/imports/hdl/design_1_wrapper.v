//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
//Date        : Sun Mar 13 22:32:42 2016
//Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (OV7725_D,
    OV7725_HREF,
    OV7725_PCLK,
    OV7725_SIOC,
    OV7725_SIOD,
    OV7725_VSYNC,
    OV7725_XCLK,
    clk100,
    rst,
    vga_blue,
    vga_green,
    vga_hsync,
    vga_red,
    vga_vsync);
  input [7:0]OV7725_D;
  input OV7725_HREF;
  input OV7725_PCLK;
  output OV7725_SIOC;
  inout OV7725_SIOD;
  input OV7725_VSYNC;
  output OV7725_XCLK;
  input clk100;
  input rst;
  output [3:0]vga_blue;
  output [3:0]vga_green;
  output vga_hsync;
  output [3:0]vga_red;
  output vga_vsync;

  wire [7:0]OV7725_D;
  wire OV7725_HREF;
  wire OV7725_PCLK;
  wire OV7725_SIOC;
  wire OV7725_SIOD;
  wire OV7725_VSYNC;
  wire OV7725_XCLK;
  wire clk100;
  wire rst;
  wire [3:0]vga_blue;
  wire [3:0]vga_green;
  wire vga_hsync;
  wire [3:0]vga_red;
  wire vga_vsync;

design_1 design_1_i
       (.OV7725_D(OV7725_D),
        .OV7725_HREF(OV7725_HREF),
        .OV7725_PCLK(OV7725_PCLK),
        .OV7725_SIOC(OV7725_SIOC),
        .OV7725_SIOD(OV7725_SIOD),
        .OV7725_VSYNC(OV7725_VSYNC),
        .OV7725_XCLK(OV7725_XCLK),
        .clk100(clk100),
        .rst(rst),
        .vga_blue(vga_blue),
        .vga_green(vga_green),
        .vga_hsync(vga_hsync),
        .vga_red(vga_red),
        .vga_vsync(vga_vsync));
endmodule
