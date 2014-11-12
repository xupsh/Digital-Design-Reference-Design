module pinlv_count(
input wire[3:0] aa_in_ge,
input wire[3:0] ba_in_shi,
input wire[3:0] ca_in_bai,
input wire[3:0] da_in_qian,
input wire[3:0] ea_in_wan,
input wire[3:0] fa_in_shiwan,
input wire[3:0] ga_in_opp_bai,
input wire[3:0] ha_in_opp_shi,
input wire[3:0] ha_in_opp_ge,




input wire[3:0] ad_ge,
input wire[3:0] ad_shi,
input wire[3:0] ad_bai,
input wire[3:0] ad_qian,
input wire[3:0] ad_wan,
input wire[3:0] ad_shiwan,
input wire[3:0] ad_opp_bai,
input wire[3:0] ad_opp_shi,
input wire[3:0] ad_opp_ge,




output reg[0:15] F_ge,
output reg[0:15] F_shi,
output reg[0:15] F_bai,
output reg[0:15] F_qian,
output reg[0:15] F_wan,
output reg[0:15] F_shiwan,
output reg[0:15] F_opp_bai,
output reg[0:15] F_opp_shi,
output reg[0:15] F_opp_ge



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
   // rom1[i]=data1[(255-16*i)-:16];
   // rom2[i]=data2[(255-16*i)-:16];
  //  rom3[i]=data3[(255-16*i)-:16];
  //  rom4[i]=data4[(255-16*i)-:16];
  //  rom5[i]=data5[(255-16*i)-:16];
  //  rom6[i]=data6[(255-16*i)-:16];
  //  rom7[i]=data7[(255-16*i)-:16];
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


always@(ba_in_shi,ad_shi,rom0[ad_shi],rom1[ad_shi],rom2[ad_shi],rom3[ad_shi],rom4[ad_shi],rom5[ad_shi],rom6[ad_shi],rom7[ad_shi],rom8[ad_shi],rom9[ad_shi])
 begin
  case (ba_in_shi)
   4'b0000:F_shi=rom0[ad_shi];
	4'b0001:F_shi=rom1[ad_shi];
   4'b0010:F_shi=rom2[ad_shi];
   4'b0011:F_shi=rom3[ad_shi];
   4'b0100:F_shi=rom4[ad_shi];
   4'b0101:F_shi=rom5[ad_shi];
   4'b0110:F_shi=rom6[ad_shi];
   4'b0111:F_shi=rom7[ad_shi];
   4'b1000:F_shi=rom8[ad_shi];
   4'b1001:F_shi=rom9[ad_shi];


 endcase
 end
 

always@(aa_in_ge,ad_ge,rom0[ad_ge],rom1[ad_ge],rom2[ad_ge],rom3[ad_ge],rom4[ad_ge],rom5[ad_ge],rom6[ad_ge],rom7[ad_ge],rom8[ad_ge],rom9[ad_ge])
 begin
  case (aa_in_ge)
   4'b0000:F_ge=rom0[ad_ge];
	4'b0001:F_ge=rom1[ad_ge];
   4'b0010:F_ge=rom2[ad_ge];
   4'b0011:F_ge=rom3[ad_ge];
   4'b0100:F_ge=rom4[ad_ge];
   4'b0101:F_ge=rom5[ad_ge];
   4'b0110:F_ge=rom6[ad_ge];
   4'b0111:F_ge=rom7[ad_ge];
   4'b1000:F_ge=rom8[ad_ge];
   4'b1001:F_ge=rom9[ad_ge];


 endcase
 end
  
always@(ca_in_bai,ad_bai,rom0[ad_bai],rom1[ad_bai],rom2[ad_bai],rom3[ad_bai],rom4[ad_bai],rom5[ad_bai],rom6[ad_bai],rom7[ad_bai],rom8[ad_bai],rom9[ad_bai])
 begin
  case (ca_in_bai)
   4'b0000:F_bai=rom0[ad_bai];
	4'b0001:F_bai=rom1[ad_bai];
   4'b0010:F_bai=rom2[ad_bai];
   4'b0011:F_bai=rom3[ad_bai];
   4'b0100:F_bai=rom4[ad_bai];
   4'b0101:F_bai=rom5[ad_bai];
   4'b0110:F_bai=rom6[ad_bai];
   4'b0111:F_bai=rom7[ad_bai];
   4'b1000:F_bai=rom8[ad_bai];
   4'b1001:F_bai=rom9[ad_bai];

 endcase
 end 

always@(da_in_qian,ad_qian,rom0[ad_qian],rom1[ad_qian],rom2[ad_qian],rom3[ad_qian],rom4[ad_qian],rom5[ad_qian],rom6[ad_qian],rom7[ad_qian],rom8[ad_qian],rom9[ad_qian])
 begin
  case (da_in_qian)
   4'b0000:F_qian=rom0[ad_qian];
	4'b0001:F_qian=rom1[ad_qian];
   4'b0010:F_qian=rom2[ad_qian];
   4'b0011:F_qian=rom3[ad_qian];
   4'b0100:F_qian=rom4[ad_qian];
   4'b0101:F_qian=rom5[ad_qian];
   4'b0110:F_qian=rom6[ad_qian];
   4'b0111:F_qian=rom7[ad_qian];
   4'b1000:F_qian=rom8[ad_qian];
   4'b1001:F_qian=rom9[ad_qian];

 endcase
 end 

always@(ea_in_wan,ad_wan,rom0[ad_wan],rom1[ad_wan],rom2[ad_wan],rom3[ad_wan],rom4[ad_wan],rom5[ad_wan],rom6[ad_wan],rom7[ad_wan],rom8[ad_wan],rom9[ad_wan])
 begin
  case (ea_in_wan)
   4'b0000:F_wan=rom0[ad_wan];
	4'b0001:F_wan=rom1[ad_wan];
   4'b0010:F_wan=rom2[ad_wan];
   4'b0011:F_wan=rom3[ad_wan];
   4'b0100:F_wan=rom4[ad_wan];
   4'b0101:F_wan=rom5[ad_wan];
   4'b0110:F_wan=rom6[ad_wan];
   4'b0111:F_wan=rom7[ad_wan];
   4'b1000:F_wan=rom8[ad_wan];
   4'b1001:F_wan=rom9[ad_wan];

 endcase
 end 

always@(fa_in_shiwan,ad_shiwan,rom0[ad_shiwan],rom1[ad_shiwan],rom2[ad_shiwan],rom3[ad_shiwan],rom4[ad_shiwan],rom5[ad_shiwan],rom6[ad_shiwan],rom7[ad_shiwan],rom8[ad_shiwan],rom9[ad_shiwan])
 begin
  case (fa_in_shiwan)
   4'b0000:F_shiwan=rom0[ad_shiwan];
	4'b0001:F_shiwan=rom1[ad_shiwan];
   4'b0010:F_shiwan=rom2[ad_shiwan];
   4'b0011:F_shiwan=rom3[ad_shiwan];
   4'b0100:F_shiwan=rom4[ad_shiwan];
   4'b0101:F_shiwan=rom5[ad_shiwan];
   4'b0110:F_shiwan=rom6[ad_shiwan];
   4'b0111:F_shiwan=rom7[ad_shiwan];
   4'b1000:F_shiwan=rom8[ad_shiwan];
   4'b1001:F_shiwan=rom9[ad_shiwan];

 endcase
 end 

always@(ga_in_opp_bai,ad_opp_bai,rom0[ad_opp_bai],rom1[ad_opp_bai],rom2[ad_opp_bai],rom3[ad_opp_bai],rom4[ad_opp_bai],rom5[ad_opp_bai],rom6[ad_opp_bai],rom7[ad_opp_bai],rom8[ad_opp_bai],rom9[ad_opp_bai])
 begin
  case (ga_in_opp_bai)
   4'b0000:F_opp_bai=rom0[ad_opp_bai];
	4'b0001:F_opp_bai=rom1[ad_opp_bai];
   4'b0010:F_opp_bai=rom2[ad_opp_bai];
   4'b0011:F_opp_bai=rom3[ad_opp_bai];
   4'b0100:F_opp_bai=rom4[ad_opp_bai];
   4'b0101:F_opp_bai=rom5[ad_opp_bai];
   4'b0110:F_opp_bai=rom6[ad_opp_bai];
   4'b0111:F_opp_bai=rom7[ad_opp_bai];
   4'b1000:F_opp_bai=rom8[ad_opp_bai];
   4'b1001:F_opp_bai=rom9[ad_opp_bai];

 endcase
 end 

always@(ha_in_opp_shi,ad_opp_shi,rom0[ad_opp_shi],rom1[ad_opp_shi],rom2[ad_opp_shi],rom3[ad_opp_shi],rom4[ad_opp_shi],rom5[ad_opp_shi],rom6[ad_opp_shi],rom7[ad_opp_shi],rom8[ad_opp_shi],rom9[ad_opp_shi])
 begin
  case (ha_in_opp_shi)
   4'b0000:F_opp_shi=rom0[ad_opp_shi];
	4'b0001:F_opp_shi=rom1[ad_opp_shi];
   4'b0010:F_opp_shi=rom2[ad_opp_shi];
   4'b0011:F_opp_shi=rom3[ad_opp_shi];
   4'b0100:F_opp_shi=rom4[ad_opp_shi];
   4'b0101:F_opp_shi=rom5[ad_opp_shi];
   4'b0110:F_opp_shi=rom6[ad_opp_shi];
   4'b0111:F_opp_shi=rom7[ad_opp_shi];
   4'b1000:F_opp_shi=rom8[ad_opp_shi];
   4'b1001:F_opp_shi=rom9[ad_opp_shi];

 endcase
 end 

always@(ha_in_opp_ge,ad_opp_ge,rom0[ad_opp_ge],rom1[ad_opp_ge],rom2[ad_opp_ge],rom3[ad_opp_ge],rom4[ad_opp_ge],rom5[ad_opp_ge],rom6[ad_opp_ge],rom7[ad_opp_ge],rom8[ad_opp_ge],rom9[ad_opp_ge])
 begin
  case (ha_in_opp_ge)
   4'b0000:F_opp_ge=rom0[ad_opp_ge];
	4'b0001:F_opp_ge=rom1[ad_opp_ge];
   4'b0010:F_opp_ge=rom2[ad_opp_ge];
   4'b0011:F_opp_ge=rom3[ad_opp_ge];
   4'b0100:F_opp_ge=rom4[ad_opp_ge];
   4'b0101:F_opp_ge=rom5[ad_opp_ge];
   4'b0110:F_opp_ge=rom6[ad_opp_ge];
   4'b0111:F_opp_ge=rom7[ad_opp_ge];
   4'b1000:F_opp_ge=rom8[ad_opp_ge];
   4'b1001:F_opp_ge=rom9[ad_opp_ge];

 endcase
 end 
endmodule

