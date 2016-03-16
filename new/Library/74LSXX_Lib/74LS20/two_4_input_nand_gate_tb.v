`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 10:26:29 AM
// Design Name: 
// Module Name: two_4_input_nand_gate_tb
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


module two_4_input_nand_gate_tb(

    );
    
    reg A1,B1,C1,D1,A2,B2,C2,D2;
    wire Y1,Y2;
    
    two_4_input_nand_gate #(.Delay(0)) DUT (
        .A1(A1),.B1(B1),.C1(C1),.D1(D1),.A2(A2),.B2(B2),.C2(C2),.D2(D2),
        .Y1(Y1),.Y2(Y2)
        );
        
    initial begin
        A1 = 0; B1 = 0; C1 = 0; D1 = 0;
        A2 = 0; B2 = 0; C2 = 0; D2 = 0;
        
        #2 A1 = 0; B1 = 0; C1 = 0; D1 = 1;
        #2 A1 = 0; B1 = 0; C1 = 1; D1 = 0;
        #2 A1 = 0; B1 = 0; C1 = 1; D1 = 1;
        #2 A1 = 0; B1 = 1; C1 = 0; D1 = 0;
        #2 A1 = 0; B1 = 1; C1 = 0; D1 = 1;
        #2 A1 = 0; B1 = 1; C1 = 1; D1 = 0;
        #2 A1 = 0; B1 = 1; C1 = 1; D1 = 1;
        #2 A1 = 1; B1 = 0; C1 = 0; D1 = 0;
        #2 A1 = 1; B1 = 0; C1 = 0; D1 = 1;
        #2 A1 = 1; B1 = 0; C1 = 1; D1 = 0;
        #2 A1 = 1; B1 = 0; C1 = 1; D1 = 1;
        #2 A1 = 1; B1 = 1; C1 = 0; D1 = 0;
        #2 A1 = 1; B1 = 1; C1 = 0; D1 = 1;
        #2 A1 = 1; B1 = 1; C1 = 1; D1 = 1;
        
        #2 A2 = 0; B2 = 0; C2 = 0; D2 = 1;
        #2 A2 = 0; B2 = 0; C2 = 1; D2 = 0;
        #2 A2 = 0; B2 = 0; C2 = 1; D2 = 1;
        #2 A2 = 0; B2 = 1; C2 = 0; D2 = 0;
        #2 A2 = 0; B2 = 1; C2 = 0; D2 = 1;
        #2 A2 = 0; B2 = 1; C2 = 1; D2 = 0;
        #2 A2 = 0; B2 = 1; C2 = 1; D2 = 1;
        #2 A2 = 1; B2 = 0; C2 = 0; D2 = 0;
        #2 A2 = 1; B2 = 0; C2 = 0; D2 = 1;
        #2 A2 = 1; B2 = 0; C2 = 1; D2 = 0;
        #2 A2 = 1; B2 = 0; C2 = 1; D2 = 1;
        #2 A2 = 1; B2 = 1; C2 = 0; D2 = 0;
        #2 A2 = 1; B2 = 1; C2 = 0; D2 = 1;
        #2 A2 = 1; B2 = 1; C2 = 1; D2 = 1;
    end
    
endmodule
