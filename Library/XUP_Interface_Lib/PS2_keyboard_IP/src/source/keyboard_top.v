`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/29 22:46:14
// Design Name: 
// Module Name: keyboard_top
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


module keyboard_top(
input mclk,
input clr,
input PS2C,
input PS2D,
output [15:0]Value
    );
    
 wire clk25; 
 clk_wiz_0 u_clock(
 .clk_in1(mclk),
 .clk_out1(clk25)
 );
// assign LED[15] = PS2C;
//  assign LED[14] = PS2D&clr;

 keyboard u_keyboard(
.clk25(clk25),
.clr(clr),
.PS2C(PS2C),
.PS2D(PS2D),
.xkey(Value)
     );
    
 
endmodule
