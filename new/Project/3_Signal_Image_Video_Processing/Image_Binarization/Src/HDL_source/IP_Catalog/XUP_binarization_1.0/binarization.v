`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2015 03:43:33 PM
// Design Name: 
// Module Name: binarization
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


module binarization
#(parameter IMG_WIDTH = 320,
IMG_HEIGHT = 240,
THRESHOLD = 128
)
(
input pclk,
input [11:0] h_cnt,
input [10:0] v_cnt,
input [23:0] rgb, 
output [23:0] binary
);
wire [7:0] red;
wire [7:0] green;
wire [7:0] blue;
wire [7:0] gray;
assign red   =  rgb[23:16];
assign green =  rgb[15:8];
assign blue  =  rgb[7:0];

assign gray = red*5/16 + green*9/16 + blue*2/16;
assign binary =( gray > THRESHOLD)? 24'b11111111_11111111_11111111:24'b0;

endmodule
