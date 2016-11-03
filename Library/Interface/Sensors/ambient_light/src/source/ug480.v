///////////////////////////////////////////////////////////////////////////////
//    
//    Company:          Xilinx
//    Engineer:         Jim Tatsukawa
//    Date:             2/11/2014
//    Design Name:      ug480
//    Module Name:      ug480.v
//    Version:          2.1
//    Target Devices:   7 Series Family
//    Tool versions:    2014.1
//    Description:      This is a basic demonstration of the XADC 
// 
//    Disclaimer:  XILINX IS PROVIDING THIS DESIGN, CODE, OR
//                 INFORMATION "AS IS" SOLELY FOR USE IN DEVELOPING
//                 PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY
//                 PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
//                 ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
//                 APPLICATION OR STANDARD, XILINX IS MAKING NO
//                 REPRESENTATION THAT THIS IMPLEMENTATION IS FREE
//                 FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE
//                 RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY
//                 REQUIRE FOR YOUR IMPLEMENTATION.  XILINX
//                 EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH
//                 RESPECT TO THE ADEQUACY OF THE IMPLEMENTATION,
//                 INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
//                 REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
//                 FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES
//                 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
//                 PURPOSE.
// 
//                 (c) Copyright 2013-2014 Xilinx, Inc.
//                 All rights reserved.
// 
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
module ug480 (
    input DCLK, // Clock input for DRP
    input RESET,
    input [3:0] VAUXP, VAUXN,  // Auxiliary analog channel inputs
    input VP, VN,// Dedicated and Hardwired Analog Input Pair
    
    output reg [15:0] MEASURED_TEMP, MEASURED_VCCINT, 
    output reg [15:0] MEASURED_VCCAUX, MEASURED_VCCBRAM,
    output reg [15:0] MEASURED_AUX0, MEASURED_AUX1, 
    output reg [15:0] MEASURED_AUX2, MEASURED_AUX3,

    output wire [7:0] ALM,
    output wire [4:0]  CHANNEL,       
    output wire        OT,
    output wire        EOC,
    output wire        EOS
    );     

    wire busy;
    wire [5:0] channel;
    wire drdy;
    wire eoc;
    wire eos;
    wire i2c_sclk_in;
    wire i2c_sclk_ts;
    wire i2c_sda_in;
    wire i2c_sda_ts;
    
    
    reg [6:0] daddr;
    reg [15:0] di_drp;
    wire [15:0] do_drp;
    wire [15:0] vauxp_active;
    wire [15:0] vauxn_active;
    wire dclk_bufg;

    reg [1:0]  den_reg;
    reg [1:0]  dwe_reg;
    
    reg [7:0]   state = init_read;
    parameter       init_read       = 8'h00,
                    read_waitdrdy   = 8'h01,
                    write_waitdrdy  = 8'h03,
                    read_reg00      = 8'h04,
                    reg00_waitdrdy  = 8'h05,
                    read_reg01      = 8'h06,
                    reg01_waitdrdy  = 8'h07,
                    read_reg02      = 8'h08,
                    reg02_waitdrdy  = 8'h09,
                    read_reg06      = 8'h0a,
                    reg06_waitdrdy  = 8'h0b,
                    read_reg10      = 8'h0c,
                    reg10_waitdrdy  = 8'h0d,
                    read_reg11      = 8'h0e,
                    reg11_waitdrdy  = 8'h0f,
                    read_reg12      = 8'h10,
                    reg12_waitdrdy  = 8'h11,
                    read_reg13      = 8'h12,
                    reg13_waitdrdy  = 8'h13;
    
	BUFG i_bufg (.I(DCLK), .O(dclk_bufg));
   always @(posedge dclk_bufg)
      if (RESET) begin
         state   <= init_read;
         den_reg <= 2'h0;
         dwe_reg <= 2'h0;
         di_drp  <= 16'h0000;
      end
      else
         case (state)
         init_read : begin
            daddr <= 7'h40;
            den_reg <= 2'h2; // performing read
            if (busy == 0 ) state <= read_waitdrdy;
            end
         read_waitdrdy : 
            if (eos ==1)  	begin
               di_drp <= do_drp  & 16'h03_FF; //Clearing AVG bits for Configreg0
               daddr <= 7'h40;
               den_reg <= 2'h2;
               dwe_reg <= 2'h2; // performing write
               state <= write_waitdrdy;
            end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;
               state <= state;                
            end
         write_waitdrdy : 
            if (drdy ==1) begin
               state <= read_reg00;
               end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg00 : begin
            daddr   <= 7'h00;
            den_reg <= 2'h2; // performing read
            if (eos == 1) state   <=reg00_waitdrdy;
            end
         reg00_waitdrdy : 
            if (drdy ==1)  	begin
               MEASURED_TEMP <= do_drp; 
               state <=read_reg01;
               end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg01 : begin
            daddr   <= 7'h01;
            den_reg <= 2'h2; // performing read
            state   <=reg01_waitdrdy;
            end
            reg01_waitdrdy : 
           if (drdy ==1)  	begin
               MEASURED_VCCINT = do_drp; 
               state <=read_reg02;
               end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg02 : begin
            daddr   <= 7'h02;
            den_reg <= 2'h2; // performing read
            state   <=reg02_waitdrdy;
            end
         reg02_waitdrdy : 
            if (drdy ==1)  	begin
               MEASURED_VCCAUX <= do_drp; 
               state <=read_reg06;
               end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg06 : begin
            daddr   <= 7'h06;
            den_reg <= 2'h2; // performing read
            state   <=reg06_waitdrdy;
            end
         reg06_waitdrdy : 
            if (drdy ==1)  	begin
               MEASURED_VCCBRAM <= do_drp; 
               state <= read_reg10;
            end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg10 : begin
               daddr   <= 7'h14;
               den_reg <= 2'h2; // performing read
               state   <= reg10_waitdrdy;
            end
         reg10_waitdrdy : 
            if (drdy ==1)  	begin
               MEASURED_AUX0 <= do_drp; 
               state <= read_reg11;
            end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg11 : begin
            daddr   <= 7'h15;
            den_reg <= 2'h2; // performing read
            state   <= reg11_waitdrdy;
            end
         reg11_waitdrdy : 
            if (drdy ==1)  	begin
               MEASURED_AUX1 <= do_drp; 
               state <= read_reg12;
               end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg12 : begin
            daddr   <= 7'h16;
            den_reg <= 2'h2; // performing read
            state   <= reg12_waitdrdy;
            end
         reg12_waitdrdy : 
            if (drdy ==1)  	begin
               MEASURED_AUX2 <= do_drp; 
               state <= read_reg13;
               end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         read_reg13 : begin
            daddr   <= 7'h17;
            den_reg <= 2'h2; // performing read
            state   <= reg13_waitdrdy;
            end
         reg13_waitdrdy :
            if (drdy ==1)  	begin
               MEASURED_AUX3 <= do_drp; 
               state <=read_reg00;
               daddr   <= 7'h00;
            end
            else begin
               den_reg <= { 1'b0, den_reg[1] } ;
               dwe_reg <= { 1'b0, dwe_reg[1] } ;      
               state <= state;          
            end
         default : begin
            daddr <= 7'h40;
            den_reg <= 2'h2; // performing read
            state <= init_read;
            end
         endcase

XADC #(// Initializing the XADC Control Registers
    .INIT_40(16'h9000),// averaging of 16 selected for external channels
    .INIT_41(16'h2ef0),// Continuous Seq Mode, Disable unused ALMs, Enable calibration
    .INIT_42(16'h0400),// Set DCLK divides
    .INIT_48(16'h4701),// CHSEL1 - enable Temp VCCINT, VCCAUX, VCCBRAM, and calibration
    .INIT_49(16'h00f0),// CHSEL2 - enable aux analog channels 0 - 3
    .INIT_4A(16'h0000),// SEQAVG1 disabled
    .INIT_4B(16'h0000),// SEQAVG2 disabled
    .INIT_4C(16'h0000),// SEQINMODE0 
    .INIT_4D(16'h0000),// SEQINMODE1
    .INIT_4E(16'h0000),// SEQACQ0
    .INIT_4F(16'h0000),// SEQACQ1
    .INIT_50(16'hb5ed),// Temp upper alarm trigger 85°C
    .INIT_51(16'h5999),// Vccint upper alarm limit 1.05V
    .INIT_52(16'hA147),// Vccaux upper alarm limit 1.89V
    .INIT_53(16'hdddd),// OT upper alarm limit 125°C - see Thermal Management
    .INIT_54(16'ha93a),// Temp lower alarm reset 60°C
    .INIT_55(16'h5111),// Vccint lower alarm limit 0.95V
    .INIT_56(16'h91Eb),// Vccaux lower alarm limit 1.71V
    .INIT_57(16'hae4e),// OT lower alarm reset 70°C - see Thermal Management
    .INIT_58(16'h5999),// VCCBRAM upper alarm limit 1.05V
    .SIM_MONITOR_FILE("design.txt")// Analog Stimulus file for simulation
)
XADC_INST (// Connect up instance IO. See UG480 for port descriptions
    .CONVST (1'b0),// not used
    .CONVSTCLK  (1'b0), // not used
    .DADDR  (daddr),
    .DCLK   (dclk_bufg),
    .DEN    (den_reg[0]),
    .DI     (di_drp),
    .DWE    (dwe_reg[0]),
    .RESET  (RESET),
    .VAUXN  (vauxn_active ),
    .VAUXP  (vauxp_active ),
    .ALM    (ALM),
    .BUSY   (busy),
    .CHANNEL(CHANNEL),
    .DO     (do_drp),
    .DRDY   (drdy),
    .EOC    (eoc),
    .EOS    (eos),
    .JTAGBUSY   (),// not used
    .JTAGLOCKED (),// not used
    .JTAGMODIFIED   (),// not used
    .OT     (OT),
    .MUXADDR    (),// not used
    .VP     (VP),
    .VN     (VN)
);

    assign vauxp_active = {8'h00, VAUXP[3:0],4'b0000};
    assign vauxn_active = {8'h00, VAUXN[3:0],4'b0000};

    assign EOC = eoc;
    assign EOS = eos;

endmodule