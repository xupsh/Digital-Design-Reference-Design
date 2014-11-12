`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:49 01/14/2014 
// Design Name: 
// Module Name:    colorDetect 
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
module colorDetect(
input PClk,
input btn_ColorExtract,
input sw_ColorClear,
input [11:0] VtcHCnt,
input [10:0] VtcVCnt,
input [23:0] RGB24,
output wire [11:0] center_h,
output wire [10:0] center_v,	 
output [23:0] RGB24_dis,
output [7:0]R_detect,G_detect,B_detect
);
	 
// Parameters


	 
wire [7:0] RED;
wire [7:0] GREEN;
wire [7:0] BLUE;

reg [23:0] RGB_detect;
wire [23:0] RGB_render;

assign RED = RGB24[23:16];
assign GREEN = RGB24[15:8];
assign BLUE = RGB24[7:0];

reg [31:0] R_Sum;
reg [31:0] G_Sum;
reg [31:0] B_Sum;
reg [23:0] RGB_out_temp;
//
reg [20:0] Binary_Sum;


assign R_detect = RGB_detect[23:16];
assign G_detect = RGB_detect[15:8];
assign B_detect = RGB_detect[7:0];

//////////////////////////////////////////////// color detect
always@(posedge PClk) begin
	
	// signal output
	if(btn_ColorExtract==1) begin
		RGB_detect <= RGB_out_temp;
		end
	if(sw_ColorClear == 1)begin
	   RGB_detect <= 24'b11111111_11111111_11111111;
		end
	
	if( VtcHCnt >=144 && VtcHCnt <176 && VtcVCnt >=104 && VtcVCnt <136 ) begin  // acumulate
		R_Sum <= R_Sum + RED;
		G_Sum <=G_Sum + GREEN;
		B_Sum <=B_Sum + BLUE;
		end
	else if( VtcVCnt == 1 ) begin // initial
		R_Sum <= 0;
		G_Sum <= 0;
		B_Sum <= 0;
		end
	else if( VtcVCnt == 239 ) begin // result
			RGB_out_temp[23:16] 	<= R_Sum / 1024;
			RGB_out_temp[15:8] 	<= G_Sum / 1024;
			RGB_out_temp[7:0] 	<= B_Sum / 1024;
		end
end

wire Binary;
//
BW RGB2BW(	.RGB24(RGB24),
    .RGB_Detect(RGB_detect),
    .Binary_out(Binary)
);



//
render RGBrender(
	.PClk(PClk),
	.RGB24(RGB24),
	.Binary_in(Binary),
	.VtcHCnt(VtcHCnt),  	// 0-639 来自VideoTimmingCtl的HCNT_O
	.VtcVCnt(VtcVCnt), 	// 0-479	来自VideoTimmingCtl的 VCNT_O
	.center_h(center_h), // 0-639,中点横向坐标
	.center_v(center_v), 	// 0-479,中点纵向坐标
	.RGB_render(RGB_render)
);	 
	
assign RGB24_dis = RGB_render;

//



endmodule
