`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/21 19:27:07
// Design Name: 
// Module Name: OSC_top
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


module OSC_top(
input mclk,
input[15:0] sw,
input btn_ChangeFre,key_t,key_h,key_d,key_u,
output hsync,vsync,
output[2:0]red,green,
output[1:0]blue,
output [7:0]LED,
output[11:0]seg,
input A_VAUXP,A_VAUXN,B_VAUXP,B_VAUXN//A_VAUX is from  JXADC3,B_VAUX is from  JXADC1
    );
    wire[7:0]temp;
wire clk100,clk800,clk_vga;
    
 wire[3:0] aa_in_ge;
 wire[3:0] ba_in_shi;
 wire[3:0] ca_in_bai;
 wire[3:0] da_in_qian;
 wire[3:0] ea_in_wan;
 wire[3:0] fa_in_shiwan;
 wire[3:0] vopp_ge;
 wire[3:0] vopp_shi;
 wire[3:0] vopp_bai;

 wire[3:0] ad_ge;
 wire[3:0] ad_shi;
 wire[3:0] ad_bai;
 wire[3:0] ad_qian;
 wire[3:0] ad_wan;
 wire[3:0] ad_shiwan;
 wire[3:0] ad_vopp_bai;
 wire[3:0] ad_vopp_shi;
 wire[3:0] ad_vopp_ge;
wire [15:0] F_ge;
wire [15:0] F_shi;
wire [15:0] F_bai;
wire [15:0] F_qian;
wire [15:0] F_wan;
wire [15:0] F_shiwan;
wire [15:0] F_opp_bai;
wire [15:0] F_opp_shi;
wire [15:0] F_opp_ge;

pinlv_count u_PC(
	.aa_in_ge(aa_in_ge),
	.ba_in_shi(ba_in_shi),
	. ca_in_bai(ca_in_bai),
	. da_in_qian(da_in_qian),
	. ea_in_wan(ea_in_wan),
	. fa_in_shiwan(fa_in_shiwan),
	. ga_in_opp_bai(vopp_bai),
	. ha_in_opp_shi(vopp_shi),
	. ha_in_opp_ge(vopp_ge),

	. ad_ge(ad_ge),
	. ad_shi(ad_shi),
	. ad_bai(ad_bai),
	. ad_qian(ad_qian),
	. ad_wan(ad_wan),
	. ad_shiwan(ad_shiwan),
	. ad_opp_bai(ad_vopp_bai),
	. ad_opp_shi(ad_vopp_shi),
	. ad_opp_ge(ad_vopp_ge),

	. F_ge(F_ge),
	. F_shi(F_shi),
	. F_bai(F_bai),
	. F_qian(F_qian),
	. F_wan(F_wan),
	. F_shiwan(F_shiwan),
	. F_opp_bai(F_opp_bai),
	. F_opp_shi(F_opp_shi),
	. F_opp_ge(F_opp_ge)
	
);
   
wire[7:0] addr;
wire[0:127] M;
prom u_prom(
    .addr(addr),
    . M(M)
);

wire[5:0]addr_F;
wire[0:63]F;
prom_F u_prom_F(
    .addr_F(addr_F),
    .F(F)
);

reg clk_vga;
wire[9:0] hc;
wire[9:0] vc;
wire vidon;

wire DCLK_25,DCLK_50,DCLK_100,DCLK_200,DCLK_400;
clock u_clock(
    .clk_in1(mclk),
    .clk_out1(clk100),
    .clk_out2(clk_vga),
    .clk_out3(DCLK_25),
    .clk_out4(DCLK_50),    
    .clk_out5(DCLK_100),
    .clk_out6(DCLK_200),    
    .clk_out7(DCLK_400)
);

vga_shixu u_vga(
    .clk(clk_vga),
    .clr(1'b0),
    .hsync(hsync),
    .vsync(vsync),
    .hc(hc),
    .vc(vc),
    .vidon(vidon)
);
wire[9:0]wave_addr;
vga_initials(
	.hc(hc),
	.vc(vc),
	.vidon(vidon),
	.M(M),
	.F(F),

	.F_ge(F_ge),
	.F_shi(F_shi),
	.F_bai(F_bai),
	.F_qian(F_qian),
	.F_wan(F_wan),
	.F_shiwan(F_shiwan),
	.F_opp_bai(F_opp_bai),
	.F_opp_shi(F_opp_shi),
	.F_opp_ge(F_opp_ge),
	
	//output wire[7:0]rom_addr8(),
	.red(red),
	.green(green),
	.blue(blue),
	.ra_addr_Fge(ad_ge),
	.ra_addr_Fshi(ad_shi),
	.ra_addr_Fbai(ad_bai),
	.ra_addr_Fqian(ad_qian),
	.ra_addr_Fwan(ad_wan),
	.ra_addr_Fshiwan(ad_shiwan),
	.ra_addr_F_opp_bai(ad_vopp_bai),
	.ra_addr_F_opp_shi(ad_vopp_shi),
	.ra_addr_F_opp_ge(ad_vopp_ge),

	.rom_addr4(addr_F),
	.addr_out(wave_addr)   //to waveform addr

);
wire key;
 key_debounce u_debounce(
.inp(btn_ChangeFre),

.clk(clk100),
.clr(1'b0),

.outp(key)
);
reg[2:0]key_cnt;
assign LED[7:0] = 8'd0;
always@(posedge key)begin
if(key_cnt>=4)
key_cnt <= 0;
else
key_cnt<= key_cnt+1;
end
reg DCLK;

reg clk_AD;
reg[9:0]cnt;
always@(posedge DCLK)begin
if(cnt>249)begin
cnt <= 0;
clk_AD <= ~clk_AD;
end
else
cnt <= cnt+1;
end


always@(*)begin
case (key_cnt)
3'b000:begin DCLK <= DCLK_25;end
3'b001:begin DCLK <= DCLK_50;end
3'b010:begin DCLK <= DCLK_100;end
3'b011:begin DCLK <= DCLK_200;end
3'b100:begin DCLK <= DCLK_400;end
default:begin DCLK <= DCLK_100;end
endcase
end

xadc_top u_xadc(
    .clk100(clk100),
    .RESET(1'b0),
    .DCLK(DCLK),
    .temp(temp),
    .seg(),
    .sw(1'b0),
    .A_VAUXP(A_VAUXP),
    .A_VAUXN(A_VAUXN),
    .B_VAUXP(B_VAUXP),
    .B_VAUXN(B_VAUXN)//A_VAUX is from  JXADC3,B_VAUX is from  JXADC1
);
    
wire[7:0]data_gen;
waveform_gen u_WaveGen(
    .clk100(clk100),
    .key_t(key_t),
    .key_h(key_h),
    .key_d(key_d),
    .key_u(key_u),
    .wave_type(sw[1:0]),
    .data_gen(data_gen),
    .seg(seg)
);
wire [7:0]wave_show;

assign wave_show = (sw[15]==1)?data_gen:temp;




wire[7:0]trigger_DO0;
wire[7:0]trigger_DO1;
wire[7:0]trigger_DO2;
wire[7:0]trigger_DO3;

 trigger u_tri(
. clk_AD(clk_AD),
.trigger_DI(wave_show),
.trigger_DO0(trigger_DO0),
.trigger_DO1(trigger_DO1),
.trigger_DO2(trigger_DO2),
.trigger_DO3(trigger_DO3)
    );
    
wire clk05Hz;
waveform_ram u_ram(
    .clk_AD(clk_AD),
    .clk_05Hz(clk05Hz),
    .addr_in(wave_addr),//由vga行扫描信号产生的地址值，随着hsync加一而加一
    .trig_DI0(trigger_DO0),//仅作触发条件判断用
    .trig_DI1(trigger_DO1),//仅作触发条件判断用
    .trig_DI2(trigger_DO2),//仅作触发条件判断用
    .trig_DI3(trigger_DO3),//仅作触发条件判断用
    .max_ge(vopp_ge),
    .max_shi(vopp_shi),
    .max_bai(vopp_bai),
    
    .data_in(wave_show),//波形数据
    .data_out(addr)//根据addr-in得到的sram中的值
        );
        

Fre_Calculate u_CalFre(
    .clk100(clk100),
    .clk05Hz(clk05Hz),
    .data_in(wave_show),//waveform data
    .Fre_ge(aa_in_ge),
    .Fre_shi(ba_in_shi),
    .Fre_bai(ca_in_bai),
    .Fre_qian(da_in_qian),
    .Fre_wan(ea_in_wan),
    .Fre_shiwan(fa_in_shiwan)
);
endmodule
