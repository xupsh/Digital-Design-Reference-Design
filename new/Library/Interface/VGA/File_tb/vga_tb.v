`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 03:42:07 PM
// Design Name: 
// Module Name: vga_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_tb;
// Inputs
	reg clk_25;
	reg reset;

	// Outputs
	wire vga_hsync;
    wire vga_vsync;
    wire vga_valid;
    wire[11:0] vga_h_cnt;
    wire[10:0] vga_v_cnt;
	
	
 vga #(
    .HD(640),
    .HF(48), 
    .HA(16), 
    .HB(96), 
    .HT(800), 
    .VD(480),
    .VF(33), 
    .VA(10),
    .VB(2),
    .VT(525)
     ) u_vga
 (
   .vga_pclk(clk_25),
   .vga_rst(reset),
   .vga_hsync(vga_hsync),
   .vga_vsync(vga_vsync),
   .vga_valid(vga_valid),
   .vga_h_cnt(vga_h_cnt),
   .vga_v_cnt(vga_v_cnt)
    );
    
    initial begin
    clk_25 = 0;
    #100 
    reset = 0;
    end
    
 //  forever #1 clk_25 = ~clk_25;
    initial forever #1 clk_25= ~ clk_25;
endmodule
