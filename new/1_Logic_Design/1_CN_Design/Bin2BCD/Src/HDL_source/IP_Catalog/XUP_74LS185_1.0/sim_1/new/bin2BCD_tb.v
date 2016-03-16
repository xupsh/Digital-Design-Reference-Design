`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2015 12:35:59 PM
// Design Name: 
// Module Name: bin2BCD_tb
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


module bin2BCD_tb(

    );
    
    reg G,E,D,C,B,A;
    wire Y8,Y7,Y6,Y5,Y4,Y3,Y2,Y1;
    
    bin2BCD DUT (
        .G(G),.E(E),.D(D),.C(C),.B(B),.A(A),
        .Y8(Y8),.Y7(Y7),.Y6(Y6),.Y5(Y5),.Y4(Y4),.Y3(Y3),.Y2(Y2),.Y1(Y1)
        );
        
    reg [4:0]i;
    initial begin
        G = 1;
        #2 G = 0;
        for(i=0;i<32;i=i+1)begin
            #2;
            E = i[4];
            D = i[3];
            C = i[2];
            B = i[1];
            A = i[0];
        end
    end
    
endmodule
