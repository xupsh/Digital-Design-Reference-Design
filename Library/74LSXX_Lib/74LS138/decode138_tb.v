`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 01:54:44 PM
// Design Name: 
// Module Name: decode138_tb
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


module decode138_tb(

    );
    
    reg A0,A1,A2,E1,E2_n,E3_n;
    wire Y0_n,Y1_n,Y2_n,Y3_n,Y4_n,Y5_n,Y6_n,Y7_n;
    
    decode138 DUT(
        .A0(A0),.A1(A1),.A2(A2),.E1(E1),.E2_n(E2_n),.E3_n(E3_n),
        .Y0_n(Y0_n),.Y1_n(Y1_n),.Y2_n(Y2_n),.Y3_n(Y3_n),.Y4_n(Y4_n),.Y5_n(Y5_n),.Y6_n(Y6_n),.Y7_n(Y7_n)
        );
        
    initial begin
        E1 = 0;E2_n = 0;E3_n = 0;
        #5 E1 = 1;
        #5 A2 = 0; A1 = 0; A0 = 0;
        #5 A2 = 0; A1 = 0; A0 = 1;
        #5 A2 = 0; A1 = 1; A0 = 0;
        #5 A2 = 0; A1 = 1; A0 = 1;
        #5 E2_n = 1;
        #2 E2_n = 0;
        #5 A2 = 1; A1 = 0; A0 = 0;
        #5 A2 = 1; A1 = 0; A0 = 1;
        #5 A2 = 1; A1 = 1; A0 = 0;
        #5 A2 = 1; A1 = 1; A0 = 1;
        #5 E3_n = 1;
        #2 E3_n = 0;
    end
endmodule
