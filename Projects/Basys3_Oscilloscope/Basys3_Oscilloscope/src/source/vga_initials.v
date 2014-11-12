module vga_initials(
input wire vidon,
input wire[9:0]hc,
input wire[9:0]vc,
input wire[0:127]M,
input wire[0:63]F,

input wire[0:15]F_ge,
input wire[0:15]F_shi,
input wire[0:15]F_bai,
input wire[0:15]F_qian,
input wire[0:15]F_wan,
input wire[0:15]F_shiwan,
input wire[0:15]F_opp_ge,
input wire[0:15]F_opp_shi,
input wire[0:15]F_opp_bai,


//output wire[7:0]rom_addr8,
output reg[2:0]red,
output reg[2:0]green,
output reg[1:0]blue,
output wire[3:0]ra_addr_Fge,
output wire[3:0]ra_addr_Fshi,
output wire[3:0]ra_addr_Fbai,
output wire[3:0]ra_addr_Fqian,
output wire[3:0]ra_addr_Fwan,
output wire[3:0]ra_addr_Fshiwan,
output wire[3:0]ra_addr_F_opp_bai,
output wire[3:0]ra_addr_F_opp_shi,
output wire[3:0]ra_addr_F_opp_ge,


output wire[5:0]rom_addr4,

output wire[9:0]addr_out

);



parameter hbp=10'b0010010000;
parameter vbp=10'b0000011111;

parameter W=600;
parameter H=128;
parameter W_F=64;
parameter H_F=64;

parameter W_Fge=16;
parameter H_Fge=16;
parameter W_Fshi=16;
parameter H_Fshi=16;
parameter W_Fbai=16;
parameter H_Fbai=16;
parameter W_Fqian=16;
parameter H_Fqian=16;
parameter W_Fwan=16;
parameter H_Fwan=16;
parameter W_Fshiwan=16;
parameter H_Fshiwan=16;
parameter W_Fopp_bai=16;
parameter H_Fopp_bai=16;
parameter W_Fopp_shi=16;
parameter H_Fopp_shi=16;
parameter W_Fopp_ge=16;
parameter H_Fopp_ge=16;

wire[10:0]C1,R1,C1b,R1b,C2,R2,C2b,R2b,CF0,RF0,CF1,RF1,CF2,RF2,CF3,RF3,CF4,RF4,CF5,RF5;
wire[10:0]CF_opp_bai,RF_opp_bai,CF_opp_shi,RF_opp_shi,CF_opp_ge,RF_opp_ge;
wire[10:0]rom_pix_Fge,addr_Fge,rom_pix_Fshi,addr_Fshi,rom_pix_Fbai,addr_Fbai,rom_pix_Fqian,addr_Fqian,rom_pix_Fwan,addr_Fwan,rom_pix_Fshiwan,addr_Fshiwan;
wire[10:0]rom_pix_F_opp_bai,addr_F_opp_bai,rom_pix_F_opp_shi,addr_F_opp_shi,rom_pix_F_opp_ge,addr_F_opp_ge;
wire[10:0]rom_addr,addr4,rom_pix,rom_pix4;
reg spriteon,spriteon_F,spriteon_HZ,spriteon_Fge, spriteon_Fshi,spriteon_Fbai,spriteon_Fqian,spriteon_Fwan,spriteon_Fshiwan,spriteon_Fopp_bai,spriteon_Fopp_shi,spriteon_Fopp_ge,R,G,B;
assign C1={2'b00,4'b0000,5'b00000};//波形
assign R1={2'b00,4'b0100,5'b00010};

assign C2={2'b00,4'b0000,5'b00010};//"F""Vpp"
assign R2={2'b00,4'b0000,5'b00001};

assign CF5={2'b00,4'b0010,5'b00010};//shiwan位
assign RF5={2'b00,4'b0000,5'b10001};

assign CF4={2'b00,4'b0010,5'b10010};//wan位1
assign RF4={2'b00,4'b0000,5'b10001};

assign CF3={2'b00,4'b0011,5'b00010};//qian
assign RF3={2'b00,4'b0000,5'b10001};

assign CF2={2'b00,4'b0011,5'b10010};
assign RF2={2'b00,4'b0000,5'b10001};

assign CF1={2'b00,4'b0100,5'b00010};
assign RF1={2'b00,4'b0000,5'b10001};

assign CF0={2'b00,4'b0100,5'b10010};
assign RF0={2'b00,4'b0000,5'b10001};

assign CF_opp_bai={2'b00,4'b0010,5'b00010};
assign RF_opp_bai={2'b00,4'b0001,5'b10001};

assign CF_opp_shi={2'b00,4'b0010,5'b10010};
assign RF_opp_shi={2'b00,4'b0001,5'b10001};

assign CF_opp_ge={2'b00,4'b0011,5'b00010};
assign RF_opp_ge={2'b00,4'b0001,5'b10001};


assign rom_pix=vc-vbp-R1;//显示波形
assign rom_addr[9:0]=hc-hbp-C1;
assign addr_out=rom_addr[9:0];

assign rom_pix4=hc-hbp-C2;//显示"F"和"Vpp"
assign addr4=vc-vbp-R2;
assign rom_addr4=addr4[5:0];

assign rom_pix_Fge=hc-hbp-CF0;//显示频率值得个位
assign addr_Fge=vc-vbp-RF0;
assign ra_addr_Fge=addr_Fge[3:0];

assign rom_pix_Fshi=hc-hbp-CF1;
assign addr_Fshi=vc-vbp-RF1;
assign ra_addr_Fshi=addr_Fshi[3:0];

assign rom_pix_Fbai=hc-hbp-CF2;
assign addr_Fbai=vc-vbp-RF2;
assign ra_addr_Fbai=addr_Fbai[3:0];

assign rom_pix_Fqian=hc-hbp-CF3;
assign addr_Fqian=vc-vbp-RF3;
assign ra_addr_Fqian=addr_Fqian[3:0];

assign rom_pix_Fwan=hc-hbp-CF4;
assign addr_Fwan=vc-vbp-RF4;
assign ra_addr_Fwan=addr_Fwan[3:0];

assign rom_pix_Fshiwan=hc-hbp-CF5;
assign addr_Fshiwan=vc-vbp-RF5;
assign ra_addr_Fshiwan=addr_Fshiwan[3:0];

assign rom_pix_F_opp_bai=hc-hbp-CF_opp_bai;
assign addr_F_opp_bai=vc-vbp-RF_opp_bai;
assign ra_addr_F_opp_bai=addr_F_opp_bai[3:0];

assign rom_pix_F_opp_shi=hc-hbp-CF_opp_shi;
assign addr_F_opp_shi=vc-vbp-RF_opp_shi;
assign ra_addr_F_opp_shi=addr_F_opp_shi[3:0];

assign rom_pix_F_opp_ge=hc-hbp-CF_opp_ge;
assign addr_F_opp_ge=vc-vbp-RF_opp_ge;
assign ra_addr_F_opp_ge=addr_F_opp_ge[3:0];


always@(*)
 begin
  if((hc>=0)&&(hc<hbp+W)&&(vc>=R1+vbp)&&(vc<R1+vbp+H))
   spriteon=1;
  else
   spriteon=0;
 end



always@(*)
 begin
 if((hc>=C2+hbp)&&(hc<C2+hbp+W_F)&&(vc>=R2+vbp)&&(vc<R2+vbp+H_F))
   spriteon_F=1;
  else
   spriteon_F=0;
 end



always@(*)
 begin
 if((hc>=CF0+hbp)&&(hc<CF0+hbp+W_Fge)&&(vc>=RF0+vbp)&&(vc<RF0+vbp+H_Fge))
   spriteon_Fge=1;
  else
   spriteon_Fge=0;
 end

always@(*)
 begin
 if((hc>=CF1+hbp)&&(hc<CF1+hbp+W_Fshi)&&(vc>=RF1+vbp)&&(vc<RF1+vbp+H_Fshi))
   spriteon_Fshi=1;
  else
   spriteon_Fshi=0;
 end
 
always@(*)
 begin
 if((hc>=CF2+hbp)&&(hc<CF2+hbp+W_Fbai)&&(vc>=RF2+vbp)&&(vc<RF2+vbp+H_Fbai))
   spriteon_Fbai=1;
  else
   spriteon_Fbai=0;
 end
 
 always@(*)
 begin
 if((hc>=CF3+hbp)&&(hc<CF3+hbp+W_Fqian)&&(vc>=RF3+vbp)&&(vc<RF3+vbp+H_Fqian))
   spriteon_Fqian=1;
  else
   spriteon_Fqian=0;
 end
 
 always@(*)
 begin
 if((hc>=CF4+hbp)&&(hc<CF4+hbp+W_Fwan)&&(vc>=RF4+vbp)&&(vc<RF4+vbp+H_Fwan))
   spriteon_Fwan=1;
  else
   spriteon_Fwan=0;
 end
 
  always@(*)
 begin
 if((hc>=CF5+hbp)&&(hc<CF5+hbp+W_Fshiwan)&&(vc>=RF5+vbp)&&(vc<RF5+vbp+H_Fshiwan))
   spriteon_Fshiwan=1;
  else
   spriteon_Fshiwan=0;
 end
 
  always@(*)
 begin
 if((hc>=CF_opp_bai+hbp)&&(hc<CF_opp_bai+hbp+W_Fopp_bai)&&(vc>=RF_opp_bai+vbp)&&(vc<RF_opp_bai+vbp+H_Fopp_bai))
   spriteon_Fopp_bai=1;
  else
   spriteon_Fopp_bai=0;
 end
 
   always@(*)
 begin
 if((hc>=CF_opp_shi+hbp)&&(hc<CF_opp_shi+hbp+W_Fopp_shi)&&(vc>=RF_opp_shi+vbp)&&(vc<RF_opp_shi+vbp+H_Fopp_shi))
   spriteon_Fopp_shi=1;
  else
   spriteon_Fopp_shi=0;
 end
 
   always@(*)
 begin
 if((hc>=CF_opp_ge+hbp)&&(hc<CF_opp_ge+hbp+W_Fopp_ge)&&(vc>=RF_opp_ge+vbp)&&(vc<RF_opp_ge+vbp+H_Fopp_ge))
   spriteon_Fopp_ge=1;
  else
   spriteon_Fopp_ge=0;
 end

always@(*)
 begin
  red=0;
  green=0;
  blue=0;
//  	  	 if((vc==161)||(vc==225)||(vc==289)||(vc==353)||(vc==417)||(vc==481))
//	 begin
//	  red<=3'b111;
//	  green<=3'b111;
//	  blue<=2'b11;
//	  end
//	 if(data_in <data_in_delay)begin
//       if(vc> (vc-vbp-R1 + data_in/2)&&vc< (vc-vbp-R1 + data_in_delay/2))begin
//        red<=3'b111;
//        green<=3'b111;
//       end
//      end
// 	 if(data_in >data_in_delay)begin
//        if(vc> (vc-vbp-R1 + data_in_delay/2)&&vc< (vc-vbp-R1 + data_in/2))begin
//         red<=3'b111;
//         green<=3'b111;
//        end
//       end     
  if((vidon==1)&&(spriteon_F==1))
    begin
//	  R =F[rom_pix4];
//	  G = F[rom_pix4];
    
	  red <={F[rom_pix4],F[rom_pix4],F[rom_pix4]};
	  green <={F[rom_pix4],F[rom_pix4],F[rom_pix4]};
//	  blue={B,B};
	 end

	 if((vidon==1)&&(spriteon==1))
	begin
	//  R =M[rom_pix];
//	  G =M[rom_pix];

	  red <={M[rom_pix],M[rom_pix],M[rom_pix]};
	  green <= {M[rom_pix],M[rom_pix],M[rom_pix]};
//	  blue={B,B};
	 end
	

	 if((vidon==1)&&(spriteon_Fge==1))
	begin
//	  R=F_ge[rom_pix_Fge];
//	  G=F_ge[rom_pix_Fge];
    
	  red<={F_ge[rom_pix_Fge],F_ge[rom_pix_Fge],F_ge[rom_pix_Fge]};
	  green<={F_ge[rom_pix_Fge],F_ge[rom_pix_Fge],F_ge[rom_pix_Fge]};
//	  blue={B,B};
	 end
	  if((vidon==1)&&(spriteon_Fshi==1))
	begin
//	  R=F_shi[rom_pix_Fshi];
//	  G=F_shi[rom_pix_Fshi];
    
	  red<={F_shi[rom_pix_Fshi],F_shi[rom_pix_Fshi],F_shi[rom_pix_Fshi]};
	  green<={F_shi[rom_pix_Fshi],F_shi[rom_pix_Fshi],F_shi[rom_pix_Fshi]};
//	  blue={B,B};
	 end  
	 if((vidon==1)&&(spriteon_Fbai==1))
	begin
//	  R=F_bai[rom_pix_Fbai];
//	  G=F_bai[rom_pix_Fbai];
    
	  red<={F_bai[rom_pix_Fbai],F_bai[rom_pix_Fbai],F_bai[rom_pix_Fbai]};
	  green<={F_bai[rom_pix_Fbai],F_bai[rom_pix_Fbai],F_bai[rom_pix_Fbai]};
//	  blue={B,B};
	 end
	 	  if((vidon==1)&&(spriteon_Fqian==1))
	begin
//	  R=F_qian[rom_pix_Fqian];
//	  G=F_qian[rom_pix_Fqian];
    
	  red<={F_qian[rom_pix_Fqian],F_qian[rom_pix_Fqian],F_qian[rom_pix_Fqian]};
	  green<={F_qian[rom_pix_Fqian],F_qian[rom_pix_Fqian],F_qian[rom_pix_Fqian]};
//	  blue={B,B};
	 end	 
	  	 if((vidon==1)&&(spriteon_Fwan==1))
	begin
	//  R=F_wan[rom_pix_Fwan];
	//  G=F_wan[rom_pix_Fwan];
    
	  red<={F_wan[rom_pix_Fwan],F_wan[rom_pix_Fwan],F_wan[rom_pix_Fwan]};
	  green<={F_wan[rom_pix_Fwan],F_wan[rom_pix_Fwan],F_wan[rom_pix_Fwan]};
//	  blue={B,B};
	 end
	  	 if((vidon==1)&&(spriteon_Fshiwan==1))
	begin
//	  R=F_shiwan[rom_pix_Fshiwan];
//	  G=F_shiwan[rom_pix_Fshiwan];
    
	  red<={F_shiwan[rom_pix_Fshiwan],F_shiwan[rom_pix_Fshiwan],F_shiwan[rom_pix_Fshiwan]};
	  green<={F_shiwan[rom_pix_Fshiwan],F_shiwan[rom_pix_Fshiwan],F_shiwan[rom_pix_Fshiwan]};
//	  blue={B,B};
	 end
	  if((vidon==1)&&(spriteon_Fopp_bai==1))
	begin
//	  R=F_opp_bai[rom_pix_F_opp_bai];
//	  G=F_opp_bai[rom_pix_F_opp_bai];
    
	  red<={F_opp_bai[rom_pix_F_opp_bai],F_opp_bai[rom_pix_F_opp_bai],F_opp_bai[rom_pix_F_opp_bai]};
	  green<={F_opp_bai[rom_pix_F_opp_bai],F_opp_bai[rom_pix_F_opp_bai],F_opp_bai[rom_pix_F_opp_bai]};
//	  blue={B,B};
	 end
 if((vidon==1)&&(spriteon_Fopp_shi==1))
	begin
	//  R=F_opp_shi[rom_pix_Fopp_shi];
//	  G=F_opp_shi[rom_pix_Fopp_shi];
    
	  red<={F_opp_shi[rom_pix_F_opp_shi],F_opp_shi[rom_pix_F_opp_shi],F_opp_shi[rom_pix_F_opp_shi]};
	  green<={F_opp_shi[rom_pix_F_opp_shi],F_opp_shi[rom_pix_F_opp_shi],F_opp_shi[rom_pix_F_opp_shi]};
//	  blue={B,B};
	 end	 
 if((vidon==1)&&(spriteon_Fopp_ge==1))
	begin

    
	  red<={F_opp_ge[rom_pix_F_opp_ge],F_opp_ge[rom_pix_F_opp_ge],F_opp_ge[rom_pix_F_opp_ge]};
	  green<={F_opp_ge[rom_pix_F_opp_ge],F_opp_ge[rom_pix_F_opp_ge],F_opp_ge[rom_pix_F_opp_ge]};
//	  blue={B,B};
	 end	 


end

endmodule
