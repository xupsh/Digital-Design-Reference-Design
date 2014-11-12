`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/31 20:10:53
// Design Name: 
// Module Name: get_max
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


module get_max(
input[11:0]match_0,match_1,match_2,match_3,match_4,match_5,match_6,match_7,match_8,match_9,
input pclk,
input[2:0]cnt,
output reg[11:0]max
    );
    
    //to find the max,10 inputs  and the max output.using 4 layers comparer:b,c,d,e;and e layer gets the max number
    reg[11:0]b0,b1,b2,b3,b4,c0,c1,c2,d0,d1,e0;
    
    always@(posedge pclk)begin
        if(cnt==0)begin
         if(match_0 > match_1)
         b0 <= match_0;
         else
          b0 <= match_1;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==0)begin
         if(match_2 > match_3)
         b1 <= match_2;
         else
          b1 <= match_3;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==0)begin
         if(match_4 > match_5)
         b2 <= match_4;
         else
          b2 <= match_5;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==0)begin
         if(match_6 > match_7)
         b3 <= match_6;
         else
          b3 <= match_7;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==0)begin
         if(match_8 > match_9)
         b4 <= match_8;
         else
          b4 <= match_9;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==1)begin
         if(b0 > b1)
         c0 <= b0;
         else
          c0 <= b1;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==1)begin
         if(b2 > b3)
         c1 <= b2;
         else
          c1 <= b3;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==1)begin
         if(b3 > b4)
         c2 <= b3;
         else
          c2 <= b4;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==2)begin
         if(c0 > c1)
         d0 <= c0;
         else
          d0 <= c1;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==2)begin
         if(c1 > c2)
         d1 <= c1;
         else
          d1 <= c2;
        end
    end
    
    always@(posedge pclk)begin
        if(cnt==3)begin
         if(d0 > d1)
         e0 <= d0;
         else
          e0 <= d1;
        end
    end
    
    always@(posedge pclk)begin
    if(cnt==0)
    max <= e0;
    end
    
    
endmodule
