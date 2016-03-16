`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2015 05:14:57 PM
// Design Name: 
// Module Name: rgb2bw
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


module rgb2bw(
input [23:0] rgb,
input [23:0] rgb_detect,
output reg Binary_out
);

reg [7:0] r_diff;
reg [7:0] g_diff;
reg [7:0] b_diff;
reg [8:0] diff_sum;

always@(*) begin
	
	//different for each channel
	//red
	if(rgb[23:16] > rgb_detect[23:16])
		r_diff <= rgb[23:16] - rgb_detect[23:16];
	else
		r_diff <= rgb_detect[23:16] - rgb[23:16];
	//green
	if(rgb[15:8] > rgb_detect[15:8])
		g_diff <= rgb[15:8] - rgb_detect[15:8];
	else
		g_diff <= rgb_detect[15:8] - rgb[15:8];
	//blue
	if(rgb[7:0] > rgb_detect[7:0])
		b_diff <= rgb[7:0] - rgb_detect[7:0];
	else
		b_diff <= rgb_detect[7:0] - rgb[7:0];
		
        diff_sum <= r_diff/4 + g_diff/4 + b_diff/4;
        
       //  threshold
        if(diff_sum > 34|| r_diff/2 > 15 ||  g_diff/4 > 15 || b_diff/4 >15)
            Binary_out <= 0;
        else
            Binary_out <= 1;
end

endmodule

