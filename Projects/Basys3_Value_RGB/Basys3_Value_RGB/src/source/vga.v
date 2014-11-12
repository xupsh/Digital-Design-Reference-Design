`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/05/23 15:48:40
// Design Name: 
// Module Name: vga
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


module vga(
input clk25,
output reg[3:0] vga_red,
output reg[3:0] vga_green,
output reg[3:0] vga_blue,
output reg vga_hsync,
output reg vga_vsync,
output [9:0] HCnt,
output [9:0] VCnt,

output [3:0]rom_addr_R,
input wire[0:15]M_R,
output [3:0]rom_addr_G,
input wire[0:15]M_G,
output [3:0]rom_addr_B,
input wire[0:15]M_B,
output [3:0]rom_addr_R_h,
input wire[0:15]M_R_h,
output [3:0]rom_addr_R_d,
input wire[0:15]M_R_d,
output [3:0]rom_addr_R_u,
input wire[0:15]M_R_u,

output [3:0]rom_addr_G_h,
input wire[0:15]M_G_h,
output [3:0]rom_addr_G_d,
input wire[0:15]M_G_d,
output [3:0]rom_addr_G_u,
input wire[0:15]M_G_u,

output [3:0]rom_addr_B_h,
input wire[0:15]M_B_h,
output [3:0]rom_addr_B_d,
input wire[0:15]M_B_d,
output [3:0]rom_addr_B_u,
input wire[0:15]M_B_u,

output [16:0] frame_addr,
input [15:0] frame_pixel
    );
    //Timing constants
      parameter hRez   = 640;
      parameter hStartSync   = 640+16;
      parameter hEndSync     = 640+16+96;
      parameter hMaxCount    = 800;
    
      parameter vRez         = 480;
      parameter vStartSync   = 480+10;
      parameter vEndSync     = 480+10+2;
      parameter vMaxCount    = 480+10+2+33;
    
    parameter hsync_active   =0;
    parameter vsync_active  = 0;
    reg[9:0] hCounter;
    reg[9:0] vCounter;    
    reg[16:0] address;  
    reg blank;
   initial   hCounter = 10'b0;
   initial   vCounter = 10'b0;  
   initial   address = 17'b0;   
   initial   blank = 1'b1;    
   
   assign frame_addr = address;
   assign HCnt = hCounter;
   assign VCnt = vCounter;
   
wire[10:0] rom_pix_R;
assign rom_pix_R=(HCnt-160)/2;
assign rom_addr_R=(VCnt-120)/2;
reg spriteon_R;
always@(*)
begin
if((HCnt>=160)&&(HCnt<160+32)&&(VCnt>=120)&&(VCnt<120+32))
spriteon_R=1;
else
spriteon_R=0;
end

wire[10:0] rom_pix_G;
assign rom_pix_G=(HCnt-160)/2;
assign rom_addr_G=(VCnt-120-32)/2;
reg spriteon_G;
always@(*)
begin
if((HCnt>=160)&&(HCnt<160+32)&&(VCnt>=120+32)&&(VCnt<120+32+32))
spriteon_G=1;
else
spriteon_G=0;
end

wire[10:0] rom_pix_B;
assign rom_pix_B=(HCnt-160)/2;
assign rom_addr_B=(VCnt-120-32-32)/2;
reg spriteon_B;

always@(*)
begin
if((HCnt>=160)&&(HCnt<160+32)&&(VCnt>=120+32+32)&&(VCnt<120+32+32+32))
spriteon_B=1;
else
spriteon_B=0;
end   
   
 //R value  
   wire[10:0] rom_pix_R_h;
assign rom_pix_R_h=(HCnt-160-48);
assign rom_addr_R_h=(VCnt-120)/2;
reg spriteon_R_h;
always@(*)
begin
if((HCnt>=160+48)&&(HCnt<160+48+16)&&(VCnt>=120)&&(VCnt<120+32))
spriteon_R_h=1;
else
spriteon_R_h=0;
end

   
   wire[10:0] rom_pix_R_d;
assign rom_pix_R_d=(HCnt-160-48-16);
assign rom_addr_R_d=(VCnt-120)/2;
reg spriteon_R_d;
always@(*)
begin
if((HCnt>=160+48+16)&&(HCnt<160+48+16+16)&&(VCnt>=120)&&(VCnt<120+32))
spriteon_R_d=1;
else
spriteon_R_d=0;
end
   
wire[10:0] rom_pix_R_u;
assign rom_pix_R_u=(HCnt-160-48-16-16);
assign rom_addr_R_u=(VCnt-120)/2;
reg spriteon_R_u;
always@(*)
begin
if((HCnt>=160+48+16+16)&&(HCnt<160+48+16+16+16)&&(VCnt>=120)&&(VCnt<120+32))
spriteon_R_u=1;
else
spriteon_R_u=0;
end
//G value display
   wire[10:0] rom_pix_G_h;
assign rom_pix_G_h=(HCnt-160-48);
assign rom_addr_G_h=(VCnt-120-32)/2;
reg spriteon_G_h;
always@(*)
begin
if((HCnt>=160+48)&&(HCnt<160+48+16)&&(VCnt>=120+32)&&(VCnt<120+32+32))
spriteon_G_h=1;
else
spriteon_G_h=0;
end

   
   wire[10:0] rom_pix_G_d;
assign rom_pix_G_d=(HCnt-160-48-16);
assign rom_addr_G_d=(VCnt-120-32)/2;
reg spriteon_G_d;
always@(*)
begin
if((HCnt>=160+48+16)&&(HCnt<160+48+16+16)&&(VCnt>=120+32)&&(VCnt<120+32+32))
spriteon_G_d=1;
else
spriteon_G_d=0;
end
   
wire[10:0] rom_pix_G_u;
assign rom_pix_G_u=(HCnt-160-48-16-16);
assign rom_addr_G_u=(VCnt-120-32)/2;
reg spriteon_G_u;
always@(*)
begin
if((HCnt>=160+48+16+16)&&(HCnt<160+48+16+16+16)&&(VCnt>=120+32)&&(VCnt<120+32+32))
spriteon_G_u=1;
else
spriteon_G_u=0;
end
//B value display
   wire[10:0] rom_pix_B_h;
assign rom_pix_B_h=(HCnt-160-48);
assign rom_addr_B_h=(VCnt-120-32-32)/2;
reg spriteon_B_h;
always@(*)
begin
if((HCnt>=160+48)&&(HCnt<160+48+16)&&(VCnt>=120+32+32)&&(VCnt<120+32+32+32))
spriteon_B_h=1;
else
spriteon_B_h=0;
end

   
   wire[10:0] rom_pix_B_d;
assign rom_pix_B_d=(HCnt-160-48-16);
assign rom_addr_B_d=(VCnt-120-32-32)/2;
reg spriteon_B_d;
always@(*)
begin
if((HCnt>=160+48+16)&&(HCnt<160+48+16+16)&&(VCnt>=120+32+32)&&(VCnt<120+32+32+32))
spriteon_B_d=1;
else
spriteon_B_d=0;
end
   
wire[10:0] rom_pix_B_u;
assign rom_pix_B_u=(HCnt-160-48-16-16);
assign rom_addr_B_u=(VCnt-120-32-32)/2;
reg spriteon_B_u;
always@(*)
begin
if((HCnt>=160+48+16+16)&&(HCnt<160+48+16+16+16)&&(VCnt>=120+32+32)&&(VCnt<120+32+32+32))
spriteon_B_u=1;
else
spriteon_B_u=0;
end


   always@(posedge clk25)begin
            if( hCounter == hMaxCount-1 )begin
   				hCounter <=  10'b0;
   				if (vCounter == vMaxCount-1 )
   					vCounter <=  10'b0;
   				else
   					vCounter <= vCounter+1;
   				end
   			else
   				hCounter <= hCounter+1;
   
   			if (blank ==0) begin
   			case ({spriteon_R,spriteon_G,spriteon_B,spriteon_R_h,spriteon_R_d,spriteon_R_u,spriteon_G_h,spriteon_G_d,spriteon_G_u,spriteon_B_h,spriteon_B_d,spriteon_B_u})
   			12'b100_000000000:begin
            vga_red   <= {frame_pixel[15]|M_R[rom_pix_R],frame_pixel[14]|M_R[rom_pix_R],frame_pixel[13]|M_R[rom_pix_R],frame_pixel[12]|M_R[rom_pix_R]};//frame_pixel[15:12];
            vga_green <=  frame_pixel[10:7];
            vga_blue  <=  frame_pixel[4:1];
            end
             12'b010_000000000:                     
   			begin
            vga_red   <=  frame_pixel[15:12];
            vga_green <=  {frame_pixel[10]|M_G[rom_pix_G],frame_pixel[9]|M_G[rom_pix_G],frame_pixel[8]|M_G[rom_pix_G],frame_pixel[7]|M_G[rom_pix_G]};
            vga_blue  <=  frame_pixel[4:1];
            end                
            12'b001_000000000:
            begin
           vga_red   <=  frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  {frame_pixel[4]|M_B[rom_pix_B],frame_pixel[3]|M_B[rom_pix_B],frame_pixel[2]|M_B[rom_pix_B],frame_pixel[1]|M_B[rom_pix_B]};
           end    
		   		   //R value display
           12'b000_100000000:
           begin
           vga_red   <= {frame_pixel[15]|M_R_h[rom_pix_R_h],frame_pixel[14]|M_R_h[rom_pix_R_h],frame_pixel[13]|M_R_h[rom_pix_R_h],frame_pixel[12]|M_R_h[rom_pix_R_h]};//frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  frame_pixel[4:1];
           end   
           12'b000_010000000:
           begin
           vga_red   <= {frame_pixel[15]|M_R_d[rom_pix_R_d],frame_pixel[14]|M_R_d[rom_pix_R_d],frame_pixel[13]|M_R_d[rom_pix_R_d],frame_pixel[12]|M_R_d[rom_pix_R_d]};//frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  frame_pixel[4:1];
           end    
           12'b000_001000000:
           begin
           vga_red   <= {frame_pixel[15]|M_R_u[rom_pix_R_u],frame_pixel[14]|M_R_u[rom_pix_R_u],frame_pixel[13]|M_R_u[rom_pix_R_u],frame_pixel[12]|M_R_u[rom_pix_R_u]};//frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  frame_pixel[4:1];
           end    		   
		   //G value display
           12'b000_000100000:
           begin
           vga_red   <=  frame_pixel[15:12];
           vga_green <=  {frame_pixel[10]|M_G_h[rom_pix_G_h],frame_pixel[9]|M_G_h[rom_pix_G_h],frame_pixel[8]|M_G_h[rom_pix_G_h],frame_pixel[7]|M_G_h[rom_pix_G_h]};
           vga_blue  <=  frame_pixel[4:1];
           end   
           12'b000_000010000:
           begin
           vga_red   <=  frame_pixel[15:12];
           vga_green <=  {frame_pixel[10]|M_G_d[rom_pix_G_d],frame_pixel[9]|M_G_d[rom_pix_G_d],frame_pixel[8]|M_G_d[rom_pix_G_d],frame_pixel[7]|M_G_d[rom_pix_G_d]};
           vga_blue  <=  frame_pixel[4:1];
           end    
           12'b000_000001000:
           begin
           vga_red   <=  frame_pixel[15:12];
           vga_green <=  {frame_pixel[10]|M_G_u[rom_pix_G_u],frame_pixel[9]|M_G_u[rom_pix_G_u],frame_pixel[8]|M_G_u[rom_pix_G_u],frame_pixel[7]|M_G_u[rom_pix_G_u]};
           vga_blue  <=  frame_pixel[4:1];
           end  
		   //B value display		   
           12'b000_000000100:
           begin
           vga_red   <= frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  {frame_pixel[4]|M_B_h[rom_pix_B_h],frame_pixel[3]|M_B_h[rom_pix_B_h],frame_pixel[2]|M_B_h[rom_pix_B_h],frame_pixel[1]|M_B_h[rom_pix_B_h]};
           end   
           12'b000_000000010:
           begin
           vga_red   <= frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  {frame_pixel[4]|M_B_d[rom_pix_B_d],frame_pixel[3]|M_B_d[rom_pix_B_d],frame_pixel[2]|M_B_d[rom_pix_B_d],frame_pixel[1]|M_B_d[rom_pix_B_d]};
           end    
           12'b000_000000001:
           begin
           vga_red   <= frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  {frame_pixel[4]|M_B_u[rom_pix_B_u],frame_pixel[3]|M_B_u[rom_pix_B_u],frame_pixel[2]|M_B_u[rom_pix_B_u],frame_pixel[1]|M_B_u[rom_pix_B_u]};
           end  
		   
		   
           12'b000000000000:
           begin
           vga_red   <= frame_pixel[15:12];
           vga_green <=  frame_pixel[10:7];
           vga_blue  <=  frame_pixel[4:1];
           end
           endcase
           end
//				if(spriteon_R)begin
//   				vga_red   <= {frame_pixel[15]|M_R[rom_pix_R],frame_pixel[14]|M_R[rom_pix_R],frame_pixel[13]|M_R[rom_pix_R],frame_pixel[12]|M_R[rom_pix_R]};//frame_pixel[15:12];
//   				vga_green <=  frame_pixel[10:7];
//   				vga_blue  <=  frame_pixel[4:1];
//   				end
//				else if(spriteon_G)begin
//   				vga_red   <=  frame_pixel[15:12];
//   				vga_green <=  {frame_pixel[10]|M_G[rom_pix_G],frame_pixel[9]|M_G[rom_pix_G],frame_pixel[8]|M_G[rom_pix_G],frame_pixel[7]|M_G[rom_pix_G]};
//   				vga_blue  <=  frame_pixel[4:1];
//   				end				
//				else if(spriteon_B)begin
//   				vga_red   <=  frame_pixel[15:12];
//   				vga_green <=  frame_pixel[10:7];
//   				vga_blue  <=  {frame_pixel[4]|M_B[rom_pix_B],frame_pixel[3]|M_B[rom_pix_B],frame_pixel[2]|M_B[rom_pix_B],frame_pixel[1]|M_B[rom_pix_B]};
//   				end	
// 				else if(spriteon_R_h)begin
//                vga_red   <= {frame_pixel[15]|M_R_h[rom_pix_R_h],frame_pixel[14]|M_R_h[rom_pix_R_h],frame_pixel[13]|M_R_h[rom_pix_R_h],frame_pixel[12]|M_R_h[rom_pix_R_h]};//frame_pixel[15:12];
//                vga_green <=  frame_pixel[10:7];
//                vga_blue  <=  frame_pixel[4:1];
//                end					
//   				else begin
//                vga_red   <= frame_pixel[15:12];
//                vga_green <=  frame_pixel[10:7];
//                vga_blue  <=  frame_pixel[4:1];
//                end
//   				end
   			else begin
   				vga_red   <= 4'b0;
   				vga_green <= 4'b0;
   				vga_blue  <= 4'b0;
   			     end;
   	
   			if(  vCounter  >= 360 || vCounter  < 120) begin
   				address <= 17'b0; 
   				blank <= 1;
   				end
   			else begin
   				if ( hCounter  < 480 && hCounter  >= 160) begin
   					blank <= 0;
   					address <= address+1;
   					end
   				else
   					blank <= 1;
   				end;
   	
   			// Are we in the hSync pulse? (one has been added to include frame_buffer_latency)
   			if( hCounter > hStartSync && hCounter <= hEndSync)
   				vga_hsync <= hsync_active;
   			else
   				vga_hsync <= ~ hsync_active;
   			
   
   			// Are we in the vSync pulse?
   			if( vCounter >= vStartSync && vCounter < vEndSync )
   				vga_vsync <= vsync_active;
   			else
   				vga_vsync <= ~ vsync_active;
   end 
endmodule
/*
module vga(
input clk25,
output reg[3:0] vga_red,
output reg[3:0] vga_green,
output reg[3:0] vga_blue,
output reg vga_hsync,
output reg vga_vsync,
output [9:0] HCnt,
output [9:0] VCnt,

output [16:0] frame_addr,
input [11:0] frame_pixel
    );
    //Timing constants
      parameter hRez   = 640;
      parameter hStartSync   = 640+16;
      parameter hEndSync     = 640+16+96;
      parameter hMaxCount    = 800;
    
      parameter vRez         = 480;
      parameter vStartSync   = 480+10;
      parameter vEndSync     = 480+10+2;
      parameter vMaxCount    = 480+10+2+33;
    
    parameter hsync_active   =0;
    parameter vsync_active  = 0;
    reg[9:0] hCounter;
    reg[9:0] vCounter;    
    reg[9:0] VCNT,HCNT;       
    reg[16:0] address;  
    reg blank;
   initial   hCounter = 10'b0;
   initial   vCounter = 10'b0;  
    initial   HCNT = 10'b0;
   initial   VCNT = 10'b0;   
   initial   address = 19'b0;   
   initial   blank = 1'b1;    
   
   assign frame_addr = address;
//   assign HCnt = hCounter;
//   assign VCnt = vCounter;
    assign HCnt = HCNT;
   assign VCnt = VCNT;  
   always@(posedge clk25)begin
            if( hCounter == hMaxCount-1 )begin
   				hCounter <=  10'b0;
   				if (vCounter == vMaxCount-1 )
   					vCounter <=  10'b0;
   				else
   					vCounter <= vCounter+1;
   				end
   			else
   				hCounter <= hCounter+1;
   
   			if (blank ==0) begin
   				vga_red   <= frame_pixel[11:8];
   				vga_green <= frame_pixel[7:4];
   				vga_blue  <= frame_pixel[3:0];
   				end
   			else begin
   				vga_red   <= 4'b0;
   				vga_green <= 4'b0;
   				vga_blue  <= 4'b0;
   			     end;
   	
   			if(vCounter  >= vRez) begin
   		//		address <= 19'b0; 
   				blank <= 1;
   				end
   			else begin
   				if (hCounter  < 640) begin
   					blank <= 0;
   		//			address <= address+1;
   					end
   				else
   					blank <= 1;
   				end;
   	
   			// Are we in the hSync pulse? (one has been added to include frame_buffer_latency)
   			if( hCounter > hStartSync && hCounter <= hEndSync)
   				vga_hsync <= hsync_active;
   			else
   				vga_hsync <= ~ hsync_active;
   			
   
   			// Are we in the vSync pulse?
   			if( vCounter >= vStartSync && vCounter < vEndSync )
   				vga_vsync <= vsync_active;
   			else
   				vga_vsync <= ~ vsync_active;
   end 
   
always@(posedge vga_hsync)begin
     if(vga_vsync == 1)
        if(VCNT>524)
        VCNT <=0;
        else
        VCNT <= VCNT +1;
     else
         VCNT <= 492;
 end        
 
always@(posedge clk25)begin
   if(vga_hsync == 1)
      if(HCNT>799)
      HCNT <=0;
      else
      HCNT <= HCNT +1;
   else
       HCNT <= 753;
end  
        
 always@(posedge clk25)begin
  if(VCNT  >= 360 || VCNT  < 120) begin
    				address <= 17'b0; 
    				end
    			else begin
    				if (HCNT  < 480 && HCNT  >= 160) begin
    					address <= address+1;
    					end		
    				end;
 end       
endmodule*/