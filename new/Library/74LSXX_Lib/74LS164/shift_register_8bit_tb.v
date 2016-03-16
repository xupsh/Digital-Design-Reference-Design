`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 02:42:57 PM
// Design Name: 
// Module Name: shift_register_8bit_tb
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


module shift_register_8bit_tb(

    );
    
    reg DSA,DSB,CP,MR_n;
    wire Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0;
            
    shift_register_8bit DUT (
        .DSA(DSA),.DSB(DSB),.CP(CP),.MR_n(MR_n),
        .Q7(Q7),.Q6(Q6),.Q5(Q5),.Q4(Q4),.Q3(Q3),.Q2(Q2),.Q1(Q1),.Q0(Q0)
        );
        
    initial begin
        MR_n = 0;CP = 0;
        #2 MR_n = 1;
        #10 DSA = 1; DSB =  1;
        #10 DSA = 0;
        #10 DSA = 1; DSB = 0;
        #10 DSA = 1; DSB =  1;
        #10 DSA = 0;
        #10 DSA = 1; DSB = 0;
    end
    
    always #2 CP = ~CP;
    
endmodule
