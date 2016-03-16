//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
//Date        : Tue Dec 22 11:39:24 2015
//Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1
   ();

  wire GND_1;

GND GND
       (.G(GND_1));
design_1_trafficLights_controller_0_0 trafficLights_controller_0
       (.rst(GND_1),
        .tclk(GND_1));
endmodule
