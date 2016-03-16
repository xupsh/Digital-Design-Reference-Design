// file: clock.v
// 
// (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// CLK_OUT1___100.000______0.000______50.0______137.681____105.461
// CLK_OUT2____25.000______0.000______50.0______183.467____105.461
// CLK_OUT3____12.500______0.000______50.0______210.093____105.461
// CLK_OUT4____25.000______0.000______50.0______183.467____105.461
// CLK_OUT5____50.000______0.000______50.0______159.475____105.461
// CLK_OUT6____75.000______0.000______50.0______146.170____105.461
// CLK_OUT7___100.000______0.000______50.0______137.681____105.461
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________100.000____________0.010

`timescale 1ps/1ps

module clock_clk_wiz 
 (// Clock in ports
  input         clk_in1,
  // Clock out ports
  output        clk_out1,
  output        clk_out2,
  output        clk_out3,
  output        clk_out4,
  output        clk_out5,
  output        clk_out6,
  output        clk_out7
 );

  // Input buffering
  //------------------------------------
  IBUF clkin1_ibufg
   (.O (clk_in1_clock),
    .I (clk_in1));



  // Clocking PRIMITIVE
  //------------------------------------
  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused
  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_clock;
  wire        clkfbout_buf_clock;
  wire        clkfboutb_unused;
    wire clkout0b_unused;
   wire clkout1b_unused;
   wire clkout2b_unused;
   wire clkout3b_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (9.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (9.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (36),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKOUT2_DIVIDE       (72),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT2_USE_FINE_PS  ("FALSE"),
    .CLKOUT3_DIVIDE       (36),
    .CLKOUT3_PHASE        (0.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKOUT3_USE_FINE_PS  ("FALSE"),
    .CLKOUT4_DIVIDE       (18),
    .CLKOUT4_PHASE        (0.000),
    .CLKOUT4_DUTY_CYCLE   (0.500),
    .CLKOUT4_USE_FINE_PS  ("FALSE"),
    .CLKOUT5_DIVIDE       (12),
    .CLKOUT5_PHASE        (0.000),
    .CLKOUT5_DUTY_CYCLE   (0.500),
    .CLKOUT5_USE_FINE_PS  ("FALSE"),
    .CLKOUT6_DIVIDE       (9),
    .CLKOUT6_PHASE        (0.000),
    .CLKOUT6_DUTY_CYCLE   (0.500),
    .CLKOUT6_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (10.0))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_clock),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clk_out1_clock),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (clk_out2_clock),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (clk_out3_clock),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clk_out4_clock),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clk_out5_clock),
    .CLKOUT5             (clk_out6_clock),
    .CLKOUT6             (clk_out7_clock),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_clock),
    .CLKIN1              (clk_in1_clock),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (locked_int),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (1'b0));



  // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_clock),
    .I (clkfbout_clock));



  BUFG clkout1_buf
   (.O   (clk_out1),
    .I   (clk_out1_clock));


  BUFG clkout2_buf
   (.O   (clk_out2),
    .I   (clk_out2_clock));

  BUFG clkout3_buf
   (.O   (clk_out3),
    .I   (clk_out3_clock));

  BUFG clkout4_buf
   (.O   (clk_out4),
    .I   (clk_out4_clock));

  BUFG clkout5_buf
   (.O   (clk_out5),
    .I   (clk_out5_clock));

  BUFG clkout6_buf
   (.O   (clk_out6),
    .I   (clk_out6_clock));

  BUFG clkout7_buf
   (.O   (clk_out7),
    .I   (clk_out7_clock));



endmodule
