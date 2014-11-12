`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:29:45 01/15/2014 
// Design Name: 
// Module Name:    BW 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BW(
input [23:0] RGB24,
input [23:0] RGB_Detect,
output reg Binary_out
);

reg [7:0] R_diff;
reg [7:0] G_diff;
reg [7:0] B_diff;
reg [8:0] diff_sum;

always@(*) begin
	
	//different for each channel
	//Hue
	if(RGB24[23:16] > RGB_Detect[23:16])
		R_diff <= RGB24[23:16] - RGB_Detect[23:16];
	else
		R_diff <= RGB_Detect[23:16] - RGB24[23:16];
	//Saturation
	if(RGB24[15:8] > RGB_Detect[15:8])
		G_diff <= RGB24[15:8] - RGB_Detect[15:8];
	else
		G_diff <= RGB_Detect[15:8] - RGB24[15:8];
	//Value
	if(RGB24[7:0] > RGB_Detect[7:0])
		B_diff <= RGB24[7:0] - RGB_Detect[7:0];
	else
		B_diff <= RGB_Detect[7:0] - RGB24[7:0];
		

        diff_sum <= R_diff/4 + G_diff/4+ B_diff/4;
        
       //  threshold
        if(diff_sum > 34|| R_diff/2 > 15||  G_diff/4 > 15 || B_diff/4 >15)
            Binary_out <= 0;
        else
            Binary_out <= 1;


end

endmodule
