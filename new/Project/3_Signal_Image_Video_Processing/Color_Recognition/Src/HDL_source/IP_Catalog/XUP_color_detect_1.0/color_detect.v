`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2015 04:49:19 PM
// Design Name: 
// Module Name: color_detect
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


module color_detect
#(parameter IMG_WIDTH = 320,
IMG_HEIGHT = 240
)
(
input pclk,
input btn_extract,
input sw_clear,
input [11:0] h_cnt,
input [10:0] v_cnt,
input [23:0] rgb, 
output [23:0] rgb_render
);
wire [7:0] red;
wire [7:0] green;
wire [7:0] blue;


assign red = rgb[23:16];
assign green = rgb[15:8];
assign blue = rgb[7:0];

reg [31:0] r_sum;
reg [31:0] g_sum;
reg [31:0] b_sum;
reg [23:0] rgb_out_temp;
reg [23:0] rgb_detect;
//

////////////// color detect
always@(posedge pclk) begin
	
	// signal output
	if(btn_extract==1) begin
		rgb_detect <= rgb_out_temp;
		end
	if(sw_clear == 1)begin
	    rgb_detect <= 24'b11111111_11111111_11111111;
		end
	
	if( h_cnt >=IMG_WIDTH/2 -16 && h_cnt <IMG_WIDTH/2 + 16 && v_cnt >=IMG_HEIGHT/2-16 && v_cnt <IMG_HEIGHT/2+16 ) begin  // acumulate
		r_sum <= r_sum + red;
		g_sum <= g_sum + green;
		b_sum <= b_sum + blue;
		end
	else if( v_cnt == 1 ) begin // initial
		r_sum <= 0;
		g_sum <= 0;
		b_sum <= 0;
		end
	else if( v_cnt == IMG_HEIGHT-2 ) begin // result
		rgb_out_temp[23:16] <= r_sum / 1024;
		rgb_out_temp[15:8] 	<= g_sum / 1024;
		rgb_out_temp[7:0] 	<= b_sum / 1024;
	end
end

wire render;
//
rgb2bw u_BW(	.rgb(rgb),
    .rgb_detect(rgb_detect),
    .Binary_out(render)
);



//
render  #(
.IMG_WIDTH(IMG_WIDTH),
.IMG_HEIGHT(IMG_HEIGHT)
)RGBrender(
	.pclk(pclk),
	.rgb(rgb),
	.Binary_in(render),
	.h_cnt(h_cnt),  	// 0-639 来自VideoTimmingCtl的HCNT_O
	.v_cnt(v_cnt), 	// 0-479	来自VideoTimmingCtl的 VCNT_O
	.rgb_render(rgb_render)
);	 
	

endmodule

