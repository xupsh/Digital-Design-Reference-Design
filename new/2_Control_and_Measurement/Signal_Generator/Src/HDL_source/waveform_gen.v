`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/21 20:26:04
// Design Name: 
// Module Name: waveform_gen
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


module waveform_gen(
input mclk,//input clock, 100MHz
input key_t,//thousand bit of waveform frequence setting
input key_h,//hundred bit of waveform frequence setting
input key_d,//decade bit of waveform frequence setting
input key_u,//unit bit of waveform frequence setting
input[1:0]wave_type,//waveform category select: 00: triangular_wave;01:square_wave;10:sawtooth_wave;11:sin_wave;

//segment display
output  [6:0] seg,
output  [3:0] an,
output wire dp ,

output clk_da,
output reg[7:0] data_gen//waveform data output
    );
wire clk100,clk50;
clock u_clk(
.clk_in1(mclk),
.clk_out1(clk100),
.clk_out2(clk50)
);
//da clock
assign clk_da = clk50;
//key debounce
wire key_t_debounce;
wire key_h_debounce;
wire key_d_debounce;
wire key_u_debounce;

debounce_0 u_debounce_key_t(
.i(key_t),
.clr(1'b0),
.clk(clk100),
.o(key_t_debounce)
);
reg[3:0]key_t_cnt;
always@(posedge key_t_debounce)begin
if(key_t_cnt>=4)
key_t_cnt <= 0;
else
key_t_cnt <= key_t_cnt+1;
end

 debounce_0 u_debounce_key_h(
.i(key_h),
.clr(1'b0),
.clk(clk100),
.o(key_h_debounce)
);
reg[3:0]key_h_cnt;
always@(posedge key_h_debounce)begin
if(key_h_cnt>=9)
key_h_cnt <= 0;
else
key_h_cnt <= key_h_cnt+1;
end
 debounce_0 u_debounce_key_d(
.i(key_d),
.clr(1'b0),
.clk(clk100),
.o(key_d_debounce)
);
reg[3:0]key_d_cnt;
always@(posedge key_d_debounce)begin
if(key_d_cnt>=9)
key_d_cnt <= 0;
else
key_d_cnt <= key_d_cnt+1;
end
 debounce_0 u_debounce_key_u(
.i(key_u),
.clr(1'b0),
.clk(clk100),
.o(key_u_debounce)
);
reg[3:0]key_u_cnt;
always@(posedge key_u_debounce)begin
if(key_u_cnt>=9)
key_u_cnt <= 0;
else
key_u_cnt <= key_u_cnt+1;
end

  //segment display
  seg7decimal_0 u_seg(
  . x({key_t_cnt,key_h_cnt,key_d_cnt,key_u_cnt}),
  .clk(clk100),
  .clr(1'b0),
  .a_to_g(seg),
  .an(an),
  .dp (dp)
  );
wire[23:0] divisor;
wire[55:0]temp;
assign divisor =( key_t_cnt*1000 + key_h_cnt*100 + key_d_cnt*10 + key_u_cnt)*512;
  div_gen_0 u_div(
    .s_axis_divisor_tdata(divisor),
    .s_axis_divisor_tvalid(1'b1),    
     .s_axis_dividend_tdata(32'd100000000),
    .s_axis_dividend_tvalid(1'b1),    
        .m_axis_dout_tdata(temp),
    .aclk(clk100)
    );
    wire[31:0]div_cnt;
    assign div_cnt = temp[55:24];
    reg[31:0] clk_Fre_cnt;
    reg clk_data;
always@(posedge clk100)begin
if(clk_Fre_cnt>=div_cnt)begin
clk_Fre_cnt <= 0;
clk_data <=~clk_data;
end
else
clk_Fre_cnt<= clk_Fre_cnt+1;
end

//waveform type
reg [7:0] triangular_wave;
reg [7:0] square_wave;
reg [7:0] sawtooth_wave;
reg [7:0] sin_wave;

reg triangular_wave_sign;
reg [7:0]square_wave_cnt;
reg [7:0] sin_wave_cnt;

//triangular_wave
always@(posedge clk_data)begin
    if(triangular_wave_sign==1) begin
        if(triangular_wave==255)begin
            triangular_wave_sign <= 0;   
        end
        else
            triangular_wave <= triangular_wave+1;
    end
    else begin
        if(triangular_wave==0)begin
            triangular_wave_sign <= 1;
        end
        else    
            triangular_wave <= triangular_wave-1;
    end
end
//square_wave
always@(posedge clk_data)begin
    if(square_wave_cnt==255) 
        square_wave_cnt <= 0;
    else
        square_wave_cnt <= square_wave_cnt + 1;
end
always@(posedge clk_data)begin
  if(square_wave_cnt<128)
    square_wave <= 0;
  else
    square_wave <= 255;
end
//square_wave_cnt
always@(posedge clk_data)begin
    if(sawtooth_wave==255)
        sawtooth_wave <= 0;   
    else
        sawtooth_wave <= sawtooth_wave+1;
end

always@(*)begin
    case (wave_type)
        2'b00: data_gen <= triangular_wave;
        2'b01: data_gen <= square_wave;
        2'b10: data_gen <= sawtooth_wave;
        2'b11: data_gen <= sin_wave;
        
        default: data_gen <= triangular_wave;
    endcase
end

//sin_wave_cnt
always@(posedge clk_data)begin
    if(sin_wave_cnt==255)
        sin_wave_cnt <= 0;   
    else
        sin_wave_cnt <= sin_wave_cnt+1;
end

//sin_rom u_sin(
//.addra(sin_wave_cnt),
//.clka(clk_data),
//.douta(sin_wave)
//);
always@(*)begin
 case (sin_wave_cnt)
8'd0:sin_wave <= 8'd128;
8'd1:sin_wave <= 8'd131;
8'd2:sin_wave <= 8'd134;
8'd3:sin_wave <= 8'd137;
8'd4:sin_wave <= 8'd140;
8'd5:sin_wave <= 8'd143;
8'd6:sin_wave <= 8'd146;
8'd7:sin_wave <= 8'd149;
8'd8:sin_wave <= 8'd152;
8'd9:sin_wave <= 8'd156;
8'd10:sin_wave <= 8'd159;
8'd11:sin_wave <= 8'd162;
8'd12:sin_wave <= 8'd165;
8'd13:sin_wave <= 8'd168;
8'd14:sin_wave <= 8'd171;
8'd15:sin_wave <= 8'd174;
8'd16:sin_wave <= 8'd176;
8'd17:sin_wave <= 8'd179;
8'd18:sin_wave <= 8'd182;
8'd19:sin_wave <= 8'd185;
8'd20:sin_wave <= 8'd188;
8'd21:sin_wave <= 8'd191;
8'd22:sin_wave <= 8'd193;
8'd23:sin_wave <= 8'd196;
8'd24:sin_wave <= 8'd199;
8'd25:sin_wave <= 8'd201;
8'd26:sin_wave <= 8'd204;
8'd27:sin_wave <= 8'd206;
8'd28:sin_wave <= 8'd209;
8'd29:sin_wave <= 8'd211;
8'd30:sin_wave <= 8'd213;
8'd31:sin_wave <= 8'd216;
8'd32:sin_wave <= 8'd218;
8'd33:sin_wave <= 8'd220;
8'd34:sin_wave <= 8'd222;
8'd35:sin_wave <= 8'd224;
8'd36:sin_wave <= 8'd226;
8'd37:sin_wave <= 8'd228;
8'd38:sin_wave <= 8'd230;
8'd39:sin_wave <= 8'd232;
8'd40:sin_wave <= 8'd234;
8'd41:sin_wave <= 8'd236;
8'd42:sin_wave <= 8'd237;
8'd43:sin_wave <= 8'd239;
8'd44:sin_wave <= 8'd240;
8'd45:sin_wave <= 8'd242;
8'd46:sin_wave <= 8'd243;
8'd47:sin_wave <= 8'd245;
8'd48:sin_wave <= 8'd246;
8'd49:sin_wave <= 8'd247;
8'd50:sin_wave <= 8'd248;
8'd51:sin_wave <= 8'd249;
8'd52:sin_wave <= 8'd250;
8'd53:sin_wave <= 8'd251;
8'd54:sin_wave <= 8'd252;
8'd55:sin_wave <= 8'd252;
8'd56:sin_wave <= 8'd253;
8'd57:sin_wave <= 8'd254;
8'd58:sin_wave <= 8'd254;
8'd59:sin_wave <= 8'd255;
8'd60:sin_wave <= 8'd255;
8'd61:sin_wave <= 8'd255;
8'd62:sin_wave <= 8'd255;
8'd63:sin_wave <= 8'd255;
8'd64:sin_wave <= 8'd255;
8'd65:sin_wave <= 8'd255;
8'd66:sin_wave <= 8'd255;
8'd67:sin_wave <= 8'd255;
8'd68:sin_wave <= 8'd255;
8'd69:sin_wave <= 8'd255;
8'd70:sin_wave <= 8'd254;
8'd71:sin_wave <= 8'd254;
8'd72:sin_wave <= 8'd253;
8'd73:sin_wave <= 8'd252;
8'd74:sin_wave <= 8'd252;
8'd75:sin_wave <= 8'd251;
8'd76:sin_wave <= 8'd250;
8'd77:sin_wave <= 8'd249;
8'd78:sin_wave <= 8'd248;
8'd79:sin_wave <= 8'd247;
8'd80:sin_wave <= 8'd246;
8'd81:sin_wave <= 8'd245;
8'd82:sin_wave <= 8'd243;
8'd83:sin_wave <= 8'd242;
8'd84:sin_wave <= 8'd240;
8'd85:sin_wave <= 8'd239;
8'd86:sin_wave <= 8'd237;
8'd87:sin_wave <= 8'd236;
8'd88:sin_wave <= 8'd234;
8'd89:sin_wave <= 8'd232;
8'd90:sin_wave <= 8'd230;
8'd91:sin_wave <= 8'd228;
8'd92:sin_wave <= 8'd226;
8'd93:sin_wave <= 8'd224;
8'd94:sin_wave <= 8'd222;
8'd95:sin_wave <= 8'd220;
8'd96:sin_wave <= 8'd218;
8'd97:sin_wave <= 8'd216;
8'd98:sin_wave <= 8'd213;
8'd99:sin_wave <= 8'd211;
8'd100:sin_wave <= 8'd209;
8'd101:sin_wave <= 8'd206;
8'd102:sin_wave <= 8'd204;
8'd103:sin_wave <= 8'd201;
8'd104:sin_wave <= 8'd199;
8'd105:sin_wave <= 8'd196;
8'd106:sin_wave <= 8'd193;
8'd107:sin_wave <= 8'd191;
8'd108:sin_wave <= 8'd188;
8'd109:sin_wave <= 8'd185;
8'd110:sin_wave <= 8'd182;
8'd111:sin_wave <= 8'd179;
8'd112:sin_wave <= 8'd176;
8'd113:sin_wave <= 8'd174;
8'd114:sin_wave <= 8'd171;
8'd115:sin_wave <= 8'd168;
8'd116:sin_wave <= 8'd165;
8'd117:sin_wave <= 8'd162;
8'd118:sin_wave <= 8'd159;
8'd119:sin_wave <= 8'd156;
8'd120:sin_wave <= 8'd152;
8'd121:sin_wave <= 8'd149;
8'd122:sin_wave <= 8'd146;
8'd123:sin_wave <= 8'd143;
8'd124:sin_wave <= 8'd140;
8'd125:sin_wave <= 8'd137;
8'd126:sin_wave <= 8'd134;
8'd127:sin_wave <= 8'd131;
8'd128:sin_wave <= 8'd128;
8'd129:sin_wave <= 8'd125;
8'd130:sin_wave <= 8'd122;
8'd131:sin_wave <= 8'd119;
8'd132:sin_wave <= 8'd116;
8'd133:sin_wave <= 8'd113;
8'd134:sin_wave <= 8'd110;
8'd135:sin_wave <= 8'd107;
8'd136:sin_wave <= 8'd104;
8'd137:sin_wave <= 8'd100;
8'd138:sin_wave <= 8'd97;
8'd139:sin_wave <= 8'd94;
8'd140:sin_wave <= 8'd91;
8'd141:sin_wave <= 8'd88;
8'd142:sin_wave <= 8'd85;
8'd143:sin_wave <= 8'd82;
8'd144:sin_wave <= 8'd80;
8'd145:sin_wave <= 8'd77;
8'd146:sin_wave <= 8'd74;
8'd147:sin_wave <= 8'd71;
8'd148:sin_wave <= 8'd68;
8'd149:sin_wave <= 8'd65;
8'd150:sin_wave <= 8'd63;
8'd151:sin_wave <= 8'd60;
8'd152:sin_wave <= 8'd57;
8'd153:sin_wave <= 8'd55;
8'd154:sin_wave <= 8'd52;
8'd155:sin_wave <= 8'd50;
8'd156:sin_wave <= 8'd47;
8'd157:sin_wave <= 8'd45;
8'd158:sin_wave <= 8'd43;
8'd159:sin_wave <= 8'd40;
8'd160:sin_wave <= 8'd38;
8'd161:sin_wave <= 8'd36;
8'd162:sin_wave <= 8'd34;
8'd163:sin_wave <= 8'd32;
8'd164:sin_wave <= 8'd30;
8'd165:sin_wave <= 8'd28;
8'd166:sin_wave <= 8'd26;
8'd167:sin_wave <= 8'd24;
8'd168:sin_wave <= 8'd22;
8'd169:sin_wave <= 8'd20;
8'd170:sin_wave <= 8'd19;
8'd171:sin_wave <= 8'd17;
8'd172:sin_wave <= 8'd16;
8'd173:sin_wave <= 8'd14;
8'd174:sin_wave <= 8'd13;
8'd175:sin_wave <= 8'd11;
8'd176:sin_wave <= 8'd10;
8'd177:sin_wave <= 8'd9;
8'd178:sin_wave <= 8'd8;
8'd179:sin_wave <= 8'd7;
8'd180:sin_wave <= 8'd6;
8'd181:sin_wave <= 8'd5;
8'd182:sin_wave <= 8'd4;
8'd183:sin_wave <= 8'd4;
8'd184:sin_wave <= 8'd3;
8'd185:sin_wave <= 8'd2;
8'd186:sin_wave <= 8'd2;
8'd187:sin_wave <= 8'd1;
8'd188:sin_wave <= 8'd1;
8'd189:sin_wave <= 8'd1;
8'd190:sin_wave <= 8'd1;
8'd191:sin_wave <= 8'd1;
8'd192:sin_wave <= 8'd1;
8'd193:sin_wave <= 8'd1;
8'd194:sin_wave <= 8'd1;
8'd195:sin_wave <= 8'd1;
8'd196:sin_wave <= 8'd1;
8'd197:sin_wave <= 8'd1;
8'd198:sin_wave <= 8'd2;
8'd199:sin_wave <= 8'd2;
8'd200:sin_wave <= 8'd3;
8'd201:sin_wave <= 8'd4;
8'd202:sin_wave <= 8'd4;
8'd203:sin_wave <= 8'd5;
8'd204:sin_wave <= 8'd6;
8'd205:sin_wave <= 8'd7;
8'd206:sin_wave <= 8'd8;
8'd207:sin_wave <= 8'd9;
8'd208:sin_wave <= 8'd10;
8'd209:sin_wave <= 8'd11;
8'd210:sin_wave <= 8'd13;
8'd211:sin_wave <= 8'd14;
8'd212:sin_wave <= 8'd16;
8'd213:sin_wave <= 8'd17;
8'd214:sin_wave <= 8'd19;
8'd215:sin_wave <= 8'd20;
8'd216:sin_wave <= 8'd22;
8'd217:sin_wave <= 8'd24;
8'd218:sin_wave <= 8'd26;
8'd219:sin_wave <= 8'd28;
8'd220:sin_wave <= 8'd30;
8'd221:sin_wave <= 8'd32;
8'd222:sin_wave <= 8'd34;
8'd223:sin_wave <= 8'd36;
8'd224:sin_wave <= 8'd38;
8'd225:sin_wave <= 8'd40;
8'd226:sin_wave <= 8'd43;
8'd227:sin_wave <= 8'd45;
8'd228:sin_wave <= 8'd47;
8'd229:sin_wave <= 8'd50;
8'd230:sin_wave <= 8'd52;
8'd231:sin_wave <= 8'd55;
8'd232:sin_wave <= 8'd57;
8'd233:sin_wave <= 8'd60;
8'd234:sin_wave <= 8'd63;
8'd235:sin_wave <= 8'd65;
8'd236:sin_wave <= 8'd68;
8'd237:sin_wave <= 8'd71;
8'd238:sin_wave <= 8'd74;
8'd239:sin_wave <= 8'd77;
8'd240:sin_wave <= 8'd80;
8'd241:sin_wave <= 8'd82;
8'd242:sin_wave <= 8'd85;
8'd243:sin_wave <= 8'd88;
8'd244:sin_wave <= 8'd91;
8'd245:sin_wave <= 8'd94;
8'd246:sin_wave <= 8'd97;
8'd247:sin_wave <= 8'd100;
8'd248:sin_wave <= 8'd104;
8'd249:sin_wave <= 8'd107;
8'd250:sin_wave <= 8'd110;
8'd251:sin_wave <= 8'd113;
8'd252:sin_wave <= 8'd116;
8'd253:sin_wave <= 8'd119;
8'd254:sin_wave <= 8'd122;
8'd255:sin_wave <= 8'd125;
endcase
end


endmodule
