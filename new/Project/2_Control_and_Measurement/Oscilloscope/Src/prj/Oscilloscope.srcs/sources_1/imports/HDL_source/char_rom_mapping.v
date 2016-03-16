`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2015 02:56:00 PM
// Design Name: 
// Module Name: char_rom_mapping
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


module char_rom_mapping(
input wire[3:0] fre_num_u,//unit
input wire[3:0] fre_num_d,//decade
input wire[3:0] fre_num_h,//hundreds 
input wire[3:0] fre_num_t,//thousand
input wire[3:0] fre_num_m,//myria
input wire[3:0] fre_num_l,//lac
input wire[3:0] vopp_num_h,
input wire[3:0] vopp_num_d,
input wire[3:0] vopp_num_u,




input wire[3:0] fre_addr_u,
input wire[3:0] fre_addr_d,
input wire[3:0] fre_addr_h,
input wire[3:0] fre_addr_t,
input wire[3:0] fre_addr_m,
input wire[3:0] fre_addr_l,
input wire[3:0] vopp_addr_h,
input wire[3:0] vopp_addr_d,
input wire[3:0] vopp_addr_u,




output reg[0:15] rom_fre_u,
output reg[0:15] rom_fre_d,
output reg[0:15] rom_fre_h,
output reg[0:15] rom_fre_t,
output reg[0:15] rom_fre_m,
output reg[0:15] rom_fre_l,
output reg[0:15] rom_vopp_h,
output reg[0:15] rom_vopp_d,
output reg[0:15] rom_vopp_u



);

reg[0:15]rom0[0:15];
parameter data0={
16'b0111111111111110,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0111111111111110
};


reg[0:15]rom1[0:15];
parameter data1={
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000,//
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000,//
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000,//
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000,
16'b0000000110000000
};

reg[0:15]rom2[0:15];
parameter data2={
16'b0000011111110000,
16'b0001000000001000,
16'b0010000000000100,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000100,
16'b0000000000001000,
16'b0000000000010000,
16'b0000000000100000,
16'b0000000001000000,
16'b0000000010000000,
16'b0000000100000000,
16'b0000001000000000,
16'b0000010000000000,
16'b0000100000000000,
16'b0011111111111110
};

reg[0:15]rom3[0:15];
parameter data3={
16'b0000011111110000,
16'b0001000000001000,
16'b0010000000000100,
16'b0000000000000010,//
16'b0000000000000010,
16'b0000000000000100,
16'b0000000000001000,
16'b0000000000100000,//
16'b0000000000001000,
16'b0000000000000100,
16'b0000000000000010,
16'b0000000000000010,//
16'b0100000000000100,
16'b0010000000001000,
16'b0001000000010000,
16'b0000011111100000
};

reg[0:15]rom4[0:15];
parameter data4={
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0111111111111110,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010
};

reg[0:15]rom5[0:15];
parameter data5={
16'b0111111111111110,
16'b0100000000000000,
16'b0100000000000000,
16'b0100000000000000,
16'b0100000000000000,
16'b0100000000000000,
16'b0100011111000000,
16'b0101100000100000,
16'b0110000000010000,
16'b0000000000001000,
16'b0000000000000100,
16'b0100000000000010,
16'b0010000000000100,
16'b0001000000001000,
16'b0000100000010000,
16'b0000011111100000
};

 reg[0:15]rom6[0:15];
parameter data6={
16'b0000000100000000,
16'b0000001000000000,
16'b0000010000000000,
16'b0000100000000000,
16'b0001000000000000,
16'b0010000000000000,
16'b0100011111000000,
16'b0101100000100000,
16'b0110000000010000,
16'b0100000000001000,
16'b0100000000000100,
16'b0100000000000010,
16'b0010000000000100,
16'b0001000000001000,
16'b0000100000010000,
16'b0000011111100000
};

reg[0:15]rom7[0:15];
parameter data7={
16'b0111111111111110,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010
};

reg[0:15]rom8[0:15];
parameter data8={
16'b0111111111111110,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0111111111111110,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0111111111111110
};

reg[0:15]rom9[0:15];
parameter data9={
16'b0111111111111110,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0100000000000010,
16'b0111111111111110,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0000000000000010,
16'b0111111111111110
};
integer i,j,k,l,m,n,o,p,q,r;
initial
 begin
  for(i=0;i<16;i=i+1)
    rom0[i]=data0[(255-16*i)-:16];
 end
 
 initial
 begin
  for(j=0;j<16;j=j+1)
    rom1[j]=data1[(255-16*j)-:16];
	 end
initial
 begin
  for(k=0;k<16;k=k+1)
    rom2[k]=data2[(255-16*k)-:16];
	 end
	 initial
 begin
  for(l=0;l<16;l=l+1)
    rom3[l]=data3[(255-16*l)-:16];
	 end
	 initial
 begin
  for(m=0;m<16;m=m+1)
    rom4[m]=data4[(255-16*m)-:16];
	 end
	 initial
 begin
  for(n=0;n<16;n=n+1)
    rom5[n]=data5[(255-16*n)-:16];
	 end
	 initial
 begin
  for(o=0;o<16;o=o+1)
    rom6[o]=data6[(255-16*o)-:16];
	 end
	 initial
 begin
  for(p=0;p<16;p=p+1)
    rom7[p]=data7[(255-16*p)-:16];
	 end
	initial
 begin
  for(q=0;q<16;q=q+1)
    rom8[q]=data8[(255-16*q)-:16];
	 end
	initial
 begin
  for(r=0;r<16;r=r+1)
    rom9[r]=data9[(255-16*r)-:16];
	 end


always@(*)
 begin
  case (fre_num_d)
   4'b0000:rom_fre_d=rom0[fre_addr_d];
	4'b0001:rom_fre_d=rom1[fre_addr_d];
   4'b0010:rom_fre_d=rom2[fre_addr_d];
   4'b0011:rom_fre_d=rom3[fre_addr_d];
   4'b0100:rom_fre_d=rom4[fre_addr_d];
   4'b0101:rom_fre_d=rom5[fre_addr_d];
   4'b0110:rom_fre_d=rom6[fre_addr_d];
   4'b0111:rom_fre_d=rom7[fre_addr_d];
   4'b1000:rom_fre_d=rom8[fre_addr_d];
   4'b1001:rom_fre_d=rom9[fre_addr_d];


 endcase
 end
 

always@(*)
 begin
  case (fre_num_u)
   4'b0000:rom_fre_u=rom0[fre_addr_u];
	4'b0001:rom_fre_u=rom1[fre_addr_u];
   4'b0010:rom_fre_u=rom2[fre_addr_u];
   4'b0011:rom_fre_u=rom3[fre_addr_u];
   4'b0100:rom_fre_u=rom4[fre_addr_u];
   4'b0101:rom_fre_u=rom5[fre_addr_u];
   4'b0110:rom_fre_u=rom6[fre_addr_u];
   4'b0111:rom_fre_u=rom7[fre_addr_u];
   4'b1000:rom_fre_u=rom8[fre_addr_u];
   4'b1001:rom_fre_u=rom9[fre_addr_u];


 endcase
 end
  
always@(*)
 begin
  case (fre_num_h)
   4'b0000:rom_fre_h=rom0[fre_addr_h];
	4'b0001:rom_fre_h=rom1[fre_addr_h];
   4'b0010:rom_fre_h=rom2[fre_addr_h];
   4'b0011:rom_fre_h=rom3[fre_addr_h];
   4'b0100:rom_fre_h=rom4[fre_addr_h];
   4'b0101:rom_fre_h=rom5[fre_addr_h];
   4'b0110:rom_fre_h=rom6[fre_addr_h];
   4'b0111:rom_fre_h=rom7[fre_addr_h];
   4'b1000:rom_fre_h=rom8[fre_addr_h];
   4'b1001:rom_fre_h=rom9[fre_addr_h];

 endcase
 end 

always@(*)
 begin
  case (fre_num_t)
   4'b0000:rom_fre_t=rom0[fre_addr_t];
	4'b0001:rom_fre_t=rom1[fre_addr_t];
   4'b0010:rom_fre_t=rom2[fre_addr_t];
   4'b0011:rom_fre_t=rom3[fre_addr_t];
   4'b0100:rom_fre_t=rom4[fre_addr_t];
   4'b0101:rom_fre_t=rom5[fre_addr_t];
   4'b0110:rom_fre_t=rom6[fre_addr_t];
   4'b0111:rom_fre_t=rom7[fre_addr_t];
   4'b1000:rom_fre_t=rom8[fre_addr_t];
   4'b1001:rom_fre_t=rom9[fre_addr_t];

 endcase
 end 

always@(*)
 begin
  case (fre_num_m)
   4'b0000:rom_fre_m=rom0[fre_addr_m];
	4'b0001:rom_fre_m=rom1[fre_addr_m];
   4'b0010:rom_fre_m=rom2[fre_addr_m];
   4'b0011:rom_fre_m=rom3[fre_addr_m];
   4'b0100:rom_fre_m=rom4[fre_addr_m];
   4'b0101:rom_fre_m=rom5[fre_addr_m];
   4'b0110:rom_fre_m=rom6[fre_addr_m];
   4'b0111:rom_fre_m=rom7[fre_addr_m];
   4'b1000:rom_fre_m=rom8[fre_addr_m];
   4'b1001:rom_fre_m=rom9[fre_addr_m];

 endcase
 end 

always@(*)
 begin
  case (fre_num_l)
   4'b0000:rom_fre_l=rom0[fre_addr_l];
	4'b0001:rom_fre_l=rom1[fre_addr_l];
   4'b0010:rom_fre_l=rom2[fre_addr_l];
   4'b0011:rom_fre_l=rom3[fre_addr_l];
   4'b0100:rom_fre_l=rom4[fre_addr_l];
   4'b0101:rom_fre_l=rom5[fre_addr_l];
   4'b0110:rom_fre_l=rom6[fre_addr_l];
   4'b0111:rom_fre_l=rom7[fre_addr_l];
   4'b1000:rom_fre_l=rom8[fre_addr_l];
   4'b1001:rom_fre_l=rom9[fre_addr_l];

 endcase
 end 

always@(*)
 begin
  case (vopp_num_h)
   4'b0000:rom_vopp_h=rom0[vopp_addr_h];
	4'b0001:rom_vopp_h=rom1[vopp_addr_h];
   4'b0010:rom_vopp_h=rom2[vopp_addr_h];
   4'b0011:rom_vopp_h=rom3[vopp_addr_h];
   4'b0100:rom_vopp_h=rom4[vopp_addr_h];
   4'b0101:rom_vopp_h=rom5[vopp_addr_h];
   4'b0110:rom_vopp_h=rom6[vopp_addr_h];
   4'b0111:rom_vopp_h=rom7[vopp_addr_h];
   4'b1000:rom_vopp_h=rom8[vopp_addr_h];
   4'b1001:rom_vopp_h=rom9[vopp_addr_h];

 endcase
 end 

always@(*)
 begin
  case (vopp_num_d)
   4'b0000:rom_vopp_d=rom0[vopp_addr_d];
	4'b0001:rom_vopp_d=rom1[vopp_addr_d];
   4'b0010:rom_vopp_d=rom2[vopp_addr_d];
   4'b0011:rom_vopp_d=rom3[vopp_addr_d];
   4'b0100:rom_vopp_d=rom4[vopp_addr_d];
   4'b0101:rom_vopp_d=rom5[vopp_addr_d];
   4'b0110:rom_vopp_d=rom6[vopp_addr_d];
   4'b0111:rom_vopp_d=rom7[vopp_addr_d];
   4'b1000:rom_vopp_d=rom8[vopp_addr_d];
   4'b1001:rom_vopp_d=rom9[vopp_addr_d];

 endcase
 end 

always@(*)
 begin
  case (vopp_num_u)
   4'b0000:rom_vopp_u=rom0[vopp_addr_u];
	4'b0001:rom_vopp_u=rom1[vopp_addr_u];
   4'b0010:rom_vopp_u=rom2[vopp_addr_u];
   4'b0011:rom_vopp_u=rom3[vopp_addr_u];
   4'b0100:rom_vopp_u=rom4[vopp_addr_u];
   4'b0101:rom_vopp_u=rom5[vopp_addr_u];
   4'b0110:rom_vopp_u=rom6[vopp_addr_u];
   4'b0111:rom_vopp_u=rom7[vopp_addr_u];
   4'b1000:rom_vopp_u=rom8[vopp_addr_u];
   4'b1001:rom_vopp_u=rom9[vopp_addr_u];

 endcase
 end 
endmodule
