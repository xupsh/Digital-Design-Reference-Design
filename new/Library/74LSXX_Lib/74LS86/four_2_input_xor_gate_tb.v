`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 01:28:28 PM
// Design Name: 
// Module Name: four_2_input_xor_gate_tb
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


module four_2_input_xor_gate_tb(

    );
    reg A1,B1,A2,B2,A3,B3,A4,B4;
        
    wire Y1,Y2,Y3,Y4;
    
    four_2_input_xor_gate #(.Delay(0)) DUT (
        .A1(A1),.B1(B1),.A2(A2),.B2(B2),.A3(A3),.B3(B3),.A4(A4),.B4(B4),
        .Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4)
        );
        
     initial begin
        A1 = 0; B1 = 0;
        A2 = 0; B2 = 0;
        A3 = 0; B3 = 0;
        A4 = 0; B4 = 0;
        
        #2;
        #2 A1 = 0; B1 = 1;
        #2 A1 = 1; B1 = 0;
        #2 A1 = 1; B1 = 1;
        
        #2;
        #2 A2 = 0; B2 = 1;
        #2 A2 = 1; B2 = 0;
        #2 A2 = 1; B2 = 1;
        
        #2;
        #2 A3 = 0; B3 = 1;
        #2 A3 = 1; B3 = 0;
        #2 A3 = 1; B3 = 1;
        
        #2; 
        #2 A4 = 0; B4 = 1;
        #2 A4 = 1; B4 = 0;
        #2 A4 = 1; B4 = 1;
        
     end   
    
endmodule
