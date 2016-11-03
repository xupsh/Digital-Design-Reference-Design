//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
//Date        : Fri Oct 28 16:26:54 2016
//Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (UART_rxd,
    UART_txd,
    clk_in1);
  input UART_rxd;
  output UART_txd;
  input clk_in1;

  wire UART_rxd;
  wire UART_txd;
  wire clk_in1;

design_1 design_1_i
       (.UART_rxd(UART_rxd),
        .UART_txd(UART_txd),
        .clk_in1(clk_in1));
endmodule
