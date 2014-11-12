`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/31 23:27:41
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
 input    [3:0]addr_char_disp_d,addr_char_disp_u,
  input   [3:0] addr_fir_char_9,addr_sec_char_9,
  input   [3:0] addr_fir_char_8,addr_sec_char_8,
  input   [3:0] addr_fir_char_7,addr_sec_char_7,
  input   [3:0] addr_fir_char_6,addr_sec_char_6,
  input   [3:0] addr_fir_char_5,addr_sec_char_5,
  input   [3:0] addr_fir_char_4,addr_sec_char_4,
  input   [3:0] addr_fir_char_3,addr_sec_char_3,
  input   [3:0] addr_fir_char_2,addr_sec_char_2,
  input   [3:0] addr_fir_char_1,addr_sec_char_1,
  input   [3:0] addr_fir_char_0,addr_sec_char_0,
  //operator addr
  input[3:0] addr_ope_char_0,addr_ope_char_1,addr_ope_char_2,

  //number
  output [0:15] Char_fir_9,Char_sec_9,Char_9_disp_d,Char_9_disp_u,
  output [0:15] Char_fir_8,Char_sec_8,Char_8_disp_d,Char_8_disp_u,
  output [0:15] Char_fir_7,Char_sec_7,Char_7_disp_d,Char_7_disp_u,
  output [0:15] Char_fir_6,Char_sec_6,Char_6_disp_d,Char_6_disp_u,
  output [0:15] Char_fir_5,Char_sec_5,Char_5_disp_d,Char_5_disp_u,
  output [0:15] Char_fir_4,Char_sec_4,Char_4_disp_d,Char_4_disp_u,
  output [0:15] Char_fir_3,Char_sec_3,Char_3_disp_d,Char_3_disp_u,
  output [0:15] Char_fir_2,Char_sec_2,Char_2_disp_d,Char_2_disp_u,
  output [0:15] Char_fir_1,Char_sec_1,Char_1_disp_d,Char_1_disp_u,
  output [0:15] Char_fir_0,Char_sec_0,Char_0_disp_d,Char_0_disp_u,
//operator
   output[0:15] Char_ope_0,Char_ope_1,Char_ope_2,
   output[0:15] Char_ope_0_disp,Char_ope_1_disp,Char_ope_2_disp
    );
    wire[0:15] Char_fir_9,Char_sec_9;
    wire[0:15] Char_9_disp_d,Char_9_disp_u;
    prom_9 u_prom_9(
    .addr_fir(addr_fir_char_9),
    .addr_sec(addr_sec_char_9),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_9),
    .Char_sec(Char_sec_9),
    .Char_disp_d(Char_9_disp_d),
    .Char_disp_u(Char_9_disp_u)
    );
    wire[0:15] Char_fir_8,Char_sec_8;
    wire[0:15] Char_8_disp_d,Char_8_disp_u;
    prom_8 u_prom_8(
    .addr_fir(addr_fir_char_8),
    .addr_sec(addr_sec_char_8),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_8),
    .Char_sec(Char_sec_8),
    .Char_disp_d(Char_8_disp_d),
    .Char_disp_u(Char_8_disp_u)
    );
    wire[0:15] Char_fir_7,Char_sec_7;
    wire[0:15] Char_7_disp_d,Char_7_disp_u;
    prom_7 u_prom_7(
    .addr_fir(addr_fir_char_7),
    .addr_sec(addr_sec_char_7),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_7),
    .Char_sec(Char_sec_7),
    .Char_disp_d(Char_7_disp_d),
    .Char_disp_u(Char_7_disp_u)
    );
    wire[0:15] Char_fir_6,Char_sec_6;
    wire[0:15] Char_6_disp_d,Char_6_disp_u;
    prom_6 u_prom_6(
    .addr_fir(addr_fir_char_6),
    .addr_sec(addr_sec_char_6),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_6),
    .Char_sec(Char_sec_6),
    .Char_disp_d(Char_6_disp_d),
    .Char_disp_u(Char_6_disp_u)
    );
    wire[0:15] Char_fir_5,Char_sec_5;
    wire[0:15] Char_5_disp_d,Char_5_disp_u;
    prom_5 u_prom_5(
    .addr_fir(addr_fir_char_5),
    .addr_sec(addr_sec_char_5),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_5),
    .Char_sec(Char_sec_5),
    .Char_disp_d(Char_5_disp_d),
    .Char_disp_u(Char_5_disp_u)
    );
    wire[0:15] Char_fir_4,Char_sec_4;
    wire[0:15] Char_4_disp_d,Char_4_disp_u;
    prom_4 u_prom_4(
    .addr_fir(addr_fir_char_4),
    .addr_sec(addr_sec_char_4),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_4),
    .Char_sec(Char_sec_4),
    .Char_disp_d(Char_4_disp_d),
    .Char_disp_u(Char_4_disp_u)
    );
    wire[0:15] Char_fir_3,Char_sec_3;
    wire[0:15] Char_3_disp_d,Char_3_disp_u;
    prom_3 u_prom_3(
    .addr_fir(addr_fir_char_3),
    .addr_sec(addr_sec_char_3),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_3),
    .Char_sec(Char_sec_3),
    .Char_disp_d(Char_3_disp_d),
    .Char_disp_u(Char_3_disp_u)
    );
    wire[0:15] Char_fir_2,Char_sec_2;
    wire[0:15] Char_2_disp_d,Char_2_disp_u;
    prom_2 u_prom_2(
    .addr_fir(addr_fir_char_2),
    .addr_sec(addr_sec_char_2),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_2),
    .Char_sec(Char_sec_2),
    .Char_disp_d(Char_2_disp_d),
    .Char_disp_u(Char_2_disp_u)
    );
    wire[0:15] Char_fir_1,Char_sec_1;
    wire[0:15] Char_1_disp_d,Char_1_disp_u;
    prom_1 u_prom_1(
    .addr_fir(addr_fir_char_1),
    .addr_sec(addr_sec_char_1),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_1),
    .Char_sec(Char_sec_1),
    .Char_disp_d(Char_1_disp_d),
    .Char_disp_u(Char_1_disp_u)
    );
    wire[0:15] Char_fir_0,Char_sec_0;
    wire[0:15] Char_0_disp_d,Char_0_disp_u;
    prom_0 u_prom_0(
    .addr_fir(addr_fir_char_0),
    .addr_sec(addr_sec_char_0),
    .addr_disp_d(addr_char_disp_d),
    .addr_disp_u(addr_char_disp_u),
    .Char_fir(Char_fir_0),
    .Char_sec(Char_sec_0),
    .Char_disp_d(Char_0_disp_d),
    .Char_disp_u(Char_0_disp_u)
    );
    
    wire[0:15] Char_ope_0;
    wire[0:15] Char_ope_0_disp;
    prom_ope_add u_prom_add(
    .addr(addr_ope_char_0),
    .addr_disp(addr_ope_char_disp),
    .Char(Char_ope_0),
    .Char_disp(Char_ope_0_disp)
    );   
    wire[0:15] Char_ope_1;
    wire[0:15] Char_ope_1_disp;
    prom_ope_sub u_prom_sub(
    .addr(addr_ope_char_1),
    .addr_disp(addr_ope_char_disp),
    .Char(Char_ope_1),
    .Char_disp(Char_ope_1_disp)
    );   
    wire[0:15] Char_ope_2;
    wire[0:15] Char_ope_2_disp;
    prom_ope_mul u_prom_mul(
    .addr(addr_ope_char_2),
    .addr_disp(addr_ope_char_disp),
    .Char(Char_ope_2),
    .Char_disp(Char_ope_2_disp)
    );
endmodule
