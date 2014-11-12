`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/23 14:08:04
// Design Name: 
// Module Name: Ball_LostDetect
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

module Ball_LostDetect(
input [11:0]x_value,
input [10:0]y_value,
input vsync_in,
output reg lost_x_out,lost_y_out,
output reg[10:0] led_lost_coordinate_x,led_lost_coordinate_y
    );
reg [11:0]x_value_pre0;
reg [10:0]y_value_pre0;

reg lost_x,lost_y;
always@(posedge vsync_in)begin
x_value_pre0 <= x_value;
y_value_pre0 <= y_value;
end

always@(posedge vsync_in)begin
if(  x_value!=0 &&x_value>5 && x_value <315&&  y_value!=0 &&y_value>5 && y_value <235) begin
lost_x <= 0;
lost_y <= 0;
end
//else if(    ( x_value_pre0!=0  )&& x_value==0 ||  ( y_value_pre0!=0 && y_value_pre0!=238   )&&( y_value==0|| y_value==238 )  )begin
else if(    ( x_value_pre0!=0  )&& x_value==0 ||  ( y_value_pre0!=0   )&&( y_value==0 )  )begin
lost_x <= 1;
led_lost_coordinate_x <= x_value_pre0;
lost_y <= 1;
led_lost_coordinate_y <= y_value_pre0;
end

end
//assign lost_x_out = lost_x;
//assign lost_y_out = lost_y;
always@(posedge vsync_in)begin
case( { (led_lost_coordinate_y<120&&led_lost_coordinate_y>0),led_lost_coordinate_x<160 && led_lost_coordinate_x>0,
led_lost_coordinate_y>=120&&led_lost_coordinate_y<240 ,led_lost_coordinate_x>=160 && led_lost_coordinate_x<320
  } )
  4'b1100 : begin      
   if(led_lost_coordinate_y < led_lost_coordinate_x)begin
      lost_x_out <= 1'b0 ;
      lost_y_out <= lost_y;   
   end
   else begin
      lost_x_out <= lost_x;
      lost_y_out <= 1'b0 ;      
   end 
end
  4'b1001 : begin           if(led_lost_coordinate_y < (320-led_lost_coordinate_x) )begin
    lost_x_out <= 1'b0;
    lost_y_out <= lost_y;   
 end  
else begin
    lost_x_out <= lost_x;
    lost_y_out <= 1'b0;      
end 
end
  4'b0110 : begin             if( (240 - led_lost_coordinate_y) < (led_lost_coordinate_x) )begin
    lost_x_out <= 1'b0;
    lost_y_out <= lost_y;   
 end  
else begin
    lost_x_out <= lost_x;
    lost_y_out <= 1'b0;      
end  
end
  4'b0011 : begin        if((240 - led_lost_coordinate_y) < (320-led_lost_coordinate_x) )begin
         lost_x_out <= 1'b0;
         lost_y_out <= lost_y;   
      end  
   else begin
         lost_x_out <= lost_x;
         lost_y_out <= 1'b0;      
   end       
end
default: begin
         lost_x_out <= 1'b0;
        lost_y_out <= 1'b0;
    end
endcase
//if(led_lost_coordinate_y<120&&led_lost_coordinate_y>0 && led_lost_coordinate_x<160 && led_lost_coordinate_x>0)
//  if(led_lost_coordinate_y < led_lost_coordinate_x)begin
//      lost_x_out <= 1'b0 & lost_x;
//      lost_y_out <= 1'b1 & lost_y;   
//   end
//   else begin
//      lost_x_out <= 1'b1 & lost_x;
//      lost_y_out <= 1'b0 & lost_y;      
//   end
// if(led_lost_coordinate_y<120&&led_lost_coordinate_y>0 && led_lost_coordinate_x>=160 && led_lost_coordinate_x<320)
//     if(led_lost_coordinate_y < (320-led_lost_coordinate_x) )begin
//         lost_x_out <= 1'b0 & lost_x;
//         lost_y_out <= 1'b1 & lost_y;   
//      end  
//   else begin
//         lost_x_out <= 1'b1 & lost_x;
//         lost_y_out <= 1'b0 & lost_y;      
//   end
// if(led_lost_coordinate_y>=120&&led_lost_coordinate_y<240 && led_lost_coordinate_x<160 && led_lost_coordinate_x>0)
//       if( (240 - led_lost_coordinate_y) < (led_lost_coordinate_x) )begin
//           lost_x_out <= 1'b0 & lost_x;
//           lost_y_out <= 1'b1 & lost_y;   
//        end  
//     else begin
//           lost_x_out <= 1'b1 & lost_x;
//           lost_y_out <= 1'b0 & lost_y;      
//     end
//  if(led_lost_coordinate_y>=120&&led_lost_coordinate_y<240 && led_lost_coordinate_x>=160 && led_lost_coordinate_x<320)
//         if((240 - led_lost_coordinate_y) < (320-led_lost_coordinate_x) )begin
//             lost_x_out <= 1'b0 & lost_x;
//             lost_y_out <= 1'b1 & lost_y;   
//          end  
//       else begin
//             lost_x_out <= 1'b1 & lost_x;
//             lost_y_out <= 1'b0 & lost_y;      
//       end       
end
//always@(posedge vsync_in)begin
//if((led_lost_coordinate_y >= led_lost_coordinate_y_pre) && (led_lost_coordinate_x >= led_lost_coordinate_x_pre))begin
//  if( (led_lost_coordinate_y - led_lost_coordinate_y_pre) > (led_lost_coordinate_x -led_lost_coordinate_x_pre))begin
//    lost_x_out <= 1'b0 & lost_x;
//    lost_y_out <= 1'b1 & lost_y;   
//  end
//  else begin
//    lost_x_out <= 1'b1 & lost_x;
//    lost_y_out <= 1'b0 & lost_y;     
//  end
//end

//if((led_lost_coordinate_y >= led_lost_coordinate_y_pre) && (led_lost_coordinate_x < led_lost_coordinate_x_pre))begin
//  if( (led_lost_coordinate_y - led_lost_coordinate_y_pre) > (led_lost_coordinate_x_pre -led_lost_coordinate_x) )begin
//    lost_x_out <= 1'b0 & lost_x;
//    lost_y_out <= 1'b1 & lost_y;   
//  end
//  else begin
//    lost_x_out <= 1'b1 & lost_x;
//    lost_y_out <= 1'b0 & lost_y;     
//  end  
//end

//if((led_lost_coordinate_y < led_lost_coordinate_y_pre) && (led_lost_coordinate_x >= led_lost_coordinate_x_pre))begin
//  if( (led_lost_coordinate_y_pre - led_lost_coordinate_y) > (led_lost_coordinate_x -led_lost_coordinate_x_pre) )begin
//    lost_x_out <= 1'b0 & lost_x;
//    lost_y_out <= 1'b1 & lost_y;   
//  end
//  else begin
//    lost_x_out <= 1'b1 & lost_x;
//    lost_y_out <= 1'b0 & lost_y;     
//  end
//end

//if((led_lost_coordinate_y < led_lost_coordinate_y_pre) && (led_lost_coordinate_x < led_lost_coordinate_x_pre))begin
//  if( (led_lost_coordinate_y_pre - led_lost_coordinate_y) > (led_lost_coordinate_x_pre -led_lost_coordinate_x) )begin
//    lost_x_out <= 1'b0 & lost_x;
//    lost_y_out <= 1'b1 & lost_y;   
//  end
//  else begin
//    lost_x_out <= 1'b1 & lost_x;
//    lost_y_out <= 1'b0 & lost_y;     
//  end
//end
//end

//always@(posedge vsync_in)begin
//if(    ( x_value_pre0!=0  )&& x_value==0 ||  ( y_value_pre0!=0 && y_value_pre0!=238   )&&( y_value==0|| y_value==238 ) )begin
//lost_y <= 1;
//led_lost_coordinate_y <= y_value_pre0;
//end
//else if(  x_value<300 && x_value>20 &&  y_value<225 && y_value>15) 
//lost_y <= 0;
//end
endmodule
