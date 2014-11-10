`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/09/16 19:24:56
// Design Name: digital_base_IP
// Module Name: six_not_gate
// Project Name: 74LS04
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


module six_not_gate #(parameter Delay = 0)(
    input wire A1,A2,A3,A4,A5,A6,
    output wire Y1,Y2,Y3,Y4,Y5,Y6
    );
    
    not #Delay (Y1,A1);
    not #Delay (Y2,A2);
    not #Delay (Y3,A3);
    not #Delay (Y4,A4);
    not #Delay (Y5,A5);
    not #Delay (Y6,A6);
    
endmodule