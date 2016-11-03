`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 11:20:58 AM
// Design Name: 
// Module Name: BCD_Decimal_tb
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


module BCD_Decimal_tb(

    );
    
    reg A,B,C,D;
    wire Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9;
    
    BCD_Decimal DUT (
        .A(A),.B(B),.C(C),.D(D),
        .Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(Y5),.Y6(Y6),.Y7(Y7),.Y8(Y8),.Y9(Y9)
        );
    
    initial begin
        D = 0;C = 0;B = 0;A = 0;
        #2 D = 0; C = 0; B = 0; A = 1;
        #2 D = 0; C = 0; B = 1; A = 0;
        #2 D = 0; C = 0; B = 1; A = 1;
        #2 D = 0; C = 1; B = 0; A = 0;
        #2 D = 0; C = 1; B = 0; A = 1;
        #2 D = 0; C = 1; B = 1; A = 0;
        #2 D = 0; C = 1; B = 1; A = 1;
        #2 D = 1; C = 0; B = 0; A = 0;
        #2 D = 1; C = 0; B = 0; A = 1;
        #2 D = 1; C = 0; B = 1; A = 0;
        #2 D = 1; C = 0; B = 1; A = 1;
        #2 D = 1; C = 1; B = 0; A = 0;
        #2 D = 1; C = 1; B = 0; A = 1;
        #2 D = 1; C = 1; B = 1; A = 1;
    end
endmodule
