`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2015 09:30:00 AM
// Design Name: 
// Module Name: magnitude_comparator_4bits_tb
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


module magnitude_comparator_4bits_tb(
    
    );
    
    reg A3,B3,A2,B2,A1,B1,A0,B0;
    reg Igt,Ilt,Ieq;
    wire Ogt,Olt,Oeq;
    
    magnitude_comparator_4bits DUT (       
        .A3(A3),.B3(B3),.A2(A2),.B2(B2),.A1(A1),.B1(B1),.A0(A0),.B0(B0),
        .Igt(Igt),.Ilt(Ilt),.Ieq(Ieq),
        .Ogt(Ogt),.Olt(Olt),.Oeq(Oeq)
        );
        
    initial begin
        A3 = 1;B3 = 0;
        #2 A3 = 0;B3 = 1;
        #2 A3 = 1;B3 = 1;
        #2 A2 = 1;B2 = 1;
        #2 A2 = 1;B2 = 0;
        #2 A2 = 0;B2 = 1;
        #2 A2 = 0;B2 = 0;
        #2 A1 = 1;B1 = 1;
        #2 A1 = 1;B1 = 0;
        #2 A1 = 0;B1 = 1;
        #2 A1 = 0;B1 = 0;
        #2 A0 = 1;B0 = 1;
        #2 A0 = 1;B0 = 0;
        #2 A0 = 0;B0 = 1;
        #2 A0 = 0;B0 = 0;
        #2 Igt=0;Ilt=0;Ieq=0;
        #2 Igt=0;Ilt=0;Ieq=1;
        #2 Igt=0;Ilt=1;Ieq=0;
    end
    
endmodule
