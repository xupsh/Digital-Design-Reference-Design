`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/30 00:06:27
// Design Name: 
// Module Name: binary
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


module binary(
    input pclk,
    input [7:0]threshold,
    input [23:0] rgb_i,
    output binary_o
    );
assign red = rgb_i[23:16];
assign green = rgb_i[15:8];
assign blue = rgb_i[7:0];
wire [7:0]red,green,blue;
wire [7:0]gray;    
assign gray = red*5/16 + green*9/16 + blue*2/16;
assign binary_o = gray>threshold? 0:1;
endmodule
