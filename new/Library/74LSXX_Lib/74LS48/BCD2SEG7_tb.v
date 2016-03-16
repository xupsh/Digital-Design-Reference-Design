`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 11:32:49 AM
// Design Name: 
// Module Name: BCD2SEG7_tb
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


module BCD2SEG7_tb(

    );
    
    reg LT_n,RBI_n,BCD_D,BCD_C,BCD_B,BCD_A;
    wire a,b,c,d,e,f,g;
    wire BI_RBO_n;
    reg RBO_buf;
    
    BCD2SEG7 DUT (
        .LT_n(LT_n),.RBI_n(RBI_n),.BCD_D(BCD_D),.BCD_C(BCD_C),.BCD_B(BCD_B),.BCD_A(BCD_A),
        .a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),
        .BI_RBO_n(BI_RBO_n)
        );
    
    assign BI_RBO_n = ((~LT_n) || (~RBO_buffer)) ? RBO_buffer : 1'bz;
    
    initial begin
        BI_RBO_n = 0;
        #2 BI_RBO_n = 1; LT_n = 0;
        #2 BI_RBO_n = 0; LT_n = 1; RBI_n = 0;
        #2 BCD_D = 0;BCD_C = 0;BCD_B = 0;BCD_A = 0;
        #2 RBI_n = 1;
        #2 BCD_D = 0;BCD_C = 0;BCD_B = 0;BCD_A = 1;RBI_n = 1'bx;
        #2 BCD_D = 0;BCD_C = 0;BCD_B = 1;BCD_A = 0;
        #2 BCD_D = 0;BCD_C = 0;BCD_B = 1;BCD_A = 1;
        #2 BCD_D = 0;BCD_C = 1;BCD_B = 0;BCD_A = 0;
        #2 BCD_D = 0;BCD_C = 1;BCD_B = 0;BCD_A = 1;
        #2 BCD_D = 0;BCD_C = 1;BCD_B = 1;BCD_A = 0;
        #2 BCD_D = 0;BCD_C = 1;BCD_B = 1;BCD_A = 1;
        #2 BCD_D = 1;BCD_C = 0;BCD_B = 0;BCD_A = 0;
        #2 BCD_D = 1;BCD_C = 0;BCD_B = 0;BCD_A = 1;
        #2 BCD_D = 1;BCD_C = 0;BCD_B = 1;BCD_A = 0;
        #2 BCD_D = 1;BCD_C = 0;BCD_B = 1;BCD_A = 1;
        #2 BCD_D = 1;BCD_C = 1;BCD_B = 0;BCD_A = 0;
        #2 BCD_D = 1;BCD_C = 1;BCD_B = 0;BCD_A = 1;
        #2 BCD_D = 1;BCD_C = 1;BCD_B = 1;BCD_A = 0;
        #2 BCD_D = 1;BCD_C = 1;BCD_B = 1;BCD_A = 1;
        
    end
    
endmodule
