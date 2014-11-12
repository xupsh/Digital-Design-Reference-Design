`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/09/16 20:04:24
// Design Name: digital_base_IP
// Module Name: two_4_input_and_gate
// Project Name: 74LS20
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


module two_4_input_and_gate#(parameter Delay = 0)(
    input wire A1,B1,C1,D1,A2,B2,C2,D2,
    output wire Y1,Y2
    );
    
    and #Delay (Y1,A1,B1,C1,D1);
    and #Delay (Y2,A2,B2,C2,D2);
    
endmodule
