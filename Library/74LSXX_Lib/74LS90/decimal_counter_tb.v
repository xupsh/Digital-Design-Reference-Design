`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 01:32:05 PM
// Design Name: 
// Module Name: decimal_counter_tb
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


module decimal_counter_tb(

    );
    
    reg CP1_n,CP2_n;
    reg R0_1,R0_2;
    reg R9_1,R9_2;
    wire Qa,Qb,Qc,Qd;
    
    decimal_counter DUT (
        .CP1_n(CP1_n),.CP2_n(Qa),
        .R0_1(R0_1),.R0_2(R0_2),
        .R9_1(R9_1),.R9_2(R9_2),
        .Qa(Qa),.Qb(Qb),.Qc(Qc),.Qd(Qd)
        );
    
    initial begin
        R9_1 = 1;R9_2 = 1;
        #20 R9_1 = 0;R0_1 = 1;R0_2 = 1;
        #20 R9_1 = 1;R9_2 = 0;
        #20 R0_1 = 0;
        #20 R0_1 = 1;
        #20 R0_2 = 0;
    end
    
    initial begin
        CP1_n = 0;CP2_n = 0;
        forever #5 CP1_n = ~CP1_n;
        
    end

endmodule
