module vga_shixu(
input wire clk,
input wire clr,
output reg hsync,
output reg vsync,
output reg[9:0] hc,
output reg[9:0] vc,
output reg vidon);
parameter hpixels=10'b1100100000;
parameter vlines=10'b1000001001;
parameter hbp=10'b0010010000;
parameter hfp=10'b1100010000;
parameter vbp=10'b0000011111;
parameter vfp=10'b0111111111;
reg vsenable;

always@(posedge clk or posedge clr)
 begin
   if(clr==1)
	  hc<=0;
	else 
	  begin
	    if(hc==hpixels-1)
		   begin
			 hc<=0;
			 vsenable<=1;
			end
		  else
		   begin
			 hc<=hc+1;
			 vsenable<=0;
			end
		  end
	end

always@(*)
  begin
     if(hc<96)
       hsync=0;
	  else
	    hsync=1;
end

always@(posedge clk or posedge clr)
  begin
    if(clr==1)
	   vc<=0;
	 else
	   if(vsenable==1)
		  begin
		    if(vc==vlines-1)
			   vc<=0;
			 else
			   vc<=vc+1;
			end
	end

always@(*)
  begin
    if(vc<2)
	   vsync=0;
	  else
	   vsync=1;
end

always@(*)
  begin
   if((hc<hfp)&&(hc>hbp)&&(vc<vfp)&&(vc>vbp))
	  vidon=1;
	else
	  vidon=0;
end

endmodule
