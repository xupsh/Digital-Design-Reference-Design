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
input btn_ChangeFre,

//vga
output hsync,vsync,
output[2:0]red,green,
output[1:0]blue,

//xadc
input vauxp6, vauxn6,  // Auxiliary analog channel inputs
 input vauxp7, vauxn7,  // Auxiliary analog channel inputs
 input vauxp14, vauxn14,  // Auxiliary analog channel inputs
 input vauxp15, vauxn15  // Auxiliary analog channel inputs
    );
    wire[7:0]temp;
wire clk100,clk_vga;

 wire[3:0] fre_num_u;//unit
 wire[3:0] fre_num_d;//decade
 wire[3:0] fre_num_h;//hundreds 
 wire[3:0] fre_num_t;//thousand
 wire[3:0] fre_num_m;//myria
 wire[3:0] fre_num_l;//lac
 wire[3:0] vopp_num_h;//hundreds 
 wire[3:0] vopp_num_d;//decade
 wire[3:0] vopp_num_u;//unit

 wire[3:0] fre_addr_u;
 wire[3:0] fre_addr_d;
 wire[3:0] fre_addr_h;
 wire[3:0] fre_addr_t;
 wire[3:0] fre_addr_m;
 wire[3:0] fre_addr_l;
 wire[3:0] vopp_addr_h;
 wire[3:0] vopp_addr_d;
 wire[3:0] vopp_addr_u;
wire [15:0] rom_fre_u;
wire [15:0] rom_fre_d;
wire [15:0] rom_fre_h;
wire [15:0] rom_fre_t;
wire [15:0] rom_fre_m;
wire [15:0] rom_fre_l;
wire [15:0] rom_vopp_h;
wire [15:0] rom_vopp_d;
wire [15:0] rom_vopp_u;

char_rom_mapping u_mapping(
.fre_num_u(fre_num_u),//unit
.fre_num_d(fre_num_d),//decade
.fre_num_h(fre_num_h),//hundreds 
.fre_num_t(fre_num_t),//thousand
.fre_num_m(fre_num_m),//myria
.fre_num_l(fre_num_l),//lac
.vopp_num_h(vopp_num_h),
.vopp_num_d(vopp_num_d),
.vopp_num_u(vopp_num_u),

.fre_addr_u(fre_addr_u),
.fre_addr_d(fre_addr_d),
.fre_addr_h(fre_addr_h),
.fre_addr_t(fre_addr_t),
.fre_addr_m(fre_addr_m),
.fre_addr_l(fre_addr_l),
.vopp_addr_h(vopp_addr_h),
.vopp_addr_d(vopp_addr_d),
.vopp_addr_u(vopp_addr_u),

.rom_fre_u(rom_fre_u),
.rom_fre_d(rom_fre_d),
.rom_fre_h(rom_fre_h),
.rom_fre_t(rom_fre_t),
.rom_fre_m(rom_fre_m),
.rom_fre_l(rom_fre_l),
.rom_vopp_h(rom_vopp_h),
.rom_vopp_d(rom_vopp_d),
.rom_vopp_u(rom_vopp_u)
);
   
//waveform mapping rom 
wire[7:0] addr;
wire[0:127] M;
waveform_mapping_rom u_waveform_mapping_rom(
    .addr(addr),
    . M(M)
);

//Fre mapping rom 
wire[5:0]addr_Fre_Vopp;
wire[0:63]F;
Fre_Vopp_mapping_rom u_Fre_Vopp_mapping_rom(
    .addr_Fre_Vopp(addr_Fre_Vopp),
    .F(F)
);

reg clk_vga;//25MHz
wire[9:0] hc;
wire[9:0] vc;
wire vidon;

wire DCLK_25,DCLK_50,DCLK_100,DCLK_200,DCLK_400;

vga_0 u_vga(
    .vga_pclk(clk_vga),
    .vga_rst(1'b0),
    .vga_hsync(hsync),
    .vga_vsync(vsync),
    .vga_h_cnt(hc),
    .vga_v_cnt(vc),
    .vga_valid(vidon)
);
wire[9:0]wave_addr;
vga_initials(
	.hcnt(hc),
	.vcnt(vc),
	.vidon(vidon),
	.M(M),
	.F(F),

	.rom_fre_u(rom_fre_u),
	.rom_fre_d(rom_fre_d),
	.rom_fre_h(rom_fre_h),
	.rom_fre_t(rom_fre_t),
	.rom_fre_m(rom_fre_m),
	.rom_fre_l(rom_fre_l),
	.rom_vopp_h(rom_vopp_h),
	.rom_vopp_d(rom_vopp_d),
	.rom_vopp_u(rom_vopp_u),
	
	.red(red),
	.green(green),
	.blue(blue),
	.addr_rom_fre_u(fre_addr_u),
	.addr_rom_fre_d(fre_addr_d),
	.addr_rom_fre_h(fre_addr_h),
	.addr_rom_fre_t(fre_addr_t),
	.addr_rom_fre_m(fre_addr_m),
	.addr_rom_fre_l(fre_addr_l),
	.addr_rom_vopp_h(vopp_addr_h),
	.addr_rom_vopp_d(vopp_addr_d),
	.addr_rom_vopp_u(vopp_addr_u),

	.rom_addr4(addr_Fre_Vopp),
	.addr_out(wave_addr)   //to waveform addr
);

wire clk_AD;
clock_control(
. mclk(mclk),
. key(btn_ChangeFre),
. clk_out1(clk100),
. clk_out2(clk_vga),
. clk_out3(DCLK_25),
. clk_out4(DCLK_50),
. clk_out5(DCLK_100),
. clk_out6(DCLK_200),
. clk_out7(DCLK_400),
. clk_AD(clk_AD)
    );
wire[15:0]MEASURED_AUX;
assign temp = MEASURED_AUX[15:8];
//XADC module, MEASURED_AUX is AD sample data output
xadc_0 u_xadc(
    .clk100(clk100),
    .rst(1'b0),
    .vauxp6(vauxp6),
    .vauxn6(vauxn6),
    .vauxp7(vauxp7),
    .vauxn7(vauxn7),
    .vauxp14(vauxp14),
    .vauxn14(vauxn14),
    .vauxp15(vauxp15),
    .vauxn15(vauxn15),    
    .aux_out_6(MEASURED_AUX),
    .aux_out_7(),
    .aux_out_14(),
    .aux_out_15(),   
    .temperature_out()
);
    
wire [7:0]wave_show;
//waveform to be showed(from AD or waveform generater), select by SW[15]
assign wave_show = temp;

wire trigger;
//trigger module, rising edge 
 trigger u_tri(
.clk_AD(clk_AD),
.trigger_DI(wave_show),
.trigger(trigger)//trigger signal 
    );
    
wire clk05Hz;
waveform_ram u_ram(
    .clk_AD(clk_AD),//waveform ram write clock
    .clk_05Hz(clk05Hz),//refresh frequence of vopp number to be showed
    .addr_in(wave_addr),//waveform ram read address, from vga line count
    .trigger(trigger),//trigger signal
    .vopp_num_u(vopp_num_u),//vopp value unit
    .vopp_num_d(vopp_num_d),//vopp value decade
    .vopp_num_h(vopp_num_h),//vopp value hundred
    
    .data_in(wave_show),//waveform data in from AD or waveform generater, to be stored in waveform ram
    .data_out(addr)//waveform ram data, to be showed 
        );
        

Fre_Calculate u_CalFre(
    .clk100(clk100),//clock input,100MHz
    .clk05Hz(clk05Hz),//clock output,0.5 Hz
    .data_in(wave_show),//waveform data
    .fre_num_u(fre_num_u),//unit bit of frequence 
    .fre_num_d(fre_num_d),//decade bit of frequence 
    .fre_num_h(fre_num_h),//hundred bit of frequence 
    .fre_num_t(fre_num_t),//thousand bit of frequence 
    .fre_num_m(fre_num_m),//myria bit of frequence 
    .fre_num_l(fre_num_l)//lac bit of frequence 
);
endmodule
