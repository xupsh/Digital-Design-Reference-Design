`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 10:20:26 AM
// Design Name: 
// Module Name: tri_3_input_and_gate_tb
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


module tri_3_input_and_gate_tb(

    );
    
    reg A1,B1,C1,A2,B2,C2,A3,B3,C3;
    wire Y1,Y2,Y3;
   
    tri_3_input_and_gate #(.Delay(0)) DUT(
       .A1(A1),.B1(B1),.C1(C1),.A2(A2),.B2(B2),.C2(C2),.A3(A3),.B3(B3),.C3(C3),
       .Y1(Y1),.Y2(Y2),.Y3(Y3)
       );
       
    initial begin
       A1 = 0; B1 = 0; C1 = 0;
       A2 = 0; B2 = 0; C2 = 0;
       A3 = 0; B3 = 0; C3 = 0;
       
       #2 A1 = 0; B1 = 0; C1 = 1;
       #2 A1 = 0; B1 = 1; C1 = 0;
       #2 A1 = 0; B1 = 1; C1 = 1;
       #2 A1 = 1; B1 = 0; C1 = 0;
       #2 A1 = 1; B1 = 0; C1 = 1;
       #2 A1 = 1; B1 = 1; C1 = 0;
       #2 A1 = 1; B1 = 1; C1 = 1;
       
       #2 A2 = 0; B2 = 0; C2 = 1;
       #2 A2 = 0; B2 = 1; C2 = 0;
       #2 A2 = 0; B2 = 1; C2 = 1;
       #2 A2 = 1; B2 = 0; C2 = 0;
       #2 A2 = 1; B2 = 0; C2 = 1;
       #2 A2 = 1; B2 = 1; C2 = 0;
       #2 A2 = 1; B2 = 1; C2 = 1;
               
       #2 A3 = 0; B3 = 0; C3 = 1;
       #2 A3 = 0; B3 = 1; C3 = 0;
       #2 A3 = 0; B3 = 1; C3 = 1;
       #2 A3 = 1; B3 = 0; C3 = 0;
       #2 A3 = 1; B3 = 0; C3 = 1;
       #2 A3 = 1; B3 = 1; C3 = 0;
       #2 A3 = 1; B3 = 1; C3 = 1;
       
    end
endmodule
