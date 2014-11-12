`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/09/16 20:26:44
// Design Name: digital_base_IP
// Module Name: one_8_input_nand_gate
// Project Name: 74LS30
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


module one_8_input_nand_gate #(parameter Delay = 0)(
    input wire A,B,C,D,E,F,G,H,
    output wire Y
    );
    
    nand #Delay (Y,A,B,C,D,E,F,G,H);
    
endmodule
