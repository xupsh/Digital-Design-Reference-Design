`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:Xilinx 
// Engineer: Cui Hongyu
// 
// Create Date: 2014/09/16 21:07:07
// Design Name: digital_base_IP
// Module Name: D_FlipFlop_Set_Reset
// Project Name: 74LS74
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


module D_FlipFlop_Set_Reset(
    input wire CLK1,PR1_n,CLR1_n,D1,
    input wire CLK2,PR2_n,CLR2_n,D2,
    output reg Q1,
    output wire Q1_n,
    output reg Q2,
    output wire Q2_n
    );
    
    always@(posedge CLK1,negedge PR1_n,negedge CLR1_n)
        if(PR1_n == 0)
            Q1 <= 1;
        else if(CLR1_n == 0)
            Q1 <= 0;
        else
            Q1 <= D1;
    
    always@(posedge CLK2,negedge PR2_n,negedge CLR2_n)
        if(PR2_n == 0)
            Q2 <= 1;
        else if(CLR2_n == 0)
            Q2 <= 0;
        else
            Q2 <= D2;
    
    assign Q1_n = ~Q1;
    assign Q2_n = ~Q2;
    
endmodule
