`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2015 05:20:37 PM
// Design Name: 
// Module Name: render
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


module render
#(parameter IMG_WIDTH = 320,
IMG_HEIGHT = 240
)
(
input               pclk,
input [23:0]        rgb,
input               Binary_in,
input [11:0]        h_cnt,
input [10:0]        v_cnt,
output reg [23:0]   rgb_render
);
 
reg [23:0]      rgb_render_temp;

always@(posedge pclk) begin
	if(Binary_in==1) begin//labeled by green 
		rgb_render_temp[23:16]   <= 0;
		rgb_render_temp[15:8]    <= 255;
		rgb_render_temp[7:0]     <= 0;
	end
	else begin
		rgb_render_temp[23:16]   <= rgb[23:16];
		rgb_render_temp[15:8]    <= rgb[15:8];
		rgb_render_temp[7:0]     <= rgb[7:0];
	end

	if ((IMG_WIDTH/2-16==h_cnt||IMG_WIDTH/2+16==h_cnt) && v_cnt>=IMG_HEIGHT/2-16&&v_cnt<=IMG_HEIGHT/2+16 //show a yellow rectangle
	||(IMG_HEIGHT/2-16==v_cnt||IMG_HEIGHT/2+16==v_cnt) && h_cnt>=IMG_WIDTH/2-16&&h_cnt<=IMG_WIDTH/2+16  )begin
		rgb_render <= 24'b11111111_11111111_00000000;
	end
	else
		rgb_render <= rgb_render_temp;

end


endmodule

