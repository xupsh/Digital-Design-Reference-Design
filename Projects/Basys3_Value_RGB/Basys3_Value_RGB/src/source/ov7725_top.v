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
output[15:0]     LED,
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
output           vga_vsync


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
 wire [9:0]       Hcnt_signal;
 wire [9:0]       Vcnt_signal;
 wire [23:0]     RGB24_signal;
 wire [23:0]     RGB24_dis_signal;
 assign           RGB24_signal       =   {frame_pixel[15:11],3'b000,frame_pixel[10:5],2'b00,frame_pixel[4:0],3'b000};  
 assign           frame_pixel_vga    =   {RGB24_dis_signal[23:19] , RGB24_dis_signal[15:10], RGB24_dis_signal[7:3]};
 



 wire [8:0]       Hcnt_signal_reg;
wire [8:0]       Vcnt_signal_reg;
wire [7:0]R_detect,G_detect,B_detect;

colorDetect u_ColorDetect(
    .PClk             (clk25),
    .btn_ColorExtract (btn_ColorExtract),
    .sw_ColorClear    (SW[0]),
    .VtcHCnt          (Hcnt_signal_reg),
    .VtcVCnt          (Vcnt_signal_reg),
    .RGB24            (RGB24_signal),
    .center_h         (),
    .center_v         (),
    .RGB24_dis        (RGB24_dis_signal),
    .R_detect(R_detect),
    .G_detect(G_detect),
    .B_detect(B_detect)
);
 

assign Hcnt_signal_reg = ((Hcnt_signal-160)>=0 && (Hcnt_signal-160) < 320)?(Hcnt_signal-160):0;
assign Vcnt_signal_reg = ((Vcnt_signal-120)>=0 && (Vcnt_signal-120) < 240)?(Vcnt_signal-120):0;


wire[3:0] addr_char_R_h;
wire[3:0] addr_char_R_d;
wire[3:0] addr_char_R_u;

wire[3:0] addr_char_G_h;
wire[3:0] addr_char_G_d;
wire[3:0] addr_char_G_u;

wire[3:0] addr_char_B_h;
wire[3:0] addr_char_B_d;
wire[3:0] addr_char_B_u;

assign LED =16'b0;

wire[3:0]addr_char_R,addr_char_G,addr_char_B;
wire[0:15]Char_R,Char_G,Char_B;

wire[3:0]addr_char_R_h,addr_char_R_d,addr_char_R_u;
wire[3:0]addr_char_G_h,addr_char_G_d,addr_char_G_u;
wire[3:0]addr_char_B_h,addr_char_B_d,addr_char_B_u;
wire[0:15]Char_R_h,Char_R_d,Char_R_u;
wire[0:15]Char_G_h,Char_G_d,Char_G_u;
wire[0:15]Char_B_h,Char_B_d,Char_B_u;

prom_control u_prom(
    .R_detect(R_detect),
    .G_detect(G_detect),
    .B_detect(B_detect),
    
    .addr_char_R(addr_char_R),
    .addr_char_G(addr_char_G),
    .addr_char_B(addr_char_B),
    .Char_R(Char_R),
    .Char_G(Char_G),
    .Char_B(Char_B),
    .addr_R_h(addr_char_R_h),
    .addr_R_d(addr_char_R_d),
    .addr_R_u(addr_char_R_u),
    .addr_G_h(addr_char_G_h),
    .addr_G_d(addr_char_G_d),
    .addr_G_u(addr_char_G_u),
    .addr_B_h(addr_char_B_h),
    .addr_B_d(addr_char_B_d),
    .addr_B_u(addr_char_B_u),
    
    .Char_R_h(Char_R_h),
    .Char_R_d(Char_R_d),
    .Char_R_u(Char_R_u),
    .Char_G_h(Char_G_h),
    .Char_G_d(Char_G_d),
    .Char_G_u(Char_G_u),
    .Char_B_h(Char_B_h),
    .Char_B_d(Char_B_d),
    .Char_B_u(Char_B_u)
     );
 vga   u_vga(
    .clk25           (clk25),
    .vga_red         (vga_red),
    .vga_green       (vga_green),
    .vga_blue        (vga_blue),
    .vga_hsync       (vga_hsync),
    .vga_vsync       (vga_vsync),
    
    .rom_addr_R        (addr_char_R),
    .M_R                (Char_R),
    .rom_addr_G        (addr_char_G),
    .M_G                (Char_G),
    .rom_addr_B        (addr_char_B),
    .M_B                (Char_B), 
    .rom_addr_R_h        (addr_char_R_h ),
    .M_R_h                 (Char_R_h ),        
    .rom_addr_R_d        (addr_char_R_d ),
    .M_R_d                 (Char_R_d ),
    .rom_addr_R_u        (addr_char_R_u ),
    .M_R_u                 (Char_R_u ),
	
    .rom_addr_G_h        (addr_char_G_h ),
    .M_G_h                 (Char_G_h ),        
    .rom_addr_G_d        (addr_char_G_d ),
    .M_G_d                 (Char_G_d ),
    .rom_addr_G_u        (addr_char_G_u ),
    .M_G_u                 (Char_G_u ),
	
    .rom_addr_B_h        (addr_char_B_h ),
    .M_B_h                 (Char_B_h ),        
    .rom_addr_B_d        (addr_char_B_d ),
    .M_B_d                 (Char_B_d ),
    .rom_addr_B_u        (addr_char_B_u ),
    .M_B_u                 (Char_B_u ),	
    .HCnt            (Hcnt_signal),
    .VCnt            (Vcnt_signal),
    .frame_addr      (frame_addr),
    .frame_pixel     (frame_pixel_vga)
 );



endmodule
