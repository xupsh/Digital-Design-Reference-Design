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
input clk_AD,
input clk_05Hz,
input[9:0]addr_in,//由vga行扫描信号产生的地址值，随着hsync加一而加一
input[7:0]trig_DI0,//仅作触发条件判断用
input[7:0]trig_DI1,//仅作触发条件判断用
input[7:0]trig_DI2,//仅作触发条件判断用
input[7:0]trig_DI3,//仅作触发条件判断用
input[7:0]data_in,//波形数据
output reg[3:0]max_ge,//vopp个位
output reg[3:0]max_shi,//vopp十位
output reg[3:0]max_bai,//vopp百位

output reg[7:0]data_out//根据addr-in得到的sram中的值
    );
    
reg[7:0]WaveFormRam[639:0];
reg[9:0] ram_cnt;

always@(posedge clk_AD)begin
    if(ram_cnt <= 638)begin
        ram_cnt <= ram_cnt+1;
        WaveFormRam[ram_cnt] <=data_in;
    end
    else if(ram_cnt >638 && data_in>=8'b10000000 &&trig_DI0>trig_DI1 && trig_DI1>=trig_DI2 &&trig_DI2>=trig_DI3 )begin
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
 8'd0:begin max_bai<=4'b0000;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd1:begin max_bai<=4'b0000;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd2:begin max_bai<=4'b0000;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd3:begin max_bai<=4'b0000;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd4:begin max_bai<=4'b0000;max_shi<=4'b0001;max_ge<=4'b0110;end
 8'd5:begin max_bai<=4'b0000;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd6:begin max_bai<=4'b0000;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd7:begin max_bai<=4'b0000;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd8:begin max_bai<=4'b0000;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd9:begin max_bai<=4'b0000;max_shi<=4'b0011;max_ge<=4'b0110;end

  8'd10:begin max_bai<=4'b0000;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd11:begin max_bai<=4'b0000;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd12:begin max_bai<=4'b0000;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd13:begin max_bai<=4'b0000;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd14:begin max_bai<=4'b0000;max_shi<=4'b0101;max_ge<=4'b0110;end
 8'd15:begin max_bai<=4'b0000;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd16:begin max_bai<=4'b0000;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd17:begin max_bai<=4'b0000;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd18:begin max_bai<=4'b0000;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd19:begin max_bai<=4'b0000;max_shi<=4'b0111;max_ge<=4'b0110;end
 
  8'd20:begin max_bai<=4'b0000;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd21:begin max_bai<=4'b0000;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd22:begin max_bai<=4'b0000;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd23:begin max_bai<=4'b0000;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd24:begin max_bai<=4'b0000;max_shi<=4'b1001;max_ge<=4'b0110;end
 8'd25:begin max_bai<=4'b0001;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd26:begin max_bai<=4'b0001;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd27:begin max_bai<=4'b0001;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd28:begin max_bai<=4'b0001;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd29:begin max_bai<=4'b0001;max_shi<=4'b0001;max_ge<=4'b0110;end
 
   8'd30:begin max_bai<=4'b0001;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd31:begin max_bai<=4'b0001;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd32:begin max_bai<=4'b0001;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd33:begin max_bai<=4'b0001;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd34:begin max_bai<=4'b0001;max_shi<=4'b0011;max_ge<=4'b0110;end
 8'd35:begin max_bai<=4'b0001;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd36:begin max_bai<=4'b0001;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd37:begin max_bai<=4'b0001;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd38:begin max_bai<=4'b0001;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd39:begin max_bai<=4'b0001;max_shi<=4'b0101;max_ge<=4'b0110;end
 
   8'd40:begin max_bai<=4'b0001;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd41:begin max_bai<=4'b0001;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd42:begin max_bai<=4'b0001;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd43:begin max_bai<=4'b0001;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd44:begin max_bai<=4'b0001;max_shi<=4'b0111;max_ge<=4'b0110;end
 8'd45:begin max_bai<=4'b0001;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd46:begin max_bai<=4'b0001;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd47:begin max_bai<=4'b0001;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd48:begin max_bai<=4'b0001;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd49:begin max_bai<=4'b0001;max_shi<=4'b1001;max_ge<=4'b0110;end
 
   8'd50:begin max_bai<=4'b0010;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd51:begin max_bai<=4'b0010;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd52:begin max_bai<=4'b0010;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd53:begin max_bai<=4'b0010;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd54:begin max_bai<=4'b0010;max_shi<=4'b0001;max_ge<=4'b0110;end
 8'd55:begin max_bai<=4'b0010;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd56:begin max_bai<=4'b0010;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd57:begin max_bai<=4'b0010;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd58:begin max_bai<=4'b0010;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd59:begin max_bai<=4'b0010;max_shi<=4'b0011;max_ge<=4'b0110;end
 
   8'd60:begin max_bai<=4'b0010;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd61:begin max_bai<=4'b0010;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd62:begin max_bai<=4'b0010;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd63:begin max_bai<=4'b0010;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd64:begin max_bai<=4'b0010;max_shi<=4'b0101;max_ge<=4'b0110;end
 8'd65:begin max_bai<=4'b0010;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd66:begin max_bai<=4'b0010;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd67:begin max_bai<=4'b0010;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd68:begin max_bai<=4'b0010;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd69:begin max_bai<=4'b0010;max_shi<=4'b0111;max_ge<=4'b0110;end
 
   8'd70:begin max_bai<=4'b0010;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd71:begin max_bai<=4'b0010;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd72:begin max_bai<=4'b0010;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd73:begin max_bai<=4'b0010;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd74:begin max_bai<=4'b0010;max_shi<=4'b1001;max_ge<=4'b0110;end
 8'd75:begin max_bai<=4'b0011;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd76:begin max_bai<=4'b0011;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd77:begin max_bai<=4'b0011;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd78:begin max_bai<=4'b0011;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd79:begin max_bai<=4'b0011;max_shi<=4'b0001;max_ge<=4'b0110;end
 
   8'd80:begin max_bai<=4'b0011;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd81:begin max_bai<=4'b0011;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd82:begin max_bai<=4'b0011;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd83:begin max_bai<=4'b0011;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd84:begin max_bai<=4'b0011;max_shi<=4'b0011;max_ge<=4'b0110;end
 8'd85:begin max_bai<=4'b0011;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd86:begin max_bai<=4'b0011;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd87:begin max_bai<=4'b0011;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd88:begin max_bai<=4'b0011;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd89:begin max_bai<=4'b0011;max_shi<=4'b0101;max_ge<=4'b0110;end
 
   8'd90:begin max_bai<=4'b0011;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd91:begin max_bai<=4'b0011;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd92:begin max_bai<=4'b0011;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd93:begin max_bai<=4'b0011;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd94:begin max_bai<=4'b0011;max_shi<=4'b0111;max_ge<=4'b0110;end
 8'd95:begin max_bai<=4'b0011;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd96:begin max_bai<=4'b0011;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd97:begin max_bai<=4'b0011;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd98:begin max_bai<=4'b0011;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd99:begin max_bai<=4'b0011;max_shi<=4'b1001;max_ge<=4'b0110;end
 
  
 8'd100:begin max_bai<=4'b0100;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd101:begin max_bai<=4'b0100;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd102:begin max_bai<=4'b0100;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd103:begin max_bai<=4'b0100;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd104:begin max_bai<=4'b0100;max_shi<=4'b0001;max_ge<=4'b0110;end
 8'd105:begin max_bai<=4'b0100;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd106:begin max_bai<=4'b0100;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd107:begin max_bai<=4'b0100;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd108:begin max_bai<=4'b0100;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd109:begin max_bai<=4'b0100;max_shi<=4'b0011;max_ge<=4'b0110;end

  8'd110:begin max_bai<=4'b0100;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd111:begin max_bai<=4'b0100;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd112:begin max_bai<=4'b0100;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd113:begin max_bai<=4'b0100;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd114:begin max_bai<=4'b0100;max_shi<=4'b0101;max_ge<=4'b0110;end
 8'd115:begin max_bai<=4'b0100;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd116:begin max_bai<=4'b0100;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd117:begin max_bai<=4'b0100;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd118:begin max_bai<=4'b0100;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd119:begin max_bai<=4'b0100;max_shi<=4'b0111;max_ge<=4'b0110;end
 
  8'd120:begin max_bai<=4'b0100;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd121:begin max_bai<=4'b0100;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd122:begin max_bai<=4'b0100;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd123:begin max_bai<=4'b0100;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd124:begin max_bai<=4'b0100;max_shi<=4'b1001;max_ge<=4'b0110;end
 8'd125:begin max_bai<=4'b0101;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd126:begin max_bai<=4'b0101;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd127:begin max_bai<=4'b0101;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd128:begin max_bai<=4'b0101;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd129:begin max_bai<=4'b0101;max_shi<=4'b0001;max_ge<=4'b0110;end
 
   8'd130:begin max_bai<=4'b0101;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd131:begin max_bai<=4'b0101;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd132:begin max_bai<=4'b0101;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd133:begin max_bai<=4'b0101;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd134:begin max_bai<=4'b0101;max_shi<=4'b0011;max_ge<=4'b0110;end
 8'd135:begin max_bai<=4'b0101;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd136:begin max_bai<=4'b0101;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd137:begin max_bai<=4'b0101;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd138:begin max_bai<=4'b0101;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd139:begin max_bai<=4'b0101;max_shi<=4'b0101;max_ge<=4'b0110;end
 
   8'd140:begin max_bai<=4'b0101;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd141:begin max_bai<=4'b0101;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd142:begin max_bai<=4'b0101;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd143:begin max_bai<=4'b0101;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd144:begin max_bai<=4'b0101;max_shi<=4'b0111;max_ge<=4'b0110;end
 8'd145:begin max_bai<=4'b0101;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd146:begin max_bai<=4'b0101;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd147:begin max_bai<=4'b0101;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd148:begin max_bai<=4'b0101;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd149:begin max_bai<=4'b0101;max_shi<=4'b1001;max_ge<=4'b0110;end
 
   8'd150:begin max_bai<=4'b0110;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd151:begin max_bai<=4'b0110;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd152:begin max_bai<=4'b0110;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd153:begin max_bai<=4'b0110;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd154:begin max_bai<=4'b0110;max_shi<=4'b0001;max_ge<=4'b0110;end
 8'd155:begin max_bai<=4'b0110;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd156:begin max_bai<=4'b0110;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd157:begin max_bai<=4'b0110;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd158:begin max_bai<=4'b0110;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd159:begin max_bai<=4'b0110;max_shi<=4'b0011;max_ge<=4'b0110;end
 
   8'd160:begin max_bai<=4'b0110;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd161:begin max_bai<=4'b0110;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd162:begin max_bai<=4'b0110;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd163:begin max_bai<=4'b0110;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd164:begin max_bai<=4'b0110;max_shi<=4'b0101;max_ge<=4'b0110;end
 8'd165:begin max_bai<=4'b0110;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd166:begin max_bai<=4'b0110;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd167:begin max_bai<=4'b0110;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd168:begin max_bai<=4'b0110;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd169:begin max_bai<=4'b0110;max_shi<=4'b0111;max_ge<=4'b0110;end
 
   8'd170:begin max_bai<=4'b0110;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd171:begin max_bai<=4'b0110;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd172:begin max_bai<=4'b0110;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd173:begin max_bai<=4'b0110;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd174:begin max_bai<=4'b0110;max_shi<=4'b1001;max_ge<=4'b0110;end
 8'd175:begin max_bai<=4'b0111;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd176:begin max_bai<=4'b0111;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd177:begin max_bai<=4'b0111;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd178:begin max_bai<=4'b0111;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd179:begin max_bai<=4'b0111;max_shi<=4'b0001;max_ge<=4'b0110;end
 
   8'd180:begin max_bai<=4'b0111;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd181:begin max_bai<=4'b0111;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd182:begin max_bai<=4'b0111;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd183:begin max_bai<=4'b0111;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd184:begin max_bai<=4'b0111;max_shi<=4'b0011;max_ge<=4'b0110;end
 8'd185:begin max_bai<=4'b0111;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd186:begin max_bai<=4'b0111;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd187:begin max_bai<=4'b0111;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd188:begin max_bai<=4'b0111;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd189:begin max_bai<=4'b0111;max_shi<=4'b0101;max_ge<=4'b0110;end
 
   8'd190:begin max_bai<=4'b0111;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd191:begin max_bai<=4'b0111;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd192:begin max_bai<=4'b0111;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd193:begin max_bai<=4'b0111;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd194:begin max_bai<=4'b0111;max_shi<=4'b0111;max_ge<=4'b0110;end
 8'd195:begin max_bai<=4'b0111;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd196:begin max_bai<=4'b0111;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd197:begin max_bai<=4'b0111;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd198:begin max_bai<=4'b0111;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd199:begin max_bai<=4'b0111;max_shi<=4'b1001;max_ge<=4'b0110;end



 8'd200:begin max_bai<=4'b1000;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd201:begin max_bai<=4'b1000;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd202:begin max_bai<=4'b1000;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd203:begin max_bai<=4'b1000;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd204:begin max_bai<=4'b1000;max_shi<=4'b0001;max_ge<=4'b0110;end
 8'd205:begin max_bai<=4'b1000;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd206:begin max_bai<=4'b1000;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd207:begin max_bai<=4'b1000;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd208:begin max_bai<=4'b1000;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd209:begin max_bai<=4'b1000;max_shi<=4'b0011;max_ge<=4'b0110;end

  8'd210:begin max_bai<=4'b1000;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd211:begin max_bai<=4'b1000;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd212:begin max_bai<=4'b1000;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd213:begin max_bai<=4'b1000;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd214:begin max_bai<=4'b1000;max_shi<=4'b0101;max_ge<=4'b0110;end
 8'd215:begin max_bai<=4'b1000;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd216:begin max_bai<=4'b1000;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd217:begin max_bai<=4'b1000;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd218:begin max_bai<=4'b1000;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd219:begin max_bai<=4'b1000;max_shi<=4'b0111;max_ge<=4'b0110;end
 
  8'd220:begin max_bai<=4'b1000;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd221:begin max_bai<=4'b1000;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd222:begin max_bai<=4'b1000;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd223:begin max_bai<=4'b1000;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd224:begin max_bai<=4'b1000;max_shi<=4'b1001;max_ge<=4'b0110;end
 8'd225:begin max_bai<=4'b1001;max_shi<=4'b0000;max_ge<=4'b0000;end
 8'd226:begin max_bai<=4'b1001;max_shi<=4'b0000;max_ge<=4'b0100;end
 8'd227:begin max_bai<=4'b1001;max_shi<=4'b0000;max_ge<=4'b1000;end
 8'd228:begin max_bai<=4'b1001;max_shi<=4'b0001;max_ge<=4'b0010;end
 8'd229:begin max_bai<=4'b1001;max_shi<=4'b0001;max_ge<=4'b0110;end
 
   8'd230:begin max_bai<=4'b1001;max_shi<=4'b0010;max_ge<=4'b0000;end
 8'd231:begin max_bai<=4'b1001;max_shi<=4'b0010;max_ge<=4'b0100;end
 8'd232:begin max_bai<=4'b1001;max_shi<=4'b0010;max_ge<=4'b1000;end
 8'd233:begin max_bai<=4'b1001;max_shi<=4'b0011;max_ge<=4'b0010;end
 8'd234:begin max_bai<=4'b1001;max_shi<=4'b0011;max_ge<=4'b0110;end
 8'd235:begin max_bai<=4'b1001;max_shi<=4'b0100;max_ge<=4'b0000;end
 8'd236:begin max_bai<=4'b1001;max_shi<=4'b0100;max_ge<=4'b0100;end
 8'd237:begin max_bai<=4'b1001;max_shi<=4'b0100;max_ge<=4'b1000;end
 8'd238:begin max_bai<=4'b1001;max_shi<=4'b0101;max_ge<=4'b0010;end
 8'd239:begin max_bai<=4'b1001;max_shi<=4'b0101;max_ge<=4'b0110;end
 
   8'd240:begin max_bai<=4'b1001;max_shi<=4'b0110;max_ge<=4'b0000;end
 8'd241:begin max_bai<=4'b1001;max_shi<=4'b0110;max_ge<=4'b0100;end
 8'd242:begin max_bai<=4'b1001;max_shi<=4'b0110;max_ge<=4'b1000;end
 8'd243:begin max_bai<=4'b1001;max_shi<=4'b0111;max_ge<=4'b0010;end
 8'd244:begin max_bai<=4'b1001;max_shi<=4'b0111;max_ge<=4'b0110;end
 8'd245:begin max_bai<=4'b1001;max_shi<=4'b1000;max_ge<=4'b0000;end
 8'd246:begin max_bai<=4'b1001;max_shi<=4'b1000;max_ge<=4'b0100;end
 8'd247:begin max_bai<=4'b1001;max_shi<=4'b1000;max_ge<=4'b1000;end
 8'd248:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b0010;end
 8'd249:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b0110;end
 
   8'd250:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b1001;end
 8'd251:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b1001;end
 8'd252:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b1001;end
 8'd253:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b1001;end
 8'd254:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b1001;end
 8'd255:begin max_bai<=4'b1001;max_shi<=4'b1001;max_ge<=4'b1001;end

endcase

end

endmodule
