`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2015 01:11:48 PM
// Design Name: 
// Module Name: clock_control
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


module clock_control(
input mclk,
input key,
output clk_out1,
output clk_out2,
output clk_out3,
output clk_out4,
output clk_out5,
output clk_out6,
output clk_out7,
output  reg clk_AD,
input reset,
output reset_mmcm
    );
    
    wire DCLK_25,DCLK_50,DCLK_100,DCLK_200,DCLK_400;
    wire key_debounce;
    reg[2:0]key_cnt;
    assign clk_out4=clk_out2;
    assign clk_out7=clk_out1;
  clock u_clock(
        .clk_in1(mclk),
        .clk_out1(clk_out1),
        .clk_out2(clk_out6),//25MHz     75 clk_out6
        .clk_out3(clk_out5),//12.5MHz   50 clk_out5
        .clk_out4(clk_out2), //25MHz    25 clk_out2
        .clk_out5(clk_out3),//25MHz     12.5 clk_out3
        /*.clk_out6(clk_out6), //25MHz 
        .clk_out7(clk_out7),//25MHz*/
        .reset(reset),
        .locked(reset_mmcm)
    );    
     debounce_0 u_debounce(
   .i(key),
   .clr(1'b0),
   .clk(clk_out1),
   .o(key_debounce)
   );
   
   always@(posedge key_debounce)begin
   if(key_cnt>=4)
   key_cnt <= 0;
   else
   key_cnt<= key_cnt+1;
   end
   
   
   reg DCLK;
  always@(*)begin
   case (key_cnt)
   3'b000:begin DCLK <= clk_out3;end
   3'b001:begin DCLK <= clk_out4;end
   3'b010:begin DCLK <= clk_out5;end
   3'b011:begin DCLK <= clk_out6;end
   3'b100:begin DCLK <= clk_out7;end
   default:begin DCLK <= clk_out5;end
   endcase
   end
   
   reg[9:0]cnt;
   always@(posedge DCLK)begin
   if(cnt>249)begin
   cnt <= 0;
   clk_AD <= ~clk_AD;
   end
   else
   cnt <= cnt+1;
   end
    
endmodule
