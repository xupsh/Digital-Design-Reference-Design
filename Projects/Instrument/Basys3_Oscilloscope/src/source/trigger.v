`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/21 20:32:50
// Design Name: 
// Module Name: trigger
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

module trigger(
input clk_AD,
input[7:0] trigger_DI,
output[7:0] trigger_DO0,
output[7:0] trigger_DO1,
output[7:0] trigger_DO2,
output[7:0] trigger_DO3
    );
    
 reg[7:0]shift_reg[3:0];
always@(posedge clk_AD)begin
    shift_reg[0]<=trigger_DI;
    shift_reg[1]<=shift_reg[0];
    shift_reg[2]<=shift_reg[1];
    shift_reg[3]<=shift_reg[2];
end

assign trigger_DO0=shift_reg[0];
assign trigger_DO1=shift_reg[1];
assign trigger_DO2=shift_reg[2];
assign trigger_DO3=shift_reg[3];

endmodule
