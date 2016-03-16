`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 10:00:14 AM
// Design Name: 
// Module Name: inv_6bits_tb
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


module inv_6bits_tb(

    );
    
        reg A1,A2,A3,A4,A5,A6;
    wire Y1,Y2,Y3,Y4,Y5,Y6;
    
    inv_6bits DUT (
        .A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),
        .Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(Y5),.Y6(Y6)
        );
        
    initial begin
        A1 = 0;A2 = 0;A3 = 0;A4 = 0;A5 = 0;A6 = 0;
        #2 A1 = 1;
        #2 A2 = 1;
        #2 A3 = 1;
        #2 A4 = 1;
        #2 A5 = 1;
        #2 A6 = 1;
    end
    
endmodule
