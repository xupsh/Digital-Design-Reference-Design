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
output trigger//trigger signal
);
    
 reg[7:0]shift_reg[3:0];
always@(posedge clk_AD)begin
    shift_reg[0]<=trigger_DI;
    shift_reg[1]<=shift_reg[0];
    shift_reg[2]<=shift_reg[1];
    shift_reg[3]<=shift_reg[2];
end

assign trigger = (shift_reg[0]>=shift_reg[1] && shift_reg[1]>=shift_reg[2] && shift_reg[2]>=shift_reg[3])? 1'b1:1'b0;

endmodule
