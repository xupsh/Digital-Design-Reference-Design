// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Tue Feb 10 21:18:33 2015
// Host        : xshxup15 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/zhenyul/Xilinx_Proj_Feb/B3_Git/Measurement/Oscilloscope/Oscilloscope.srcs/sources_1/ip/debounce_0/debounce_0_funcsim.v
// Design      : debounce_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "debounce,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "debounce_0,debounce,{}" *) (* CORE_GENERATION_INFO = "debounce_0,debounce,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=XUP,x_ipName=debounce,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
(* NotValidForBitStream *)
module debounce_0
   (clk,
    clr,
    i,
    o);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 signal_clock CLK" *) input clk;
  input clr;
  input i;
  output o;

  wire clk;
  wire clr;
  wire i;
  wire o;

debounce_0_debounce inst
       (.clk(clk),
        .clr(clr),
        .i(i),
        .o(o));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_0_debounce
   (o,
    i,
    clr,
    clk);
  output o;
  input i;
  input clr;
  input clk;

  wire cclk;
  wire clear;
  wire clk;
  wire clr;
  wire [5:0]cnt_reg__0;
  wire [0:0]delay1;
  wire [0:0]delay2;
  wire i;
  wire n_0_cclk_i_1;
  wire \n_0_cnt[2]_i_1 ;
  wire \n_0_delay3_reg[0] ;
  wire o;
  wire [5:0]p_0_in;

LUT2 #(
    .INIT(4'h6)) 
     cclk_i_1
       (.I0(clear),
        .I1(cclk),
        .O(n_0_cclk_i_1));
FDRE cclk_reg
       (.C(clk),
        .CE(1'b1),
        .D(n_0_cclk_i_1),
        .Q(cclk),
        .R(1'b0));
LUT1 #(
    .INIT(2'h1)) 
     \cnt[0]_i_1 
       (.I0(cnt_reg__0[0]),
        .O(p_0_in[0]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \cnt[1]_i_1 
       (.I0(cnt_reg__0[0]),
        .I1(cnt_reg__0[1]),
        .O(p_0_in[1]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \cnt[2]_i_1 
       (.I0(cnt_reg__0[0]),
        .I1(cnt_reg__0[1]),
        .I2(cnt_reg__0[2]),
        .O(\n_0_cnt[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \cnt[3]_i_1 
       (.I0(cnt_reg__0[1]),
        .I1(cnt_reg__0[0]),
        .I2(cnt_reg__0[2]),
        .I3(cnt_reg__0[3]),
        .O(p_0_in[3]));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \cnt[4]_i_1 
       (.I0(cnt_reg__0[2]),
        .I1(cnt_reg__0[0]),
        .I2(cnt_reg__0[1]),
        .I3(cnt_reg__0[3]),
        .I4(cnt_reg__0[4]),
        .O(p_0_in[4]));
LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
     \cnt[5]_i_1 
       (.I0(cnt_reg__0[5]),
        .I1(cnt_reg__0[2]),
        .I2(cnt_reg__0[3]),
        .I3(cnt_reg__0[1]),
        .I4(cnt_reg__0[0]),
        .I5(cnt_reg__0[4]),
        .O(clear));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \cnt[5]_i_2 
       (.I0(cnt_reg__0[3]),
        .I1(cnt_reg__0[1]),
        .I2(cnt_reg__0[0]),
        .I3(cnt_reg__0[2]),
        .I4(cnt_reg__0[4]),
        .I5(cnt_reg__0[5]),
        .O(p_0_in[5]));
FDRE \cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(cnt_reg__0[0]),
        .R(clear));
FDRE \cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(cnt_reg__0[1]),
        .R(clear));
FDRE \cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\n_0_cnt[2]_i_1 ),
        .Q(cnt_reg__0[2]),
        .R(clear));
FDRE \cnt_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(cnt_reg__0[3]),
        .R(clear));
FDRE \cnt_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(cnt_reg__0[4]),
        .R(clear));
FDRE \cnt_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(cnt_reg__0[5]),
        .R(clear));
FDCE \delay1_reg[0] 
       (.C(cclk),
        .CE(1'b1),
        .CLR(clr),
        .D(i),
        .Q(delay1));
FDCE \delay2_reg[0] 
       (.C(cclk),
        .CE(1'b1),
        .CLR(clr),
        .D(delay1),
        .Q(delay2));
FDCE \delay3_reg[0] 
       (.C(cclk),
        .CE(1'b1),
        .CLR(clr),
        .D(delay2),
        .Q(\n_0_delay3_reg[0] ));
LUT3 #(
    .INIT(8'h80)) 
     o_INST_0
       (.I0(\n_0_delay3_reg[0] ),
        .I1(delay1),
        .I2(delay2),
        .O(o));
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
