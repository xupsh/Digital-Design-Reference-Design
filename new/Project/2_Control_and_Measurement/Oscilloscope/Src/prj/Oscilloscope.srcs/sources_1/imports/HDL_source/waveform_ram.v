`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/21 20:47:02
// Design Name: 
// Module Name: waveform_ram
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
module waveform_ram(
input clk_AD,//waveform ram write clock
input clk_05Hz,//refresh frequence of vopp number to be showed  
input[9:0]addr_in,//waveform ram read address, from vga line count
input[7:0]data_in,//waveform data in from AD or waveform generater, to be stored in waveform ram
input trigger,//trigger signal
output reg[3:0]vopp_num_u,//vopp value unit
output reg[3:0]vopp_num_d,//vopp value decade
output reg[3:0]vopp_num_h,//vopp value hundred

output reg[7:0]data_out//waveform ram data, to be showed 
    );
    
reg[7:0]WaveFormRam[639:0];
reg[9:0] ram_cnt;

always@(posedge clk_AD)begin
    if(ram_cnt <= 638)begin
        ram_cnt <= ram_cnt+1;
        WaveFormRam[ram_cnt] <=data_in;
    end
    else if(ram_cnt >638 && data_in>=8'b10000000 && trigger==1'b1 )begin
    ram_cnt <= 0;
    end
end

always@(*)begin
    if(addr_in>639 || addr_in<0) 
        data_out<=8'b0;
    else
        data_out<=WaveFormRam[addr_in];	 
end

reg[7:0] max_reg,min_reg,max,min,vopp;
wire[7:0] vopp_temp;
always@(posedge clk_AD)begin
    if(ram_cnt <= 637)begin
        if(max_reg < WaveFormRam[ram_cnt])
        max_reg <= WaveFormRam[ram_cnt];
        if(min_reg >= WaveFormRam[ram_cnt])
        min_reg <= WaveFormRam[ram_cnt];
    end
    else if(ram_cnt == 638)begin
        max <= max_reg;
        min <= min_reg;
        max_reg <= 8'b01110000;
        min_reg <= 8'b01110000;    
    end
end

assign vopp_temp = max - min;

always@(posedge clk_05Hz)begin
 vopp <= vopp_temp;
end

always@(*)begin
 case (vopp)
 8'd0:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd1:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd2:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd3:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd4:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 8'd5:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd6:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd7:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd8:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd9:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end

  8'd10:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd11:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd12:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd13:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd14:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 8'd15:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd16:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd17:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd18:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd19:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 
  8'd20:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd21:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd22:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd23:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd24:begin vopp_num_h<=4'b0000;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 8'd25:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd26:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd27:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd28:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd29:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 
   8'd30:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd31:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd32:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd33:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd34:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end
 8'd35:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd36:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd37:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd38:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd39:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 
   8'd40:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd41:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd42:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd43:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd44:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 8'd45:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd46:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd47:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd48:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd49:begin vopp_num_h<=4'b0001;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 
   8'd50:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd51:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd52:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd53:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd54:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 8'd55:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd56:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd57:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd58:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd59:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end
 
   8'd60:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd61:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd62:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd63:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd64:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 8'd65:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd66:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd67:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd68:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd69:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 
   8'd70:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd71:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd72:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd73:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd74:begin vopp_num_h<=4'b0010;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 8'd75:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd76:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd77:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd78:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd79:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 
   8'd80:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd81:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd82:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd83:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd84:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end
 8'd85:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd86:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd87:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd88:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd89:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 
   8'd90:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd91:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd92:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd93:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd94:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 8'd95:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd96:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd97:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd98:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd99:begin vopp_num_h<=4'b0011;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 
  
 8'd100:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd101:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd102:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd103:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd104:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 8'd105:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd106:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd107:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd108:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd109:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end

  8'd110:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd111:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd112:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd113:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd114:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 8'd115:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd116:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd117:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd118:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd119:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 
  8'd120:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd121:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd122:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd123:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd124:begin vopp_num_h<=4'b0100;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 8'd125:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd126:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd127:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd128:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd129:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 
   8'd130:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd131:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd132:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd133:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd134:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end
 8'd135:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd136:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd137:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd138:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd139:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 
   8'd140:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd141:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd142:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd143:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd144:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 8'd145:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd146:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd147:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd148:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd149:begin vopp_num_h<=4'b0101;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 
   8'd150:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd151:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd152:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd153:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd154:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 8'd155:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd156:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd157:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd158:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd159:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end
 
   8'd160:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd161:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd162:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd163:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd164:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 8'd165:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd166:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd167:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd168:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd169:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 
   8'd170:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd171:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd172:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd173:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd174:begin vopp_num_h<=4'b0110;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 8'd175:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd176:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd177:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd178:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd179:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 
   8'd180:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd181:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd182:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd183:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd184:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end
 8'd185:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd186:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd187:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd188:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd189:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 
   8'd190:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd191:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd192:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd193:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd194:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 8'd195:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd196:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd197:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd198:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd199:begin vopp_num_h<=4'b0111;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end



 8'd200:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd201:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd202:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd203:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd204:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 8'd205:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd206:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd207:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd208:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd209:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end

  8'd210:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd211:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd212:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd213:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd214:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 8'd215:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd216:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd217:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd218:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd219:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 
  8'd220:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd221:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd222:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd223:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd224:begin vopp_num_h<=4'b1000;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 8'd225:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0000;vopp_num_u<=4'b0000;end
 8'd226:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0000;vopp_num_u<=4'b0100;end
 8'd227:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0000;vopp_num_u<=4'b1000;end
 8'd228:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0001;vopp_num_u<=4'b0010;end
 8'd229:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0001;vopp_num_u<=4'b0110;end
 
   8'd230:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0010;vopp_num_u<=4'b0000;end
 8'd231:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0010;vopp_num_u<=4'b0100;end
 8'd232:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0010;vopp_num_u<=4'b1000;end
 8'd233:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0011;vopp_num_u<=4'b0010;end
 8'd234:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0011;vopp_num_u<=4'b0110;end
 8'd235:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0100;vopp_num_u<=4'b0000;end
 8'd236:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0100;vopp_num_u<=4'b0100;end
 8'd237:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0100;vopp_num_u<=4'b1000;end
 8'd238:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0101;vopp_num_u<=4'b0010;end
 8'd239:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0101;vopp_num_u<=4'b0110;end
 
   8'd240:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0110;vopp_num_u<=4'b0000;end
 8'd241:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0110;vopp_num_u<=4'b0100;end
 8'd242:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0110;vopp_num_u<=4'b1000;end
 8'd243:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0111;vopp_num_u<=4'b0010;end
 8'd244:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b0111;vopp_num_u<=4'b0110;end
 8'd245:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1000;vopp_num_u<=4'b0000;end
 8'd246:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1000;vopp_num_u<=4'b0100;end
 8'd247:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1000;vopp_num_u<=4'b1000;end
 8'd248:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b0010;end
 8'd249:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b0110;end
 
   8'd250:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b1001;end
 8'd251:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b1001;end
 8'd252:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b1001;end
 8'd253:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b1001;end
 8'd254:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b1001;end
 8'd255:begin vopp_num_h<=4'b1001;vopp_num_d<=4'b1001;vopp_num_u<=4'b1001;end

endcase

end

endmodule
