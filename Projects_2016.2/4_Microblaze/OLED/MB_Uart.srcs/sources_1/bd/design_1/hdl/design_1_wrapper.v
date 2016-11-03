//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
//Date        : Wed Feb 03 14:16:50 2016
//Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk_in1,
    dc_tri_io,
    led1_tri_io,
    led2_tri_io,
    reset_tri_io,
    spi_0_io0_io,
    spi_0_io1_io,
    spi_0_sck_io,
    spi_0_ss_io);
  input clk_in1;
  inout [0:0]dc_tri_io;
  inout [0:0]led1_tri_io;
  inout [0:0]led2_tri_io;
  inout [0:0]reset_tri_io;
  inout spi_0_io0_io;
  inout spi_0_io1_io;
  inout spi_0_sck_io;
  inout [0:0]spi_0_ss_io;

  wire clk_in1;
  wire [0:0]dc_tri_i_0;
  wire [0:0]dc_tri_io_0;
  wire [0:0]dc_tri_o_0;
  wire [0:0]dc_tri_t_0;
  wire [0:0]led1_tri_i_0;
  wire [0:0]led1_tri_io_0;
  wire [0:0]led1_tri_o_0;
  wire [0:0]led1_tri_t_0;
  wire [0:0]led2_tri_i_0;
  wire [0:0]led2_tri_io_0;
  wire [0:0]led2_tri_o_0;
  wire [0:0]led2_tri_t_0;
  wire [0:0]reset_tri_i_0;
  wire [0:0]reset_tri_io_0;
  wire [0:0]reset_tri_o_0;
  wire [0:0]reset_tri_t_0;
  wire spi_0_io0_i;
  wire spi_0_io0_io;
  wire spi_0_io0_o;
  wire spi_0_io0_t;
  wire spi_0_io1_i;
  wire spi_0_io1_io;
  wire spi_0_io1_o;
  wire spi_0_io1_t;
  wire spi_0_sck_i;
  wire spi_0_sck_io;
  wire spi_0_sck_o;
  wire spi_0_sck_t;
  wire [0:0]spi_0_ss_i_0;
  wire [0:0]spi_0_ss_io_0;
  wire [0:0]spi_0_ss_o_0;
  wire spi_0_ss_t;

IOBUF dc_tri_iobuf_0
       (.I(dc_tri_o_0),
        .IO(dc_tri_io[0]),
        .O(dc_tri_i_0),
        .T(dc_tri_t_0));
design_1 design_1_i
       (.DC_tri_i(dc_tri_i_0),
        .DC_tri_o(dc_tri_o_0),
        .DC_tri_t(dc_tri_t_0),
        .LED1_tri_i(led1_tri_i_0),
        .LED1_tri_o(led1_tri_o_0),
        .LED1_tri_t(led1_tri_t_0),
        .LED2_tri_i(led2_tri_i_0),
        .LED2_tri_o(led2_tri_o_0),
        .LED2_tri_t(led2_tri_t_0),
        .SPI_0_io0_i(spi_0_io0_i),
        .SPI_0_io0_o(spi_0_io0_o),
        .SPI_0_io0_t(spi_0_io0_t),
        .SPI_0_io1_i(spi_0_io1_i),
        .SPI_0_io1_o(spi_0_io1_o),
        .SPI_0_io1_t(spi_0_io1_t),
        .SPI_0_sck_i(spi_0_sck_i),
        .SPI_0_sck_o(spi_0_sck_o),
        .SPI_0_sck_t(spi_0_sck_t),
        .SPI_0_ss_i(spi_0_ss_i_0),
        .SPI_0_ss_o(spi_0_ss_o_0),
        .SPI_0_ss_t(spi_0_ss_t),
        .clk_in1(clk_in1),
        .reset_tri_i(reset_tri_i_0),
        .reset_tri_o(reset_tri_o_0),
        .reset_tri_t(reset_tri_t_0));
IOBUF led1_tri_iobuf_0
       (.I(led1_tri_o_0),
        .IO(led1_tri_io[0]),
        .O(led1_tri_i_0),
        .T(led1_tri_t_0));
IOBUF led2_tri_iobuf_0
       (.I(led2_tri_o_0),
        .IO(led2_tri_io[0]),
        .O(led2_tri_i_0),
        .T(led2_tri_t_0));
IOBUF reset_tri_iobuf_0
       (.I(reset_tri_o_0),
        .IO(reset_tri_io[0]),
        .O(reset_tri_i_0),
        .T(reset_tri_t_0));
IOBUF spi_0_io0_iobuf
       (.I(spi_0_io0_o),
        .IO(spi_0_io0_io),
        .O(spi_0_io0_i),
        .T(spi_0_io0_t));
IOBUF spi_0_io1_iobuf
       (.I(spi_0_io1_o),
        .IO(spi_0_io1_io),
        .O(spi_0_io1_i),
        .T(spi_0_io1_t));
IOBUF spi_0_sck_iobuf
       (.I(spi_0_sck_o),
        .IO(spi_0_sck_io),
        .O(spi_0_sck_i),
        .T(spi_0_sck_t));
IOBUF spi_0_ss_iobuf_0
       (.I(spi_0_ss_o_0),
        .IO(spi_0_ss_io[0]),
        .O(spi_0_ss_i_0),
        .T(spi_0_ss_t));
endmodule
