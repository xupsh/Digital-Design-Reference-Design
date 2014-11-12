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

output[15:0]LED
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
    .wea             (SW[15]),
    .addra           (capture_addr),
    .dina            (data_16),
    .clkb            (clk25),
    .addrb           (frame_addr),
    .doutb           (frame_pixel)
 );
 
 wire [23:0]     RGB24_signal;
 wire binary,binary_temp;
 wire [23:0]     RGB24_dis_signal1,RGB24_dis_signal2,RGB24_dis_signal;
 assign RGB24_dis_signal= (SW[14]==1)?RGB24_dis_signal1:RGB24_dis_signal2 ;
 assign           RGB24_signal       =   {frame_pixel[15:11],3'b000,frame_pixel[10:5],2'b00,frame_pixel[4:0],3'b000};  
 assign           frame_pixel_vga    =   {RGB24_dis_signal[23:19] , RGB24_dis_signal[15:10], RGB24_dis_signal[7:3]};
  binary u_binary(
    . pclk(clk25),
    .threshold(SW[7:0]),
    .rgb_i(RGB24_signal),
    .binary_o(binary_temp)
    );

wire [3:0]addr_char_disp_d,addr_char_disp_u;
wire [3:0]addr_fir_char_9,addr_sec_char_9;
wire   [3:0] addr_fir_char_8,addr_sec_char_8;
wire   [3:0] addr_fir_char_7,addr_sec_char_7;
wire   [3:0] addr_fir_char_6,addr_sec_char_6;
wire   [3:0] addr_fir_char_5,addr_sec_char_5;
wire   [3:0] addr_fir_char_4,addr_sec_char_4;
wire   [3:0] addr_fir_char_3,addr_sec_char_3;
wire   [3:0] addr_fir_char_2,addr_sec_char_2;
wire   [3:0] addr_fir_char_1,addr_sec_char_1;
wire   [3:0] addr_fir_char_0,addr_sec_char_0;
//operator
  wire[3:0] addr_ope_char_0,addr_ope_char_1,addr_ope_char_2;
  
    //number
  wire [0:15] Char_fir_9,Char_sec_9,Char_9_disp_d,Char_9_disp_u;
  wire [0:15] Char_fir_8,Char_sec_8,Char_8_disp_d,Char_8_disp_u;
  wire [0:15] Char_fir_7,Char_sec_7,Char_7_disp_d,Char_7_disp_u;
  wire [0:15] Char_fir_6,Char_sec_6,Char_6_disp_d,Char_6_disp_u;
  wire [0:15] Char_fir_5,Char_sec_5,Char_5_disp_d,Char_5_disp_u;
  wire [0:15] Char_fir_4,Char_sec_4,Char_4_disp_d,Char_4_disp_u;
  wire [0:15] Char_fir_3,Char_sec_3,Char_3_disp_d,Char_3_disp_u;
  wire [0:15] Char_fir_2,Char_sec_2,Char_2_disp_d,Char_2_disp_u;
  wire [0:15] Char_fir_1,Char_sec_1,Char_1_disp_d,Char_1_disp_u;
  wire [0:15] Char_fir_0,Char_sec_0,Char_0_disp_d,Char_0_disp_u;
//operator
   wire[0:15] Char_ope_0,Char_ope_1,Char_ope_2;
   wire[0:15] Char_ope_0_disp,Char_ope_1_disp,Char_ope_2_disp;
   
   
prom_control u_prom_ctrl(
.addr_char_disp_d(addr_char_disp_d),
.addr_char_disp_u(addr_char_disp_u),
.addr_fir_char_9(addr_fir_char_9),
.addr_sec_char_9(addr_sec_char_9),
.addr_fir_char_8(addr_fir_char_8),
.addr_sec_char_8(addr_sec_char_8),
.addr_fir_char_7(addr_fir_char_7),
.addr_sec_char_7(addr_sec_char_7),
.addr_fir_char_6(addr_fir_char_6),
.addr_sec_char_6(addr_sec_char_6),
.addr_fir_char_5(addr_fir_char_5),
.addr_sec_char_5(addr_sec_char_5),
.addr_fir_char_4(addr_fir_char_4),
.addr_sec_char_4(addr_sec_char_4),
.addr_fir_char_3(addr_fir_char_3),
.addr_sec_char_3(addr_sec_char_3),
.addr_fir_char_2(addr_fir_char_2),
.addr_sec_char_2(addr_sec_char_2),
.addr_fir_char_1(addr_fir_char_1),
.addr_sec_char_1(addr_sec_char_1),
.addr_fir_char_0(addr_fir_char_0),
.addr_sec_char_0(addr_sec_char_0),
  //operator addr
.addr_ope_char_0(addr_ope_char_0),
.addr_ope_char_1(addr_ope_char_1),
.addr_ope_char_2(addr_ope_char_2),

  //number
. Char_fir_9(Char_fir_9),.Char_sec_9(Char_sec_9),.Char_9_disp_d(Char_9_disp_d),.Char_9_disp_u(Char_9_disp_u),
. Char_fir_8(Char_fir_8),.Char_sec_8(Char_sec_8),.Char_8_disp_d(Char_8_disp_d),.Char_8_disp_u(Char_8_disp_u),
. Char_fir_7(Char_fir_7),.Char_sec_7(Char_sec_7),.Char_7_disp_d(Char_7_disp_d),.Char_7_disp_u(Char_7_disp_u),
. Char_fir_6(Char_fir_6),.Char_sec_6(Char_sec_6),.Char_6_disp_d(Char_6_disp_d),.Char_6_disp_u(Char_6_disp_u),
. Char_fir_5(Char_fir_5),.Char_sec_5(Char_sec_5),.Char_5_disp_d(Char_5_disp_d),.Char_5_disp_u(Char_5_disp_u),
. Char_fir_4(Char_fir_4),.Char_sec_4(Char_sec_4),.Char_4_disp_d(Char_4_disp_d),.Char_4_disp_u(Char_4_disp_u),
. Char_fir_3(Char_fir_3),.Char_sec_3(Char_sec_3),.Char_3_disp_d(Char_3_disp_d),.Char_3_disp_u(Char_3_disp_u),
. Char_fir_2(Char_fir_2),.Char_sec_2(Char_sec_2),.Char_2_disp_d(Char_2_disp_d),.Char_2_disp_u(Char_2_disp_u),
. Char_fir_1(Char_fir_1),.Char_sec_1(Char_sec_1),.Char_1_disp_d(Char_1_disp_d),.Char_1_disp_u(Char_1_disp_u),
. Char_fir_0(Char_fir_0),.Char_sec_0(Char_sec_0),.Char_0_disp_d(Char_0_disp_d),.Char_0_disp_u(Char_0_disp_u),

//operator
.Char_ope_0(Char_ope_0),
.Char_ope_1(Char_ope_1),
.Char_ope_2(Char_ope_2),
.Char_ope_0_disp(Char_ope_0_disp),
.Char_ope_1_disp(Char_ope_1_disp),
.Char_ope_2_disp(Char_ope_2_disp)
    );
    
    
        wire[3:0]index_fir;//result of number recognize
         wire[3:0]index_ope;
         wire[3:0]index_sec;
		 
    wire [9:0]       Hcnt_signal;
    wire [9:0]       Vcnt_signal;
   wire [8:0]       Hcnt_signal_reg;
   wire [8:0]       Vcnt_signal_reg;
   assign Hcnt_signal_reg = ((Hcnt_signal-160)>=0 && (Hcnt_signal-160) < 320)?(Hcnt_signal-160):0;
   assign Vcnt_signal_reg = ((Vcnt_signal-120)>=0 && (Vcnt_signal-120) < 240)?(Vcnt_signal-120):0;
     image_process u_image_process( 
   .pclk(clk25),
   .VtcHCnt(Hcnt_signal_reg),
   .VtcVCnt(Vcnt_signal_reg),
   .index_fir(index_fir),
   .index_ope(index_ope),
   .index_sec(index_sec),

   .rgb_i(RGB24_signal),
   .rgb_render(RGB24_dis_signal1),
   .binary_i(binary_temp),
   .binary_render(binary),
   
	.rom_fir_addr_9(addr_fir_char_9),
	.M_fir_9(Char_fir_9),
	.rom_fir_addr_8(addr_fir_char_8),
	.M_fir_8(Char_fir_8),
	.rom_fir_addr_7(addr_fir_char_7),
	.M_fir_7(Char_fir_7),
	.rom_fir_addr_6(addr_fir_char_6),
	.M_fir_6(Char_fir_6),
	.rom_fir_addr_5(addr_fir_char_5),
	.M_fir_5(Char_fir_5),
	.rom_fir_addr_4(addr_fir_char_4),
	.M_fir_4(Char_fir_4),
	.rom_fir_addr_3(addr_fir_char_3),
	.M_fir_3(Char_fir_3),
	.rom_fir_addr_2(addr_fir_char_2),
	.M_fir_2(Char_fir_2),
	.rom_fir_addr_1(addr_fir_char_1),
	.M_fir_1(Char_fir_1),
	.rom_fir_addr_0(addr_fir_char_0),
	.M_fir_0(Char_fir_0),

	.rom_sec_addr_9(addr_sec_char_9),
	.M_sec_9(Char_sec_sec_9),
	.rom_sec_addr_8(addr_sec_char_8),
	.M_sec_8(Char_sec_8),
	.rom_sec_addr_7(addr_sec_char_7),
	.M_sec_7(Char_sec_7),
	.rom_sec_addr_6(addr_sec_char_6),
	.M_sec_6(Char_sec_6),
	.rom_sec_addr_5(addr_sec_char_5),
	.M_sec_5(Char_sec_5),
	.rom_sec_addr_4(addr_sec_char_4),
	.M_sec_4(Char_sec_4),
	.rom_sec_addr_3(addr_sec_char_3),
	.M_sec_3(Char_sec_3),
	.rom_sec_addr_2(addr_sec_char_2),
	.M_sec_2(Char_sec_2),
	.rom_sec_addr_1(addr_sec_char_1),
	.M_sec_1(Char_sec_1),
	.rom_sec_addr_0(addr_sec_char_0),
	.M_sec_0(Char_sec_0),
	
	.rom_ope_addr_2(addr_ope_char_2),
    .M_ope_2(Char_ope_2),
    .rom_ope_addr_1(addr_ope_char_1),
    .M_ope_1(Char_ope_1),
    .rom_ope_addr_0(addr_ope_char_0),
    .M_ope_0(Char_ope_0)
	
       );
    assign RGB24_dis_signal2 = {binary,binary,binary,binary,binary,binary,binary,binary,
                                binary,binary,binary,binary,binary,binary,binary,binary,
                                binary,binary,binary,binary,binary,binary,binary,binary};

wire[3:0] result_d,result_u;
operation u_operate(
.index_fir_Num(index_fir),
.index_sec_Num(index_sec),
.index_ope(index_ope),
.result_d(result_d),
.result_u(result_u)
    );
        assign LED[15:0] = {4'b0000,index_fir,index_ope,index_sec};

reg[0:15] Char_disp_d;
always@(*)begin
case (result_d)
4'b0000:begin Char_disp_d <= Char_0_disp_d;end
4'b0001:begin Char_disp_d <= Char_1_disp_d;end
4'b0010:begin Char_disp_d <= Char_2_disp_d;end
4'b0011:begin Char_disp_d <= Char_3_disp_d;end
4'b0100:begin Char_disp_d <= Char_4_disp_d;end
4'b0101:begin Char_disp_d <= Char_5_disp_d;end
4'b0110:begin Char_disp_d <= Char_6_disp_d;end
4'b0111:begin Char_disp_d <= Char_7_disp_d;end
4'b1000:begin Char_disp_d <= Char_8_disp_d;end
4'b1001:begin Char_disp_d <= Char_9_disp_d;end
default: Char_disp_d <= Char_0_disp_d;
endcase
end

reg[0:15] Char_disp_u;
always@(*)begin
case (result_u)
4'b0000:begin Char_disp_u <= Char_0_disp_u;end
4'b0001:begin Char_disp_u <= Char_1_disp_u;end
4'b0010:begin Char_disp_u <= Char_2_disp_u;end
4'b0011:begin Char_disp_u <= Char_3_disp_u;end
4'b0100:begin Char_disp_u <= Char_4_disp_u;end
4'b0101:begin Char_disp_u <= Char_5_disp_u;end
4'b0110:begin Char_disp_u <= Char_6_disp_u;end
4'b0111:begin Char_disp_u <= Char_7_disp_u;end
4'b1000:begin Char_disp_u <= Char_8_disp_u;end
4'b1001:begin Char_disp_u <= Char_9_disp_u;end
default: Char_disp_u <= Char_0_disp_u;
endcase
end

//reg[0:15] Char_ope_disp;
//always@(*)begin
//case (index_ope)
//4'b0000:begin Char_ope_disp <= Char_ope_0_disp;end
//4'b0001:begin Char_ope_disp <= Char_ope_1_disp;end
//4'b0010:begin Char_ope_disp <= Char_ope_2_disp;end

//default: Char_ope_disp <= Char_ope_0_disp;
//endcase
//end


 vga   u_vga(
    .clk25           (clk25),
    .vga_red         (vga_red),
    .vga_green       (vga_green),
    .vga_blue        (vga_blue),
    .vga_hsync       (vga_hsync),
    .vga_vsync       (vga_vsync),
    .rom_addr_d        (addr_char_disp_d),
    .M_d               (Char_disp_d),
    .rom_addr_u        (addr_char_disp_u),
    .M_u               (Char_disp_u),   
    
    .HCnt            (Hcnt_signal),
    .VCnt            (Vcnt_signal),
    .frame_addr      (frame_addr),
    .frame_pixel     (frame_pixel_vga)
 );


endmodule
