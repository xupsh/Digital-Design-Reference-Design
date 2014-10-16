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
input mclk,
output reg[3:0] vga_red,
output reg[3:0] vga_green,
output reg[3:0] vga_blue,
output reg vga_hsync,
output reg vga_vsync
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
    reg blank;
   initial   hCounter = 10'b0;
   initial   vCounter = 10'b0;  
   initial   blank = 1'b1;    
   
   parameter C_BLACK    =   12'b000000000000;
   parameter C_RED    =   12'b111100000000;
   parameter C_GREEN    =   12'b000011110000;
   parameter C_BLUE    =   12'b000000001111;
    parameter C_WHITE    =   12'b111111111111;
    
  reg [11:0] colour;
  wire clk25;
   clk_wiz_0 u_clk(
  .clk_in1(mclk),
  .clk_out1(clk25)
  );
  
always@(*)begin
      if( hCounter < 160 )
         colour <= C_WHITE;
      else if( hCounter < 320 )
         colour <= C_RED;
      else if (hCounter < 480 )
         colour <= C_GREEN;
      else if( hCounter < 640 )
            colour <= C_BLUE;   
      else
         colour <= C_BLACK;
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
   				vga_red   <= colour[11:8];
   				vga_green <= colour[7:4];
   				vga_blue  <= colour[3:0];
   				end
   			else begin
   				vga_red   <= 4'b0;
   				vga_green <= 4'b0;
   				vga_blue  <= 4'b0;
   			     end;
   	
   			if(  vCounter  >= 480 || vCounter  < 0) begin
   				blank <= 1;
   				end
   			else begin
   				if ( hCounter  < 640 && hCounter  >= 0) begin
   					blank <= 0;
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
