`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 12:34:29 PM
// Design Name: 
// Module Name: D_FlipFlop_Set_Reset_tb
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


module D_FlipFlop_Set_Reset_tb(

    );
    
    reg CLK1,PR1_n,CLR1_n,D1;
    reg CLK2,PR2_n,CLR2_n,D2;
    wire Q1,Q1_n,Q2,Q2_n;
            
    D_FlipFlop_Set_Reset DUT (
        .CLK1(CLK1),.PR1_n(PR1_n),.CLR1_n(CLR1_n),.D1(D1),
        .CLK2(CLK2),.PR2_n(PR2_n),.CLR2_n(CLR2_n),.D2(D2),
        .Q1(Q1),.Q1_n(Q1_n),.Q2(Q2),.Q2_n(Q2_n)
        );
        
    initial begin
        D1 = 1;D2 = 0;
        forever #20 D1 = ~D1;
        forever #20 D2 = ~D2;
    end
    
    initial begin
        CLK1 = 0; CLK2 = 0;
        forever #1 CLK1 = ~CLK1;
        forever #1 CLK2 = ~CLK2;
    end
    
    initial begin
        CLR1_n = 1;PR1_n = 1;CLR2_n = 1;PR2_n = 1;
        #5 CLR1_n = 0;PR2_n = 0;
        #2 CLR1_n = 1;PR2_n = 1;
        #5 CLR2_n = 0;PR1_n = 0;
        #2 CLR2_n = 1;PR1_n = 1;
    end
endmodule
