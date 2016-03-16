//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
//Date        : Sun Mar 13 22:27:58 2016
//Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1
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

  wire IICctrl_0_I2C_SCLK;
  wire [7:0]IICctrl_0_LUT_INDEX;
  wire Net;
  wire [23:0]binarization_0_binary;
  wire [15:0]blk_mem_gen_0_doutb;
  wire [16:0]cam_ov7670_ov7725_0_addr;
  wire [15:0]cam_ov7670_ov7725_0_dout;
  wire cam_ov7670_ov7725_0_wclk;
  wire cam_ov7670_ov7725_0_we;
  wire clk_in1_1;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire [7:0]d_1;
  wire debounce_0_o;
  wire href_1;
  wire i_1;
  wire [15:0]ov7725_regData_0_LUT_DATA;
  wire [7:0]ov7725_regData_0_Slave_Addr;
  wire pclk_1;
  wire [16:0]ram_read_0_address;
  wire [3:0]ram_read_0_vga_blue;
  wire [3:0]ram_read_0_vga_green;
  wire [3:0]ram_read_0_vga_red;
  wire [11:0]region_cut_0_valid_h_cnt;
  wire [10:0]region_cut_0_valid_v_cnt;
  wire [23:0]rgb565_rgb888_0_rgb888;
  wire [15:0]rgb888_rgb565_0_rgb565;
  wire [11:0]vga_0_vga_h_cnt;
  wire vga_0_vga_hsync;
  wire [10:0]vga_0_vga_v_cnt;
  wire vga_0_vga_valid;
  wire vga_0_vga_vsync;
  wire vsync_1;
  wire [0:0]xlconstant_0_dout;

  assign OV7725_SIOC = IICctrl_0_I2C_SCLK;
  assign OV7725_XCLK = clk_wiz_0_clk_out2;
  assign clk_in1_1 = clk100;
  assign d_1 = OV7725_D[7:0];
  assign href_1 = OV7725_HREF;
  assign i_1 = rst;
  assign pclk_1 = OV7725_PCLK;
  assign vga_blue[3:0] = ram_read_0_vga_blue;
  assign vga_green[3:0] = ram_read_0_vga_green;
  assign vga_hsync = vga_0_vga_hsync;
  assign vga_red[3:0] = ram_read_0_vga_red;
  assign vga_vsync = vga_0_vga_vsync;
  assign vsync_1 = OV7725_VSYNC;
design_1_IICctrl_0_0 IICctrl_0
       (.I2C_SCLK(IICctrl_0_I2C_SCLK),
        .I2C_SDAT(OV7725_SIOD),
        .LUT_DATA(ov7725_regData_0_LUT_DATA),
        .LUT_INDEX(IICctrl_0_LUT_INDEX),
        .Slave_Addr(ov7725_regData_0_Slave_Addr),
        .iCLK(clk_wiz_0_clk_out2),
        .rst(debounce_0_o));
design_1_binarization_0_0 binarization_0
       (.binary(binarization_0_binary),
        .h_cnt(region_cut_0_valid_h_cnt),
        .pclk(clk_wiz_0_clk_out2),
        .rgb(rgb565_rgb888_0_rgb888),
        .v_cnt(region_cut_0_valid_v_cnt));
design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(cam_ov7670_ov7725_0_addr),
        .addrb(ram_read_0_address),
        .clka(cam_ov7670_ov7725_0_wclk),
        .clkb(clk_wiz_0_clk_out2),
        .dina(cam_ov7670_ov7725_0_dout),
        .doutb(blk_mem_gen_0_doutb),
        .wea(cam_ov7670_ov7725_0_we));
design_1_cam_ov7670_ov7725_0_0 cam_ov7670_ov7725_0
       (.addr(cam_ov7670_ov7725_0_addr),
        .d(d_1),
        .dout(cam_ov7670_ov7725_0_dout),
        .href(href_1),
        .pclk(pclk_1),
        .vsync(vsync_1),
        .wclk(cam_ov7670_ov7725_0_wclk),
        .we(cam_ov7670_ov7725_0_we));
design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2));
design_1_debounce_0_0 debounce_0
       (.clk(clk_wiz_0_clk_out1),
        .clr(xlconstant_0_dout),
        .i(i_1),
        .o(debounce_0_o));
design_1_ov7725_regData_0_0 ov7725_regData_0
       (.LUT_DATA(ov7725_regData_0_LUT_DATA),
        .LUT_INDEX(IICctrl_0_LUT_INDEX),
        .Slave_Addr(ov7725_regData_0_Slave_Addr));
design_1_ram_read_0_0 ram_read_0
       (.address(ram_read_0_address),
        .clk(clk_wiz_0_clk_out2),
        .din(rgb888_rgb565_0_rgb565),
        .valid(vga_0_vga_valid),
        .vga_blue(ram_read_0_vga_blue),
        .vga_green(ram_read_0_vga_green),
        .vga_h_cnt(vga_0_vga_h_cnt),
        .vga_red(ram_read_0_vga_red),
        .vga_v_cnt(vga_0_vga_v_cnt));
design_1_region_cut_0_0 region_cut_0
       (.valid_h_cnt(region_cut_0_valid_h_cnt),
        .valid_v_cnt(region_cut_0_valid_v_cnt),
        .vga_h_cnt(vga_0_vga_h_cnt),
        .vga_v_cnt(vga_0_vga_v_cnt));
design_1_rgb565_rgb888_0_0 rgb565_rgb888_0
       (.rgb565(blk_mem_gen_0_doutb),
        .rgb888(rgb565_rgb888_0_rgb888));
design_1_rgb888_rgb565_0_0 rgb888_rgb565_0
       (.rgb565(rgb888_rgb565_0_rgb565),
        .rgb888(binarization_0_binary));
design_1_vga_0_0 vga_0
       (.vga_h_cnt(vga_0_vga_h_cnt),
        .vga_hsync(vga_0_vga_hsync),
        .vga_pclk(clk_wiz_0_clk_out2),
        .vga_rst(debounce_0_o),
        .vga_v_cnt(vga_0_vga_v_cnt),
        .vga_valid(vga_0_vga_valid),
        .vga_vsync(vga_0_vga_vsync));
design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
