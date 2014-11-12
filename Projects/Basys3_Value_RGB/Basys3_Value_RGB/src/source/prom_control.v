`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/31 10:40:42
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
input[3:0]addr_char_R,addr_char_G,addr_char_B,
output[0:15]Char_R,Char_G,Char_B,
input wire[3:0]addr_R_h,addr_R_d,addr_R_u,
input wire[3:0]addr_G_h,addr_G_d,addr_G_u,
input wire[3:0]addr_B_h,addr_B_d,addr_B_u,
input [7:0]R_detect,G_detect,B_detect,
output[0:15] Char_R_h,
output[0:15] Char_R_d,
output[0:15] Char_R_u,
output[0:15] Char_G_h,
output[0:15] Char_G_d,
output[0:15] Char_G_u,
output[0:15] Char_B_h,
output[0:15] Char_B_d,
output[0:15] Char_B_u
   
     );
         wire[3:0]R_h,R_d,R_u;
     wire[3:0]G_h,G_d,G_u;
     wire[3:0]B_h,B_d,B_u;
     
      BtoD u_B2D(
     .R_detect(R_detect),
      .G_detect(G_detect),
      .B_detect(B_detect),
     .R_h(R_h),
     .R_d(R_d),
     .R_u(R_u),
     .G_h(G_h),
     .G_d(G_d),
     .G_u(G_u),
     .B_h(B_h),
     .B_d(B_d),
     .B_u(B_u)
        );
 reg[0:15] Char_R_h;
       always@(*)begin
       case (R_h)
       4'd0:Char_R_h <= Char_0_R_h;
       4'd1:Char_R_h <= Char_1_R_h;
       4'd2:Char_R_h <= Char_2_R_h;
       4'd3:Char_R_h <= Char_3_R_h;
       4'd4:Char_R_h <= Char_4_R_h;
       4'd5:Char_R_h <= Char_5_R_h;
       4'd6:Char_R_h <= Char_6_R_h;
       4'd7:Char_R_h <= Char_7_R_h;
       4'd8:Char_R_h <= Char_8_R_h;
       4'd9:Char_R_h <= Char_9_R_h;
       endcase
       end
        reg[0:15] Char_R_d;
       always@(*)begin
       case (R_d)
       4'd0:Char_R_d <= Char_0_R_d;
       4'd1:Char_R_d <= Char_1_R_d;
       4'd2:Char_R_d <= Char_2_R_d;
       4'd3:Char_R_d <= Char_3_R_d;
       4'd4:Char_R_d <= Char_4_R_d;
       4'd5:Char_R_d <= Char_5_R_d;
       4'd6:Char_R_d <= Char_6_R_d;
       4'd7:Char_R_d <= Char_7_R_d;
       4'd8:Char_R_d <= Char_8_R_d;
       4'd9:Char_R_d <= Char_9_R_d;
       endcase
       end
       reg[0:15] Char_R_u;
       always@(*)begin
       case (R_u)
       4'd0:Char_R_u <= Char_0_R_u;
       4'd1:Char_R_u <= Char_1_R_u;
       4'd2:Char_R_u <= Char_2_R_u;
       4'd3:Char_R_u <= Char_3_R_u;
       4'd4:Char_R_u <= Char_4_R_u;
       4'd5:Char_R_u <= Char_5_R_u;
       4'd6:Char_R_u <= Char_6_R_u;
       4'd7:Char_R_u <= Char_7_R_u;
       4'd8:Char_R_u <= Char_8_R_u;
       4'd9:Char_R_u <= Char_9_R_u;
       endcase
       end   
    
    
       reg[0:15] Char_G_h;
     always@(*)begin
       case (G_h)
       4'd0:Char_G_h <= Char_0_G_h;
       4'd1:Char_G_h <= Char_1_G_h;
       4'd2:Char_G_h <= Char_2_G_h;
       4'd3:Char_G_h <= Char_3_G_h;
       4'd4:Char_G_h <= Char_4_G_h;
       4'd5:Char_G_h <= Char_5_G_h;
       4'd6:Char_G_h <= Char_6_G_h;
       4'd7:Char_G_h <= Char_7_G_h;
       4'd8:Char_G_h <= Char_8_G_h;
       4'd9:Char_G_h <= Char_9_G_h;
       endcase
       end
        reg[0:15] Char_G_d;
       always@(*)begin
       case (G_d)
       4'd0:Char_G_d <= Char_0_G_d;
       4'd1:Char_G_d <= Char_1_G_d;
       4'd2:Char_G_d <= Char_2_G_d;
       4'd3:Char_G_d <= Char_3_G_d;
       4'd4:Char_G_d <= Char_4_G_d;
       4'd5:Char_G_d <= Char_5_G_d;
       4'd6:Char_G_d <= Char_6_G_d;
       4'd7:Char_G_d <= Char_7_G_d;
       4'd8:Char_G_d <= Char_8_G_d;
       4'd9:Char_G_d <= Char_9_G_d;
       endcase
       end
       reg[0:15] Char_G_u;
       always@(*)begin
       case (G_u)
       4'd0:Char_G_u <= Char_0_G_u;
       4'd1:Char_G_u <= Char_1_G_u;
       4'd2:Char_G_u <= Char_2_G_u;
       4'd3:Char_G_u <= Char_3_G_u;
       4'd4:Char_G_u <= Char_4_G_u;
       4'd5:Char_G_u <= Char_5_G_u;
       4'd6:Char_G_u <= Char_6_G_u;
       4'd7:Char_G_u <= Char_7_G_u;
       4'd8:Char_G_u <= Char_8_G_u;
       4'd9:Char_G_u <= Char_9_G_u;
       endcase
       end     
       
          reg[0:15] Char_B_h;
       always@(*)begin
       case (B_h)
       4'd0:Char_B_h <= Char_0_B_h;
       4'd1:Char_B_h <= Char_1_B_h;
       4'd2:Char_B_h <= Char_2_B_h;
       4'd3:Char_B_h <= Char_3_B_h;
       4'd4:Char_B_h <= Char_4_B_h;
       4'd5:Char_B_h <= Char_5_B_h;
       4'd6:Char_B_h <= Char_6_B_h;
       4'd7:Char_B_h <= Char_7_B_h;
       4'd8:Char_B_h <= Char_8_B_h;
       4'd9:Char_B_h <= Char_9_B_h;
       endcase
       end
        reg[0:15] Char_B_d;
       always@(*)begin
       case (B_d)
       4'd0:Char_B_d <= Char_0_B_d;
       4'd1:Char_B_d <= Char_1_B_d;
       4'd2:Char_B_d <= Char_2_B_d;
       4'd3:Char_B_d <= Char_3_B_d;
       4'd4:Char_B_d <= Char_4_B_d;
       4'd5:Char_B_d <= Char_5_B_d;
       4'd6:Char_B_d <= Char_6_B_d;
       4'd7:Char_B_d <= Char_7_B_d;
       4'd8:Char_B_d <= Char_8_B_d;
       4'd9:Char_B_d <= Char_9_B_d;
       endcase
       end
       reg[0:15] Char_B_u;
       always@(*)begin
       case (B_u)
       4'd0:Char_B_u <= Char_0_B_u;
       4'd1:Char_B_u <= Char_1_B_u;
       4'd2:Char_B_u <= Char_2_B_u;
       4'd3:Char_B_u <= Char_3_B_u;
       4'd4:Char_B_u <= Char_4_B_u;
       4'd5:Char_B_u <= Char_5_B_u;
       4'd6:Char_B_u <= Char_6_B_u;
       4'd7:Char_B_u <= Char_7_B_u;
       4'd8:Char_B_u <= Char_8_B_u;
       4'd9:Char_B_u <= Char_9_B_u;
       endcase
       end  
       
       

    wire[0:15] Char_9_R_h,Char_9_R_d,Char_9_R_u;
    wire[0:15] Char_9_G_h,Char_9_G_d,Char_9_G_u;
    wire[0:15] Char_9_B_h,Char_9_B_d,Char_9_B_u;
    
    prom_9 u_prom_9(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_9_R_h),
    .Char_R_d(Char_9_R_d),
    .Char_R_u(Char_9_R_u),
    
    .Char_G_h(Char_9_G_h),
    .Char_G_d(Char_9_G_d),
    .Char_G_u(Char_9_G_u),
    
    .Char_B_h(Char_9_B_h),
    .Char_B_d(Char_9_B_d),
    .Char_B_u(Char_9_B_u)
    );
    
    wire[0:15] Char_8_R_h,Char_8_R_d,Char_8_R_u;
    wire[0:15] Char_8_G_h,Char_8_G_d,Char_8_G_u;
    wire[0:15] Char_8_B_h,Char_8_B_d,Char_8_B_u;
    
    prom_8 u_prom_8(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_8_R_h),
    .Char_R_d(Char_8_R_d),
    .Char_R_u(Char_8_R_u),
    
    .Char_G_h(Char_8_G_h),
    .Char_G_d(Char_8_G_d),
    .Char_G_u(Char_8_G_u),
    
    .Char_B_h(Char_8_B_h),
    .Char_B_d(Char_8_B_d),
    .Char_B_u(Char_8_B_u)
    );
    
    wire[0:15] Char_7_R_h,Char_7_R_d,Char_7_R_u;
    wire[0:15] Char_7_G_h,Char_7_G_d,Char_7_G_u;
    wire[0:15] Char_7_B_h,Char_7_B_d,Char_7_B_u;
    
    prom_7 u_prom_7(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_7_R_h),
    .Char_R_d(Char_7_R_d),
    .Char_R_u(Char_7_R_u),
    
    .Char_G_h(Char_7_G_h),
    .Char_G_d(Char_7_G_d),
    .Char_G_u(Char_7_G_u),
    
    .Char_B_h(Char_7_B_h),
    .Char_B_d(Char_7_B_d),
    .Char_B_u(Char_7_B_u)
    );
    
    wire[0:15] Char_6_R_h,Char_6_R_d,Char_6_R_u;
    wire[0:15] Char_6_G_h,Char_6_G_d,Char_6_G_u;
    wire[0:15] Char_6_B_h,Char_6_B_d,Char_6_B_u;
    
    prom_6 u_prom_6(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_6_R_h),
    .Char_R_d(Char_6_R_d),
    .Char_R_u(Char_6_R_u),
    
    .Char_G_h(Char_6_G_h),
    .Char_G_d(Char_6_G_d),
    .Char_G_u(Char_6_G_u),
    
    .Char_B_h(Char_6_B_h),
    .Char_B_d(Char_6_B_d),
    .Char_B_u(Char_6_B_u)
    );
    
    wire[0:15] Char_5_R_h,Char_5_R_d,Char_5_R_u;
    wire[0:15] Char_5_G_h,Char_5_G_d,Char_5_G_u;
    wire[0:15] Char_5_B_h,Char_5_B_d,Char_5_B_u;
    
    prom_5 u_prom_5(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_5_R_h),
    .Char_R_d(Char_5_R_d),
    .Char_R_u(Char_5_R_u),
    
    .Char_G_h(Char_5_G_h),
    .Char_G_d(Char_5_G_d),
    .Char_G_u(Char_5_G_u),
    
    .Char_B_h(Char_5_B_h),
    .Char_B_d(Char_5_B_d),
    .Char_B_u(Char_5_B_u)
    );
    
    wire[0:15] Char_4_R_h,Char_4_R_d,Char_4_R_u;
    wire[0:15] Char_4_G_h,Char_4_G_d,Char_4_G_u;
    wire[0:15] Char_4_B_h,Char_4_B_d,Char_4_B_u;
    
    prom_4 u_prom_4(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_4_R_h),
    .Char_R_d(Char_4_R_d),
    .Char_R_u(Char_4_R_u),
    
    .Char_G_h(Char_4_G_h),
    .Char_G_d(Char_4_G_d),
    .Char_G_u(Char_4_G_u),
    
    .Char_B_h(Char_4_B_h),
    .Char_B_d(Char_4_B_d),
    .Char_B_u(Char_4_B_u)
    );
    
    wire[0:15] Char_3_R_h,Char_3_R_d,Char_3_R_u;
    wire[0:15] Char_3_G_h,Char_3_G_d,Char_3_G_u;
    wire[0:15] Char_3_B_h,Char_3_B_d,Char_3_B_u;
    
    prom_3 u_prom_3(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_3_R_h),
    .Char_R_d(Char_3_R_d),
    .Char_R_u(Char_3_R_u),
    
    .Char_G_h(Char_3_G_h),
    .Char_G_d(Char_3_G_d),
    .Char_G_u(Char_3_G_u),
    
    .Char_B_h(Char_3_B_h),
    .Char_B_d(Char_3_B_d),
    .Char_B_u(Char_3_B_u)
    );
    
    wire[0:15] Char_2_R_h,Char_2_R_d,Char_2_R_u;
    wire[0:15] Char_2_G_h,Char_2_G_d,Char_2_G_u;
    wire[0:15] Char_2_B_h,Char_2_B_d,Char_2_B_u;
    
    prom_2 u_prom_2(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_2_R_h),
    .Char_R_d(Char_2_R_d),
    .Char_R_u(Char_2_R_u),
    
    .Char_G_h(Char_2_G_h),
    .Char_G_d(Char_2_G_d),
    .Char_G_u(Char_2_G_u),
    
    .Char_B_h(Char_2_B_h),
    .Char_B_d(Char_2_B_d),
    .Char_B_u(Char_2_B_u)
    );
    
    wire[0:15] Char_1_R_h,Char_1_R_d,Char_1_R_u;
    wire[0:15] Char_1_G_h,Char_1_G_d,Char_1_G_u;
    wire[0:15] Char_1_B_h,Char_1_B_d,Char_1_B_u;
    
    prom_1 u_prom_1(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_1_R_h),
    .Char_R_d(Char_1_R_d),
    .Char_R_u(Char_1_R_u),
    
    .Char_G_h(Char_1_G_h),
    .Char_G_d(Char_1_G_d),
    .Char_G_u(Char_1_G_u),
    
    .Char_B_h(Char_1_B_h),
    .Char_B_d(Char_1_B_d),
    .Char_B_u(Char_1_B_u)
    );
    
    wire[0:15] Char_0_R_h,Char_0_R_d,Char_0_R_u;
    wire[0:15] Char_0_G_h,Char_0_G_d,Char_0_G_u;
    wire[0:15] Char_0_B_h,Char_0_B_d,Char_0_B_u;
    
    prom_0 u_prom_0(
    .addr_R_h(addr_R_h),
    .addr_R_d(addr_R_d),
    .addr_R_u(addr_R_u),
    .addr_G_h(addr_G_h),
    .addr_G_d(addr_G_d),
    .addr_G_u(addr_G_u),
    .addr_B_h(addr_B_h),
    .addr_B_d(addr_B_d),
    .addr_B_u(addr_B_u),
    
    .Char_R_h(Char_0_R_h),
    .Char_R_d(Char_0_R_d),
    .Char_R_u(Char_0_R_u),
    
    .Char_G_h(Char_0_G_h),
    .Char_G_d(Char_0_G_d),
    .Char_G_u(Char_0_G_u),
    
    .Char_B_h(Char_0_B_h),
    .Char_B_d(Char_0_B_d),
    .Char_B_u(Char_0_B_u)
    );
    wire[3:0] addr_char_R;
    wire[0:15] Char_R;
    prom_R u_prom_R(
    .addr(addr_char_R),
    .Char(Char_R)
    );    
    wire[3:0] addr_char_G;
    wire[0:15] Char_G;
    prom_G u_prom_G(
    .addr(addr_char_G),
    .Char(Char_G)
    ); 
    wire[3:0] addr_char_B;
    wire[0:15] Char_B;
    prom_B u_prom_B(
    .addr(addr_char_B),
    .Char(Char_B)
    ); 
    
    
endmodule
