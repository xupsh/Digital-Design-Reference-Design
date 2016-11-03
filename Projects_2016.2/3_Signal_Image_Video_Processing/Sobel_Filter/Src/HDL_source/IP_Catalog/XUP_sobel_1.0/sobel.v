`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2015 02:14:51 PM
// Design Name: 
// Module Name: sobel
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


module sobel 
 #(parameter IMG_WIDTH = 320,
IMG_HEIGHT = 240
)
(
input pclk,
input [11:0] h_cnt,
input [10:0] v_cnt,
input [23:0] rgb, 
output [23:0] sobel
);
reg line_clk;
wire [7:0] red;
wire [7:0] green;
wire [7:0] blue;
wire [7:0] gray;
reg [9:0] sobel_reg;
assign red   =  rgb[23:16];
assign green =  rgb[15:8];
assign blue  =  rgb[7:0];

assign gray = red*5/16 + green*9/16 + blue*2/16;


always@(posedge pclk)begin
if( v_cnt>=0 && v_cnt<IMG_HEIGHT) begin
 if(h_cnt==0)
   line_clk <= 1;
 else
   line_clk <= 0;
end
end

reg[1:0] state;
initial state = 0;

always@(posedge line_clk)begin
if(v_cnt==1)
state <= 2'b00;
else begin
if(state == 2'b10)
   state <= 2'b00;
else 
   state <= state + 1;
end
end 

reg[7:0]s_window0;
reg[7:0]s_window1;
reg[7:0]s_window2;



reg[7:0]linebuffer0[IMG_WIDTH-1:0];
reg[7:0]linebuffer1[IMG_WIDTH-1:0];
reg[7:0]linebuffer2[IMG_WIDTH-1:0];
always@(posedge pclk)begin
     s_window0 <= gray;
     s_window1 <= s_window0;
     s_window2 <= s_window1;
case(state)
 2'b00: begin
    linebuffer0[h_cnt] <= gray;
     linebuffer1[h_cnt] <= linebuffer1[h_cnt];
     linebuffer2[h_cnt] <= linebuffer2[h_cnt];    

    if(h_cnt>=2&&v_cnt>=2)begin
     if((s_window0 + s_window1*2 + s_window2)>(linebuffer1[h_cnt-2]+linebuffer1[h_cnt-1]*2 +linebuffer1[h_cnt]))
     sobel_reg <= ((s_window0 + s_window1*2  + s_window2 -linebuffer1[h_cnt-2]-linebuffer1[h_cnt-1]*2  -linebuffer1[h_cnt]))/4;
     else
     sobel_reg <= (linebuffer1[h_cnt-2]+linebuffer1[h_cnt-1]*2  +linebuffer1[h_cnt]-(s_window0 + s_window1*2  + s_window2))/4;
    end 
    end 
 2'b01: begin
    linebuffer1[h_cnt] <= gray;
     linebuffer0[h_cnt] <= linebuffer0[h_cnt];
     linebuffer2[h_cnt] <= linebuffer2[h_cnt];         
   if(h_cnt>=2&&v_cnt>=2)begin
    if((s_window0 + s_window1 *2 + s_window2)>(linebuffer2[h_cnt-2]+linebuffer2[h_cnt-1]*2  +linebuffer2[h_cnt]))
     sobel_reg <= ((s_window0 + s_window1*2  + s_window2 -linebuffer2[h_cnt-2]-linebuffer2[h_cnt-1] *2 -linebuffer2[h_cnt]))/4;
     else
     sobel_reg <= (linebuffer2[h_cnt-2]+linebuffer2[h_cnt-1] *2 +linebuffer2[h_cnt]-(s_window0 + s_window1*2  + s_window2))/4;    
    end           
    end
 2'b10: begin
    linebuffer2[h_cnt] <= gray;     
     linebuffer0[h_cnt] <= linebuffer0[h_cnt];
     linebuffer1[h_cnt] <= linebuffer1[h_cnt];    
    if(h_cnt>=2&&v_cnt>=2)begin
     if((s_window0 + s_window1*2  + s_window2)>(linebuffer0[h_cnt-2]+linebuffer0[h_cnt-1] *2 +linebuffer0[h_cnt]))
     sobel_reg <= ((s_window0 + s_window1*2  + s_window2 -linebuffer0[h_cnt-2]-linebuffer0[h_cnt-1]*2  -linebuffer0[h_cnt]))/4;
     else
     sobel_reg <= (linebuffer0[h_cnt-2]+linebuffer0[h_cnt-1]*2  +linebuffer0[h_cnt]-(s_window0 + s_window1*2  + s_window2))/4;
    end
    end
default :;
endcase

end 


 assign  sobel = {sobel_reg[7:0],sobel_reg[7:0],sobel_reg[7:0]};



endmodule
