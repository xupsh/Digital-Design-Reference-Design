`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/05/23 16:24:31
// Design Name: 
// Module Name: ov7725_top
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


 module ov7725_top(
// main clock
input            clk100,

//BTN and SW
input            btn_Reset,
input            btn_ColorExtract,
input [15:0]     SW,

//OV7725 signals
input            OV7725_VSYNC,
input            OV7725_HREF,
input            OV7725_PCLK,
output           OV7725_XCLK,
output           OV7725_SIOC,
inout            OV7725_SIOD,
input [7:0]      OV7725_D,

//VGA
output [3:0]     vga_red,
output [3:0]     vga_green,
output [3:0]     vga_blue,
output           vga_hsync,
output           vga_vsync,

output [15:0]     LED,
//XADC input. A_VAUXP and A_VAUXN is from  JXADC3,B_VAUXP and B_VAUXN is from  JXADC1
input            A_VAUXP,
input            A_VAUXN,
input            B_VAUXP,
input            B_VAUXN,

//PWM signal for 2 servos
output           pwm_out_x,
output           pwm_out_y
);

wire [16:0]     frame_addr;
wire [16:0]     capture_addr;   
wire            clk25; 
wire            clk50;     

//RGB565 data 
wire [15:0]     frame_pixel;  
wire [15:0]     frame_pixel_vga; 
wire [15:0]     data_16;
  

assign 	OV7725_XCLK = clk25;  

wire [9:0]       Hcnt_signal;
wire [9:0]       Vcnt_signal;

 clock u_clock(
    .clk_in1         (clk100),
    .clk_out1        (clk50),//50MHz
    .clk_out2        (clk25) //25MHz
);

 I2C_AV_Config u_IIC(
    .iCLK            (clk25),    
    .iRST_N          (!btn_Reset),    
    .Config_Done     (),
    .I2C_SDAT        (OV7725_SIOD),    
    .I2C_SCLK        (OV7725_SIOC),
    .LUT_INDEX       (),
    .I2C_RDATA       ()
); 

 ov7725_capture u_capture(
    .pclk            (OV7725_PCLK),
    .vsync           (OV7725_VSYNC),
    .href            (OV7725_HREF),
    .d               (OV7725_D),
    .addr            (capture_addr),
    .dout            (data_16),
    .we              ()
);

 frame_buffer u_frame_buffer(
    .clka            (OV7725_PCLK),
    .wea             (1'b1),
    .addra           (capture_addr),
    .dina            (data_16),
    .clkb            (clk25),
    .addrb           (frame_addr),
    .doutb           (frame_pixel)
 );
 
 wire [23:0]     RGB24_signal;
 wire [23:0]     HSV24_signal;
 wire [23:0]     RGB24_dis_signal;
 assign           RGB24_signal       =   {frame_pixel[15:11],3'b000,frame_pixel[10:5],2'b00,frame_pixel[4:0],3'b000};  
 assign           frame_pixel_vga    =   {RGB24_dis_signal[23:19] , RGB24_dis_signal[15:10], RGB24_dis_signal[7:3]};
 
rgb2hsv_top u_color_conv(
    .pclk           (clk25),
    .Red            (RGB24_signal[23:16]),
    .Green          (RGB24_signal[15:8]),
    .Blue           (RGB24_signal[7:0]),
    .Hue            (HSV24_signal[23:16]),
    .Saturation     (HSV24_signal[15:8]),
    .Value          (HSV24_signal[7:0])
);

//ball's center coordinate
wire[11:0]x_value;
wire[10:0]y_value;
       
wire  Binary_PreProcess;
wire  Binary_PostProcess;
wire Binary_reg;
wire[3:0]weight;      
 wire [8:0]       Hcnt_signal_reg;
wire [8:0]       Vcnt_signal_reg;
colorDetect u_ColorDetect(
    .PClk             (clk25),
    .btn_ColorExtract (btn_ColorExtract),
    .sw_ColorClear    (SW[0]),
    .VtcHCnt          (Hcnt_signal_reg),
    .VtcVCnt          (Vcnt_signal_reg),
    .HSV24            (HSV24_signal),
    .RGB24            (RGB24_signal),
    .center_h         (x_value),
    .center_v         (y_value),
    .RGB24_dis        (RGB24_dis_signal),
    .Binary_PreProcess(Binary_PreProcess),
    .Binary_PostProcess(Binary_PostProcess),
    .weight(weight)
);
 

assign Hcnt_signal_reg = ((Hcnt_signal-160)>=0 && (Hcnt_signal-160) < 320)?(Hcnt_signal-160):0;
assign Vcnt_signal_reg = ((Vcnt_signal-120)>=0 && (Vcnt_signal-120) < 240)?(Vcnt_signal-120):0;
 weight_cal u_weight(
   .PCLK             (clk25),
   .VtcHCnt          (Hcnt_signal_reg),
   .VtcVCnt          (Vcnt_signal_reg),
    .center_h         (x_value),
   .center_v         (y_value),
   .weight          (weight)
);
  erode u_erode(
   .PCLK             (clk25),
   .VtcHCnt          (Hcnt_signal_reg),
   .VtcVCnt          (Vcnt_signal_reg),
   .render_i         (Binary_PreProcess),
   .render_o         (Binary_reg)
   );
   
  dilate u_dilate(
    .PCLK             (clk25),
    .VtcHCnt          (Hcnt_signal_reg),
    .VtcVCnt          (Vcnt_signal_reg),
    .render_i         (Binary_reg),
    .render_o         (Binary_PostProcess)
    );   
 
 
 vga   u_vga(
    .clk25           (clk25),
    .vga_red         (vga_red),
    .vga_green       (vga_green),
    .vga_blue        (vga_blue),
    .vga_hsync       (vga_hsync),
    .vga_vsync       (vga_vsync),
    .HCnt            (Hcnt_signal),
    .VCnt            (Vcnt_signal),
    .frame_addr      (frame_addr),
    .frame_pixel     (frame_pixel_vga)
 );

 wire[10:0] temp_x,temp_y;
 wire lost_x,lost_y;
Motor_Ctrl u_motor(
    .clk_50M         (clk50),
    .Move_EN         (SW[1]),
    .reset           (btn_Reset),
    .A_VAUXP         (A_VAUXP),
    .A_VAUXN         (A_VAUXN),
    .B_VAUXP         (B_VAUXP),
    .B_VAUXN         (B_VAUXN),//A_VAUX is from  JXADC3,B_VAUX is from  JXADC1
    .pwm_x           (pwm_out_x),
    .pwm_y           (pwm_out_y), 
    .x               (x_value),
    .y               (y_value),
    .lost_y(lost_y),
    .lost_coordinate_y(temp_y),
    .lost_x(lost_x),
    .lost_coordinate_x(temp_x),    
    .vsync_in        (OV7725_VSYNC)
);

Ball_LostDetect u_lost(
.x_value(x_value),
.y_value(y_value),
.vsync_in(OV7725_VSYNC),
.lost_x_out(lost_x),
.lost_y_out(lost_y),
.led_lost_coordinate_x(temp_x),
.led_lost_coordinate_y(temp_y)
    );
assign LED[15] = lost_x;
assign LED[14] = lost_y;

endmodule
