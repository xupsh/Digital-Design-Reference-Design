`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/31 22:21:24
// Design Name: 
// Module Name: operation
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


module operation(
input[3:0] index_fir_Num,index_sec_Num,index_ope,
output reg[3:0] result_d,result_u
    );
    reg[6:0] result;
    always@(*)begin
    if(index_ope==4'd0)
    result <= index_fir_Num + index_sec_Num;
    else if(index_ope==4'd1)begin
        if(index_fir_Num >= index_sec_Num)
        result <= index_fir_Num - index_sec_Num;
        else
        result <= 0;
        end
     else if(index_ope==4'd2)begin
     case ( {index_fir_Num,index_sec_Num})
     {4'd0,4'd0}:result <= 7'd0;
     {4'd0,4'd1}:result <= 7'd0;
     {4'd0,4'd2}:result <= 7'd0;
     {4'd0,4'd3}:result <= 7'd0;
     {4'd0,4'd4}:result <= 7'd0;
     {4'd0,4'd5}:result <= 7'd0;
     {4'd0,4'd6}:result <= 7'd0;
     {4'd0,4'd7}:result <= 7'd0;
     {4'd0,4'd8}:result <= 7'd0;
     {4'd0,4'd9}:result <= 7'd0;
     
     {4'd1,4'd0}:result <= 7'd0;
     {4'd1,4'd1}:result <= 7'd1;
     {4'd1,4'd2}:result <= 7'd2;
     {4'd1,4'd3}:result <= 7'd3;
     {4'd1,4'd4}:result <= 7'd4;
     {4'd1,4'd5}:result <= 7'd5;
     {4'd1,4'd6}:result <= 7'd6;
     {4'd1,4'd7}:result <= 7'd7;
     {4'd1,4'd8}:result <= 7'd8;
     {4'd1,4'd9}:result <= 7'd9;    

     {4'd2,4'd0}:result <= 7'd0;
     {4'd2,4'd1}:result <= 7'd2;
     {4'd2,4'd2}:result <= 7'd4;
     {4'd2,4'd3}:result <= 7'd6;
     {4'd2,4'd4}:result <= 7'd8;
     {4'd2,4'd5}:result <= 7'd10;
     {4'd2,4'd6}:result <= 7'd12;
     {4'd2,4'd7}:result <= 7'd14;
     {4'd2,4'd8}:result <= 7'd16;
     {4'd2,4'd9}:result <= 7'd18;  

     {4'd3,4'd0}:result <= 7'd0;
     {4'd3,4'd1}:result <= 7'd3;
     {4'd3,4'd2}:result <= 7'd6;
     {4'd3,4'd3}:result <= 7'd9;
     {4'd3,4'd4}:result <= 7'd12;
     {4'd3,4'd5}:result <= 7'd15;
     {4'd3,4'd6}:result <= 7'd18;
     {4'd3,4'd7}:result <= 7'd21;
     {4'd3,4'd8}:result <= 7'd24;
     {4'd3,4'd9}:result <= 7'd27; 

     {4'd4,4'd0}:result <= 7'd0;
     {4'd4,4'd1}:result <= 7'd4;
     {4'd4,4'd2}:result <= 7'd8;
     {4'd4,4'd3}:result <= 7'd12;
     {4'd4,4'd4}:result <= 7'd16;
     {4'd4,4'd5}:result <= 7'd20;
     {4'd4,4'd6}:result <= 7'd24;
     {4'd4,4'd7}:result <= 7'd28;
     {4'd4,4'd8}:result <= 7'd32;
     {4'd4,4'd9}:result <= 7'd36;   

     {4'd5,4'd0}:result <= 7'd0;
     {4'd5,4'd1}:result <= 7'd5;
     {4'd5,4'd2}:result <= 7'd10;
     {4'd5,4'd3}:result <= 7'd15;
     {4'd5,4'd4}:result <= 7'd20;
     {4'd5,4'd5}:result <= 7'd25;
     {4'd5,4'd6}:result <= 7'd30;
     {4'd5,4'd7}:result <= 7'd35;
     {4'd5,4'd8}:result <= 7'd40;
     {4'd5,4'd9}:result <= 7'd45;  

     {4'd6,4'd0}:result <= 7'd0;
     {4'd6,4'd1}:result <= 7'd6;
     {4'd6,4'd2}:result <= 7'd12;
     {4'd6,4'd3}:result <= 7'd18;
     {4'd6,4'd4}:result <= 7'd24;
     {4'd6,4'd5}:result <= 7'd30;
     {4'd6,4'd6}:result <= 7'd36;
     {4'd6,4'd7}:result <= 7'd42;
     {4'd6,4'd8}:result <= 7'd48;
     {4'd6,4'd9}:result <= 7'd54;  	 
	 
	 {4'd7,4'd0}:result <= 7'd0;
     {4'd7,4'd1}:result <= 7'd7;
     {4'd7,4'd2}:result <= 7'd14;
     {4'd7,4'd3}:result <= 7'd21;
     {4'd7,4'd4}:result <= 7'd28;
     {4'd7,4'd5}:result <= 7'd35;
     {4'd7,4'd6}:result <= 7'd42;
     {4'd7,4'd7}:result <= 7'd49;
     {4'd7,4'd8}:result <= 7'd56;
     {4'd7,4'd9}:result <= 7'd63;  
	 
     {4'd8,4'd0}:result <= 7'd0;
     {4'd8,4'd1}:result <= 7'd8;
     {4'd8,4'd2}:result <= 7'd16;
     {4'd8,4'd3}:result <= 7'd24;
     {4'd8,4'd4}:result <= 7'd32;
     {4'd8,4'd5}:result <= 7'd40;
     {4'd8,4'd6}:result <= 7'd48;
     {4'd8,4'd7}:result <= 7'd56;
     {4'd8,4'd8}:result <= 7'd64;
     {4'd8,4'd9}:result <= 7'd72;  

     {4'd9,4'd0}:result <= 7'd0;
     {4'd9,4'd1}:result <= 7'd9;
     {4'd9,4'd2}:result <= 7'd18;
     {4'd9,4'd3}:result <= 7'd27;
     {4'd9,4'd4}:result <= 7'd36;
     {4'd9,4'd5}:result <= 7'd45;
     {4'd9,4'd6}:result <= 7'd54;
     {4'd9,4'd7}:result <= 7'd63;
     {4'd9,4'd8}:result <= 7'd72;
     {4'd9,4'd9}:result <= 7'd81;  	 
     endcase
     end    
    
    end
    
    
    always@(*)begin
    case (result)
    7'd0:begin result_d<=4'd0;result_u<=4'd0;end
    7'd1:begin result_d<=4'd0;result_u<=4'd1;end
    7'd2:begin result_d<=4'd0;result_u<=4'd2;end
    7'd3:begin result_d<=4'd0;result_u<=4'd3;end
    7'd4:begin result_d<=4'd0;result_u<=4'd4;end
    7'd5:begin result_d<=4'd0;result_u<=4'd5;end
    7'd6:begin result_d<=4'd0;result_u<=4'd6;end
    7'd7:begin result_d<=4'd0;result_u<=4'd7;end
    7'd8:begin result_d<=4'd0;result_u<=4'd8;end
    7'd9:begin result_d<=4'd0;result_u<=4'd9;end
    7'd10:begin result_d<=4'd1;result_u<=4'd0;end
    7'd11:begin result_d<=4'd1;result_u<=4'd1;end
    7'd12:begin result_d<=4'd1;result_u<=4'd2;end
    7'd13:begin result_d<=4'd1;result_u<=4'd3;end
    7'd14:begin result_d<=4'd1;result_u<=4'd4;end
    7'd15:begin result_d<=4'd1;result_u<=4'd5;end
    7'd16:begin result_d<=4'd1;result_u<=4'd6;end
    7'd17:begin result_d<=4'd1;result_u<=4'd7;end
    7'd18:begin result_d<=4'd1;result_u<=4'd8;end
    7'd19:begin result_d<=4'd1;result_u<=4'd9;end
    7'd20:begin result_d<=4'd2;result_u<=4'd0;end
    7'd21:begin result_d<=4'd2;result_u<=4'd1;end
    7'd22:begin result_d<=4'd2;result_u<=4'd2;end
    7'd23:begin result_d<=4'd2;result_u<=4'd3;end
    7'd24:begin result_d<=4'd2;result_u<=4'd4;end
    7'd25:begin result_d<=4'd2;result_u<=4'd5;end
    7'd26:begin result_d<=4'd2;result_u<=4'd6;end
    7'd27:begin result_d<=4'd2;result_u<=4'd7;end
    7'd28:begin result_d<=4'd2;result_u<=4'd8;end
    7'd29:begin result_d<=4'd2;result_u<=4'd9;end
    7'd30:begin result_d<=4'd3;result_u<=4'd0;end
    7'd31:begin result_d<=4'd3;result_u<=4'd1;end
    7'd32:begin result_d<=4'd3;result_u<=4'd2;end
    7'd33:begin result_d<=4'd3;result_u<=4'd3;end
    7'd34:begin result_d<=4'd3;result_u<=4'd4;end
    7'd35:begin result_d<=4'd3;result_u<=4'd5;end
    7'd36:begin result_d<=4'd3;result_u<=4'd6;end
    7'd37:begin result_d<=4'd3;result_u<=4'd7;end
    7'd38:begin result_d<=4'd3;result_u<=4'd8;end
    7'd39:begin result_d<=4'd3;result_u<=4'd9;end
    7'd40:begin result_d<=4'd4;result_u<=4'd0;end
    7'd41:begin result_d<=4'd4;result_u<=4'd1;end
    7'd42:begin result_d<=4'd4;result_u<=4'd2;end
    7'd43:begin result_d<=4'd4;result_u<=4'd3;end
    7'd44:begin result_d<=4'd4;result_u<=4'd4;end
    7'd45:begin result_d<=4'd4;result_u<=4'd5;end
    7'd46:begin result_d<=4'd4;result_u<=4'd6;end
    7'd47:begin result_d<=4'd4;result_u<=4'd7;end
    7'd48:begin result_d<=4'd4;result_u<=4'd8;end
    7'd49:begin result_d<=4'd4;result_u<=4'd9;end
    7'd50:begin result_d<=4'd5;result_u<=4'd0;end
    7'd51:begin result_d<=4'd5;result_u<=4'd1;end
    7'd52:begin result_d<=4'd5;result_u<=4'd2;end
    7'd53:begin result_d<=4'd5;result_u<=4'd3;end
    7'd54:begin result_d<=4'd5;result_u<=4'd4;end
    7'd55:begin result_d<=4'd5;result_u<=4'd5;end
    7'd56:begin result_d<=4'd5;result_u<=4'd6;end
    7'd57:begin result_d<=4'd5;result_u<=4'd7;end
    7'd58:begin result_d<=4'd5;result_u<=4'd8;end
    7'd59:begin result_d<=4'd5;result_u<=4'd9;end
    7'd60:begin result_d<=4'd6;result_u<=4'd0;end
    7'd61:begin result_d<=4'd6;result_u<=4'd1;end
    7'd62:begin result_d<=4'd6;result_u<=4'd2;end
    7'd63:begin result_d<=4'd6;result_u<=4'd3;end
    7'd64:begin result_d<=4'd6;result_u<=4'd4;end
    7'd65:begin result_d<=4'd6;result_u<=4'd5;end
    7'd66:begin result_d<=4'd6;result_u<=4'd6;end
    7'd67:begin result_d<=4'd6;result_u<=4'd7;end
    7'd68:begin result_d<=4'd6;result_u<=4'd8;end
    7'd69:begin result_d<=4'd6;result_u<=4'd9;end
    7'd70:begin result_d<=4'd7;result_u<=4'd0;end
    7'd71:begin result_d<=4'd7;result_u<=4'd1;end
    7'd72:begin result_d<=4'd7;result_u<=4'd2;end
    7'd73:begin result_d<=4'd7;result_u<=4'd3;end
    7'd74:begin result_d<=4'd7;result_u<=4'd4;end
    7'd75:begin result_d<=4'd7;result_u<=4'd5;end
    7'd76:begin result_d<=4'd7;result_u<=4'd6;end
    7'd77:begin result_d<=4'd7;result_u<=4'd7;end
    7'd78:begin result_d<=4'd7;result_u<=4'd8;end
    7'd79:begin result_d<=4'd7;result_u<=4'd9;end
    7'd80:begin result_d<=4'd8;result_u<=4'd0;end
    7'd81:begin result_d<=4'd8;result_u<=4'd1;end
    endcase
    end
endmodule
