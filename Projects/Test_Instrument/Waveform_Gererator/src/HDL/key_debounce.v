`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2014 07:06:31 PM
// Design Name: 
// Module Name: key_debounce
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


module key_debounce(
input wire inp,

input wire clk,
input wire clr,

output wire outp
);
reg[3:0] delay1;
reg[3:0] delay2;
reg[3:0] delay3;
reg cclk;
reg[5:0] cnt;
always@(posedge clk )begin
    if(cnt >=9)begin
        cnt <= 0;
        cclk <= ~cclk;
    end
    else
        cnt <= cnt+1;
end

always@(posedge cclk or posedge clr)
 begin
  if(clr==1)
   begin
	 delay1<=4'b0000;
	 delay2<=4'b0000;
	 delay3<=4'b0000;

   end
  else
   begin
	 delay1<=inp;
	 delay2<=delay1;
	 delay3<=delay2;

	end
end
assign outp=delay1&delay2&delay3;

endmodule
