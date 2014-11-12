`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/09/16 19:40:22
// Design Name: digital_base_IP
// Module Name: tri_3_input_nand_gate
// Project Name: 74LS10
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


module tri_3_input_nand_gate#(parameter Delay = 0)(
    input wire A1,B1,C1,A2,B2,C2,A3,B3,C3,
    output wire Y1,Y2,Y3
    );
    
    nand #Delay (Y1,A1,B1,C1);
    nand #Delay (Y2,A2,B2,C2);
    nand #Delay (Y3,A3,B3,C3);
    
endmodule
