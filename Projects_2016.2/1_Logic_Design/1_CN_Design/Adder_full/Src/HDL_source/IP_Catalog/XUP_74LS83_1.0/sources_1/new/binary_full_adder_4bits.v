`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Hongyu Cui
// 
// Create Date: 02/08/2015 10:21:16 AM
// Design Name: 74LS83
// Module Name: binary_full_adder_4bits
// Project Name: digital_base_IP
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


module binary_full_adder_4bits(
    input A4,A3,A2,A1,B4,B3,B2,B1,
    input C0,
    output Sum4,Sum3,Sum2,Sum1,
    output C4
    );
    
    assign {C4,Sum4,Sum3,Sum2,Sum1} =  {A4,A3,A2,A1} + {B4,B3,B2,B1} + {{3{0}},C0};
    
endmodule
