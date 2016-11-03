// (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
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
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:XUP:xadc:1.0
// IP Revision: 3

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
xadc_0 your_instance_name (
  .clk100(clk100),                    // input wire clk100
  .rst(rst),                          // input wire rst
  .vauxp6(vauxp6),                    // input wire vauxp6
  .vauxn6(vauxn6),                    // input wire vauxn6
  .vauxp7(vauxp7),                    // input wire vauxp7
  .vauxn7(vauxn7),                    // input wire vauxn7
  .vauxp14(vauxp14),                  // input wire vauxp14
  .vauxn14(vauxn14),                  // input wire vauxn14
  .vauxp15(vauxp15),                  // input wire vauxp15
  .vauxn15(vauxn15),                  // input wire vauxn15
  .temperature_out(temperature_out),  // output wire [15 : 0] temperature_out
  .aux_out_6(aux_out_6),              // output wire [15 : 0] aux_out_6
  .aux_out_7(aux_out_7),              // output wire [15 : 0] aux_out_7
  .aux_out_14(aux_out_14),            // output wire [15 : 0] aux_out_14
  .aux_out_15(aux_out_15)            // output wire [15 : 0] aux_out_15
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file xadc_0.v when simulating
// the core, xadc_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

