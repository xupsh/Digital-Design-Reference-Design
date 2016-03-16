`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 02:16:52 PM
// Design Name: 
// Module Name: mux_8_to_1_tb
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


module mux_8_to_1_tb(

    );
    reg S_n,A2,A1,A0,D7,D6,D5,D4,D3,D2,D1,D0;
    wire Q,Q_n;
    
    mux_8_to_1 DUT (
        .S_n(S_n),.A2(A2),.A1(A1),.A0(A0),.D7(D7),.D6(D6),.D5(D5),.D4(D4),.D3(D3),.D2(D2),.D1(D1),.D0(D0),
        .Q(Q),.Q_n(Q_n)
        );
        
    initial begin
        S_n = 1;D7 = 0;D6 = 0;D5 = 0;D4 = 0;D3 = 0;D2 = 0;D1 = 0;D0 = 0;
        #2 S_n = 0;
        #50 A2 = 0;A1 = 0;A0 = 0;
        #50 A2 = 0;A1 = 0;A0 = 1;
        #50 A2 = 0;A1 = 1;A0 = 0;
        #50 A2 = 0;A1 = 1;A0 = 1;
        #50 A2 = 1;A1 = 0;A0 = 0;
        #50 A2 = 1;A1 = 0;A0 = 1;
        #50 A2 = 1;A1 = 1;A0 = 0;
        #50 A2 = 1;A1 = 1;A0 = 1;
    end
    
    always #1 D0 = ~D0;
    always #2 D1 = ~D1;
    always #3 D2 = ~D2;
    always #4 D3 = ~D3;
    always #5 D4 = ~D4;
    always #6 D5 = ~D5;
    always #7 D6 = ~D6;
    always #8 D7 = ~D7;
endmodule
