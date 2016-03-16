`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2015 02:30:51 PM
// Design Name: 
// Module Name: tb_192
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


module tb_192(
    );
    reg CPu,CPd,PL_n,MR,P3,P2,P1,P0;
//output TCu_n,TCd_n,
    wire Q3,Q2,Q1,Q0;
    
    Syn_Up_Down_Decade_Counter counter(.CPu(CPu),.CPd(CPd),.MR(MR),.PL_n(PL_n),.P3(P3),.P2(P2),.P1(P1),.P0(P0),.Q3(Q3),.Q2(Q2),.Q1(Q1),.Q0(Q0));
    
    initial begin
        P3 = 0;P2 = 1;P1 = 0;P0 = 1;
        CPu = 1;
        CPd = 1;
        MR = 1; PL_n = 1;
        #2 MR = 0;
        #5 PL_n = 0;
        #2 PL_n = 1;
        #2 CPu = ~CPu; //0
        #2 CPu = ~CPu; //1
        #2 CPu = ~CPu; //0
        #2 CPu = ~CPu; //1
        #5 CPd = ~CPd; //0
        #2 CPd = ~CPd; //1
        #2 CPd = ~CPd; //0
        #2 CPd = ~CPd; //1        
    end
    
endmodule
