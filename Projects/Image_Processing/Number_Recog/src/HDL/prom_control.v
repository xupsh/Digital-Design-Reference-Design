`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/11/01 13:50:56
// Design Name: 
// Module Name: prom_control
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


module prom_control(
input  [3:0]addr_char_disp,	
//addr
input[3:0] addr_char_9,
input[3:0] addr_char_8,
input[3:0] addr_char_7,
input[3:0] addr_char_6,
input[3:0] addr_char_5,
input[3:0] addr_char_4,
input[3:0] addr_char_3,
input[3:0] addr_char_2,
input[3:0] addr_char_1,
input[3:0] addr_char_0,
//output rom data
output[0:15] Char_9,
output[0:15] Char_8,
output[0:15] Char_7,
output[0:15] Char_6,
output[0:15] Char_5,
output[0:15] Char_4,
output[0:15] Char_3,
output[0:15] Char_2,
output[0:15] Char_1,
output[0:15] Char_0,
output[0:15] Char_9_disp,
output[0:15] Char_8_disp,
output[0:15] Char_7_disp,
output[0:15] Char_6_disp,
output[0:15] Char_5_disp,
output[0:15] Char_4_disp,
output[0:15] Char_3_disp,
output[0:15] Char_2_disp,
output[0:15] Char_1_disp,
output[0:15] Char_0_disp
 
   
    );
        
    wire[0:15] Char_9;
    wire[0:15] Char_9_disp;
    prom_9 u_prom_9(
    .addr(addr_char_9),
    .addr_disp(addr_char_disp),
    .Char(Char_9),
    .Char_disp(Char_9_disp)
    );
    wire[0:15] Char_8;
    wire[0:15] Char_8_disp;
    prom_8 u_prom_8(
    .addr(addr_char_8),
    .addr_disp(addr_char_disp),
    .Char(Char_8),
    .Char_disp(Char_8_disp)
    );
    wire[0:15] Char_7;
    wire[0:15] Char_7_disp;
    prom_7 u_prom_7(
    .addr(addr_char_7),
    .addr_disp(addr_char_disp),
    .Char(Char_7),
    .Char_disp(Char_7_disp)
    );
    wire[0:15] Char_6;
    wire[0:15] Char_6_disp;
    prom_6 u_prom_6(
    .addr(addr_char_6),
    .addr_disp(addr_char_disp),
    .Char(Char_6),
    .Char_disp(Char_6_disp)
    );
    wire[0:15] Char_5;
    wire[0:15] Char_5_disp;
    prom_5 u_prom_5(
    .addr(addr_char_5),
    .addr_disp(addr_char_disp),
    .Char(Char_5),
    .Char_disp(Char_5_disp)
    );
    wire[0:15] Char_4;
    wire[0:15] Char_4_disp;
    prom_4 u_prom_4(
    .addr(addr_char_4),
    .addr_disp(addr_char_disp),
    .Char(Char_4),
    .Char_disp(Char_4_disp)
    );
    wire[0:15] Char_3;
    wire[0:15] Char_3_disp;
    prom_3 u_prom_3(
    .addr(addr_char_3),
    .addr_disp(addr_char_disp),
    .Char(Char_3),
    .Char_disp(Char_3_disp)
    );
    wire[0:15] Char_2;
    wire[0:15] Char_2_disp;
    prom_2 u_prom_2(
    .addr(addr_char_2),
    .addr_disp(addr_char_disp),
    .Char(Char_2),
    .Char_disp(Char_2_disp)
    );
    wire[0:15] Char_1;
    wire[0:15] Char_1_disp;
    prom_1 u_prom_1(
    .addr(addr_char_1),
    .addr_disp(addr_char_disp),
    .Char(Char_1),
    .Char_disp(Char_1_disp)
    );
    wire[0:15] Char_0;
    wire[0:15] Char_0_disp;
    prom_0 u_prom_0(
    .addr(addr_char_0),
    .addr_disp(addr_char_disp),
    .Char(Char_0),
    .Char_disp(Char_0_disp)
    );     
    
endmodule
