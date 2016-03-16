`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 02:26:13 PM
// Design Name: 
// Module Name: two_mux_4_to_1_tb
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


module two_mux_4_to_1_tb(

    );
    
    reg S1_n,S2_n,A1,A0,D3_1,D2_1,D1_1,D0_1,D3_2,D2_2,D1_2,D0_2;
    wire Y1,Y2;
    
    two_mux_4_to_1 DUT (
        .S1_n(S1_n),.S2_n(S2_n),.A1(A1),.A0(A0),.D3_1(D3_1),.D2_1(D2_1),.D1_1(D1_1),.D0_1(D0_1),.D3_2(D3_2),.D2_2(D2_2),.D1_2(D1_2),.D0_2(D0_2),
        .Y1(Y1),.Y2(Y2)
        );
        
    initial begin
        S1_n = 1;S2_n = 1;D3_1=0;D2_1=0;D1_1=0;D0_1=0;D3_2=0;D2_2=0;D1_2=0;D0_2=0;
        #2S1_n = 0;S2_n = 0;
        #50 A1 = 0;A0 = 0;
        #50 A1 = 0;A0 = 1;
        #50 A1 = 1;A0 = 0;
        #50 A1 = 1;A0 = 1;
    end
    
    always #1 D0_1 = ~D0_1;
    always #2 D1_1 = ~D1_1;
    always #4 D2_1 = ~D2_1;
    always #8 D3_1 = ~D3_1;
    
    always #8 D0_2 = ~D0_2;
    always #4 D1_2 = ~D1_2;
    always #2 D2_2 = ~D2_2;
    always #1 D3_2 = ~D3_2;
    
endmodule
