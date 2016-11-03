`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/10/11 13:25:35
// Design Name: digital_base_IP
// Module Name: inv_6bits
// Project Name: 74LS05
// Target Devices: Basys3
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


module inv_6bits(
    input A1,A2,A3,A4,A5,A6,
    output Y1,Y2,Y3,Y4,Y5,Y6
    );
    
    not (Y1,A1);
    not (Y2,A2);
    not (Y3,A3);
    not (Y4,A4);
    not (Y5,A5);
    not (Y6,A6);
    
endmodule
