`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 10:51:56 AM
// Design Name: 
// Module Name: one_8_input_nand_gate_tb
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


module one_8_input_nand_gate_tb(

    );
    
    reg A,B,C,D,E,F,G,H;
    wire Y;
            
    one_8_input_nand_gate #(.Delay(0)) DUT (
        .A(A),.B(B),.C(C),.D(D),.E(E),.F(F),.G(G),.H(H),
        .Y(Y)
        );
        
    reg [7:0]count;
    initial begin
        A = 0; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
        for(count = 0;count <65535;count = count + 1)begin
            $display("#2 A = %b; B = %b; C = %b; D = %b; E = %b; F = %b; G = %b; H = %b;",count[7],count[6],count[5],count[4],count[3],count[2],count[1],count[0]);
            #2;
            A = count[7];B = count[6];C = count[5];D = count[4];E = count[3];F = count[2];G = count[1];H = count[0];
        end
        
    end

    
        
endmodule
