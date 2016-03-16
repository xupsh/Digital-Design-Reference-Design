module vga_initials(
input wire vidon,
input wire[9:0]hcnt,
input wire[9:0]vcnt,
input wire[0:127]M,
input wire[0:63]F,

input wire[0:15]rom_fre_u,
input wire[0:15]rom_fre_d,
input wire[0:15]rom_fre_h,
input wire[0:15]rom_fre_t,
input wire[0:15]rom_fre_m,
input wire[0:15]rom_fre_l,
input wire[0:15]rom_vopp_u,
input wire[0:15]rom_vopp_d,
input wire[0:15]rom_vopp_h,


//output wire[7:0]rom_addr8,
output reg[2:0]red,
output reg[2:0]green,
output reg[1:0]blue,
output wire[3:0]addr_rom_fre_u,
output wire[3:0]addr_rom_fre_d,
output wire[3:0]addr_rom_fre_h,
output wire[3:0]addr_rom_fre_t,
output wire[3:0]addr_rom_fre_m,
output wire[3:0]addr_rom_fre_l,
output wire[3:0]addr_rom_vopp_h,
output wire[3:0]addr_rom_vopp_d,
output wire[3:0]addr_rom_vopp_u,


output wire[5:0]rom_addr4,

output wire[9:0]addr_out

);
wire[9:0]hc,vc;
assign hc = hcnt;
assign vc = vcnt;

//parameter hbp=10'b0010010000;
//parameter vbp=10'b0000011111;
parameter hbp=10'b0000000000;
parameter vbp=10'b0000011111;

parameter W=600;
parameter H=128;
parameter W_F=64;
parameter H_F=64;

parameter W_Fre_u=16;
parameter H_Fre_u=16;
parameter W_Fre_d=16;
parameter H_Fre_d=16;
parameter W_Fre_h=16;
parameter H_Fre_h=16;
parameter W_Fre_t=16;
parameter H_Fre_t=16;
parameter W_Fre_m=16;
parameter H_Fre_m=16;
parameter W_Fre_l=16;
parameter H_Fre_l=16;
parameter W_Vopp_h=16;
parameter H_Vopp_h=16;
parameter W_Vopp_d=16;
parameter H_Vopp_d=16;
parameter W_Vopp_u=16;
parameter H_Vopp_u=16;

wire[10:0]C1,R1,C1b,R1b,C2,R2,C2b,R2b,CF0,RF0,CF1,RF1,CF2,RF2,CF3,RF3,CF4,RF4,CF5,RF5;
wire[10:0]CVopp_h,RVopp_h,CVopp_d,RVopp_d,CVopp_u,RVopp_u;
wire[10:0]rom_pix_Fre_u,addr_Fre_u,rom_pix_Fre_d,addr_Fre_d,rom_pix_Fre_h,addr_Fre_h,rom_pix_Fre_t,addr_Fre_t,rom_pix_Fre_m,addr_Fre_m,rom_pix_Fre_l,addr_Fre_l;
wire[10:0]rom_pix_Vopp_h,addr_Vopp_h,rom_pix_Vopp_d,addr_Vopp_d,rom_pix_Vopp_u,addr_Vopp_u;
wire[10:0]rom_addr,addr4,rom_pix,rom_pix4;
reg spriteon,spriteon_F,spriteon_HZ,spriteon_Fre_u, spriteon_Fre_d,spriteon_Fre_h,spriteon_Fre_t,spriteon_Fre_m,spriteon_Fre_l,spriteon_Vopp_h,spriteon_Vopp_d,spriteon_Vopp_u,R,G,B;
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

assign CVopp_h={2'b00,4'b0010,5'b00010};
assign RVopp_h={2'b00,4'b0001,5'b10001};

assign CVopp_d={2'b00,4'b0010,5'b10010};
assign RVopp_d={2'b00,4'b0001,5'b10001};

assign CVopp_u={2'b00,4'b0011,5'b00010};
assign RVopp_u={2'b00,4'b0001,5'b10001};


assign rom_pix=vc-vbp-R1;//显示波形
assign rom_addr[9:0]=hc-hbp-C1;
assign addr_out=rom_addr[9:0];

assign rom_pix4=hc-hbp-C2;//显示"F"和"Vpp"
assign addr4=vc-vbp-R2;
assign rom_addr4=addr4[5:0];

assign rom_pix_Fre_u=hc-hbp-CF0;//显示频率值得个位
assign addr_Fre_u=vc-vbp-RF0;
assign addr_rom_fre_u=addr_Fre_u[3:0];

assign rom_pix_Fre_d=hc-hbp-CF1;
assign addr_Fre_d=vc-vbp-RF1;
assign addr_rom_fre_d=addr_Fre_d[3:0];

assign rom_pix_Fre_h=hc-hbp-CF2;
assign addr_Fre_h=vc-vbp-RF2;
assign addr_rom_fre_h=addr_Fre_h[3:0];

assign rom_pix_Fre_t=hc-hbp-CF3;
assign addr_Fre_t=vc-vbp-RF3;
assign addr_rom_fre_t=addr_Fre_t[3:0];

assign rom_pix_Fre_m=hc-hbp-CF4;
assign addr_Fre_m=vc-vbp-RF4;
assign addr_rom_fre_m=addr_Fre_m[3:0];

assign rom_pix_Fre_l=hc-hbp-CF5;
assign addr_Fre_l=vc-vbp-RF5;
assign addr_rom_fre_l=addr_Fre_l[3:0];

assign rom_pix_Vopp_h=hc-hbp-CVopp_h;
assign addr_Vopp_h=vc-vbp-RVopp_h;
assign addr_rom_vopp_h=addr_Vopp_h[3:0];

assign rom_pix_Vopp_d=hc-hbp-CVopp_d;
assign addr_Vopp_d=vc-vbp-RVopp_d;
assign addr_rom_vopp_d=addr_Vopp_d[3:0];

assign rom_pix_Vopp_u=hc-hbp-CVopp_u;
assign addr_Vopp_u=vc-vbp-RVopp_u;
assign addr_rom_vopp_u=addr_Vopp_u[3:0];


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
 if((hc>=CF0+hbp)&&(hc<CF0+hbp+W_Fre_u)&&(vc>=RF0+vbp)&&(vc<RF0+vbp+H_Fre_u))
   spriteon_Fre_u=1;
  else
   spriteon_Fre_u=0;
 end

always@(*)
 begin
 if((hc>=CF1+hbp)&&(hc<CF1+hbp+W_Fre_d)&&(vc>=RF1+vbp)&&(vc<RF1+vbp+H_Fre_d))
   spriteon_Fre_d=1;
  else
   spriteon_Fre_d=0;
 end
 
always@(*)
 begin
 if((hc>=CF2+hbp)&&(hc<CF2+hbp+W_Fre_h)&&(vc>=RF2+vbp)&&(vc<RF2+vbp+H_Fre_h))
   spriteon_Fre_h=1;
  else
   spriteon_Fre_h=0;
 end
 
 always@(*)
 begin
 if((hc>=CF3+hbp)&&(hc<CF3+hbp+W_Fre_t)&&(vc>=RF3+vbp)&&(vc<RF3+vbp+H_Fre_t))
   spriteon_Fre_t=1;
  else
   spriteon_Fre_t=0;
 end
 
 always@(*)
 begin
 if((hc>=CF4+hbp)&&(hc<CF4+hbp+W_Fre_m)&&(vc>=RF4+vbp)&&(vc<RF4+vbp+H_Fre_m))
   spriteon_Fre_m=1;
  else
   spriteon_Fre_m=0;
 end
 
  always@(*)
 begin
 if((hc>=CF5+hbp)&&(hc<CF5+hbp+W_Fre_l)&&(vc>=RF5+vbp)&&(vc<RF5+vbp+H_Fre_l))
   spriteon_Fre_l=1;
  else
   spriteon_Fre_l=0;
 end
 
  always@(*)
 begin
 if((hc>=CVopp_h+hbp)&&(hc<CVopp_h+hbp+W_Vopp_h)&&(vc>=RVopp_h+vbp)&&(vc<RVopp_h+vbp+H_Vopp_h))
   spriteon_Vopp_h=1;
  else
   spriteon_Vopp_h=0;
 end
 
   always@(*)
 begin
 if((hc>=CVopp_d+hbp)&&(hc<CVopp_d+hbp+W_Vopp_d)&&(vc>=RVopp_d+vbp)&&(vc<RVopp_d+vbp+H_Vopp_d))
   spriteon_Vopp_d=1;
  else
   spriteon_Vopp_d=0;
 end
 
   always@(*)
 begin
 if((hc>=CVopp_u+hbp)&&(hc<CVopp_u+hbp+W_Vopp_u)&&(vc>=RVopp_u+vbp)&&(vc<RVopp_u+vbp+H_Vopp_u))
   spriteon_Vopp_u=1;
  else
   spriteon_Vopp_u=0;
 end

always@(*)
 begin
  red=0;
  green=0;
  blue=0;
   
  if((vidon==1)&&(spriteon_F==1))
    begin
	  red <={F[rom_pix4],F[rom_pix4],F[rom_pix4]};
	  green <={F[rom_pix4],F[rom_pix4],F[rom_pix4]};
//	  blue={B,B};
	 end

	 if((vidon==1)&&(spriteon==1))
	begin
	  red <={M[rom_pix],M[rom_pix],M[rom_pix]};
	  green <= {M[rom_pix],M[rom_pix],M[rom_pix]};
//	  blue={B,B};
	 end

	 if((vidon==1)&&(spriteon_Fre_u==1))
	begin
	  red<={rom_fre_u[rom_pix_Fre_u],rom_fre_u[rom_pix_Fre_u],rom_fre_u[rom_pix_Fre_u]};
	  green<={rom_fre_u[rom_pix_Fre_u],rom_fre_u[rom_pix_Fre_u],rom_fre_u[rom_pix_Fre_u]};
//	  blue={B,B};
	 end
	  if((vidon==1)&&(spriteon_Fre_d==1))
	begin
	  red<={rom_fre_d[rom_pix_Fre_d],rom_fre_d[rom_pix_Fre_d],rom_fre_d[rom_pix_Fre_d]};
	  green<={rom_fre_d[rom_pix_Fre_d],rom_fre_d[rom_pix_Fre_d],rom_fre_d[rom_pix_Fre_d]};
//	  blue={B,B};
	 end  
	 if((vidon==1)&&(spriteon_Fre_h==1))
	begin
    	red<={rom_fre_h[rom_pix_Fre_h],rom_fre_h[rom_pix_Fre_h],rom_fre_h[rom_pix_Fre_h]};
	  green<={rom_fre_h[rom_pix_Fre_h],rom_fre_h[rom_pix_Fre_h],rom_fre_h[rom_pix_Fre_h]};
//	  blue={B,B};
	 end
	 	  if((vidon==1)&&(spriteon_Fre_t==1))
	begin
	  red<={rom_fre_t[rom_pix_Fre_t],rom_fre_t[rom_pix_Fre_t],rom_fre_t[rom_pix_Fre_t]};
	  green<={rom_fre_t[rom_pix_Fre_t],rom_fre_t[rom_pix_Fre_t],rom_fre_t[rom_pix_Fre_t]};
//	  blue={B,B};
	 end	 
	  	 if((vidon==1)&&(spriteon_Fre_m==1))
	begin
	  red<={rom_fre_m[rom_pix_Fre_m],rom_fre_m[rom_pix_Fre_m],rom_fre_m[rom_pix_Fre_m]};
	  green<={rom_fre_m[rom_pix_Fre_m],rom_fre_m[rom_pix_Fre_m],rom_fre_m[rom_pix_Fre_m]};
//	  blue={B,B};
	 end
	  	 if((vidon==1)&&(spriteon_Fre_l==1))
	begin
	  red<={rom_fre_l[rom_pix_Fre_l],rom_fre_l[rom_pix_Fre_l],rom_fre_l[rom_pix_Fre_l]};
	  green<={rom_fre_l[rom_pix_Fre_l],rom_fre_l[rom_pix_Fre_l],rom_fre_l[rom_pix_Fre_l]};
//	  blue={B,B};
	 end
	  if((vidon==1)&&(spriteon_Vopp_h==1))
	begin
	  red<={rom_vopp_h[rom_pix_Vopp_h],rom_vopp_h[rom_pix_Vopp_h],rom_vopp_h[rom_pix_Vopp_h]};
	  green<={rom_vopp_h[rom_pix_Vopp_h],rom_vopp_h[rom_pix_Vopp_h],rom_vopp_h[rom_pix_Vopp_h]};
//	  blue={B,B};
	 end
 if((vidon==1)&&(spriteon_Vopp_d==1))
	begin
	  red<={rom_vopp_d[rom_pix_Vopp_d],rom_vopp_d[rom_pix_Vopp_d],rom_vopp_d[rom_pix_Vopp_d]};
	  green<={rom_vopp_d[rom_pix_Vopp_d],rom_vopp_d[rom_pix_Vopp_d],rom_vopp_d[rom_pix_Vopp_d]};
//	  blue={B,B};
	 end	 
 if((vidon==1)&&(spriteon_Vopp_u==1))
	begin
	  red<={rom_vopp_u[rom_pix_Vopp_u],rom_vopp_u[rom_pix_Vopp_u],rom_vopp_u[rom_pix_Vopp_u]};
	  green<={rom_vopp_u[rom_pix_Vopp_u],rom_vopp_u[rom_pix_Vopp_u],rom_vopp_u[rom_pix_Vopp_u]};
//	  blue={B,B};
	 end	 


end

endmodule
