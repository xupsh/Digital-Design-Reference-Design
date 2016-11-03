`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2015 10:26:56 AM
// Design Name: 
// Module Name: binary_full_adder_4bits_tb
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


module binary_full_adder_4bits_tb(

    );
    
    reg A4,A3,A2,A1,B4,B3,B2,B1;
    reg C0;
    wire Sum4,Sum3,Sum2,Sum1;
    wire C4; 
    
    binary_full_adder_4bits DUT(
        .A4(A4),.A3(A3),.A2(A2),.A1(A1),.B4(B4),.B3(B3),.B2(B2),.B1(B1),
        .C0(C0),
        .Sum4(Sum4),.Sum3(Sum3),.Sum2(Sum2),.Sum1(Sum1),
        .C4(C4)
        );
        
    initial begin
        A4 = 1;A3 = 0;A2 = 0;A1 = 1;
        B4 = 1;B3 = 0;B2 = 0;B1 = 1;
        #2 C0 = 1;
        #2 C0 = 0;
    end
    
endmodule
