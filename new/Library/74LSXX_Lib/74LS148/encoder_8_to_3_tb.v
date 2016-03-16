`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 02:05:44 PM
// Design Name: 
// Module Name: encoder_8_to_3_tb
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


module encoder_8_to_3_tb(

    );
    
    reg I7,I6,I5,I4,I3,I2,I1,I0;
    reg EI;
    wire Qc,Qb,Qa;   
    wire GS,EO;
    
    encoder_8_to_3 DUT(
        .I7(I7),.I6(I6),.I5(I5),.I4(I4),.I3(I3),.I2(I2),.I1(I1),.I0(I0),
        .EI(EI),
        .Qc(Qc),.Qb(Qb),.Qa(Qa),   
        .GS(GS),.EO(EO)
        );
        
    initial begin
        EI = 0;
        #2 EI = 1;
        #2 EI = 0;
        #5 I7 = 1; I6 = 1; I5 = 1; I4 = 1; I3 = 1;I2 = 1;I1 = 1;I0 = 1;
        #5 I7 = 1; I6 = 1; I5 = 1; I4 = 1; I3 = 1;I2 = 1;I1 = 1;I0 = 0;
        #5 I7 = 1; I6 = 1; I5 = 1; I4 = 1; I3 = 1;I2 = 1;I1 = 0;I0 = 1;
        #5 I7 = 1; I6 = 1; I5 = 1; I4 = 1; I3 = 1;I2 = 0;I1 = 1;I0 = 1;
        #5 I7 = 1; I6 = 1; I5 = 1; I4 = 1; I3 = 0;I2 = 1;I1 = 1;I0 = 1;
        #5 I7 = 1; I6 = 1; I5 = 1; I4 = 0; I3 = 1;I2 = 1;I1 = 1;I0 = 1;
        #5 I7 = 1; I6 = 1; I5 = 0; I4 = 1; I3 = 1;I2 = 1;I1 = 1;I0 = 1;
        #5 I7 = 1; I6 = 0; I5 = 1; I4 = 1; I3 = 1;I2 = 1;I1 = 1;I0 = 1;
        #5 I7 = 0; I6 = 1; I5 = 1; I4 = 1; I3 = 1;I2 = 1;I1 = 1;I0 = 1;
    end
    
endmodule
