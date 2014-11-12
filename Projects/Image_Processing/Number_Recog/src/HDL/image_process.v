`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/30 09:04:45
// Design Name: 
// Module Name: find_edge
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


module image_process(
input pclk,
input [11:0] VtcHCnt,
input [10:0] VtcVCnt,
input binary_i,
input[23:0] rgb_i,
output reg[23:0]rgb_render,
output reg[3:0]index,
output  reg binary_render,

output [3:0]rom_addr_9,
input wire[0:15]M_9,
output [3:0]rom_addr_8,
input wire[0:15]M_8,
output [3:0]rom_addr_7,
input wire[0:15]M_7,
output [3:0]rom_addr_6,
input wire[0:15]M_6,
output [3:0]rom_addr_5,
input wire[0:15]M_5,
output [3:0]rom_addr_4,
input wire[0:15]M_4,
output [3:0]rom_addr_3,
input wire[0:15]M_3,
output [3:0]rom_addr_2,
input wire[0:15]M_2,
output [3:0]rom_addr_1,
input wire[0:15]M_1,
output [3:0]rom_addr_0,
input wire[0:15]M_0
    );
reg [8:0]edge_up_temp,edge_down_temp,edge_left_temp,edge_right_temp;
reg [8:0]edge_up,edge_down,edge_left,edge_right;

reg[8:0] V_ram_temp[239:0];
reg[8:0] H_ram_temp[319:0];
reg[8:0] V_ram[239:0];
reg[8:0] H_ram[319:0];
//regin of interent(ROI) 320 x 240
reg en;
always@(*) begin
	if(VtcHCnt>=160-96 && VtcHCnt<160+96 && VtcVCnt>=120-34 && VtcVCnt<120+34 ) 
		en<= 1;
	else
		en<= 0;
end

//always@(posedge pclk) begin
//    if( binary_i==1)begin
//    V_ram_temp[120] <= V_ram_temp[120]+1;
//    H_ram_temp[VtcHCnt] <= H_ram_temp[VtcHCnt]+1;
//    end
//end

always@(posedge pclk) begin
if(VtcHCnt==0 && VtcVCnt == 0)begin
H_ram_temp[0] <= 0;
H_ram_temp[1] <= 0;
H_ram_temp[2] <= 0;
H_ram_temp[3] <= 0;
H_ram_temp[4] <= 0;
H_ram_temp[5] <= 0;
H_ram_temp[6] <= 0;
H_ram_temp[7] <= 0;
H_ram_temp[8] <= 0;
H_ram_temp[9] <= 0;
H_ram_temp[10] <= 0;
H_ram_temp[11] <= 0;
H_ram_temp[12] <= 0;
H_ram_temp[13] <= 0;
H_ram_temp[14] <= 0;
H_ram_temp[15] <= 0;
H_ram_temp[16] <= 0;
H_ram_temp[17] <= 0;
H_ram_temp[18] <= 0;
H_ram_temp[19] <= 0;
H_ram_temp[20] <= 0;
H_ram_temp[21] <= 0;
H_ram_temp[22] <= 0;
H_ram_temp[23] <= 0;
H_ram_temp[24] <= 0;
H_ram_temp[25] <= 0;
H_ram_temp[26] <= 0;
H_ram_temp[27] <= 0;
H_ram_temp[28] <= 0;
H_ram_temp[29] <= 0;
H_ram_temp[30] <= 0;
H_ram_temp[31] <= 0;
H_ram_temp[32] <= 0;
H_ram_temp[33] <= 0;
H_ram_temp[34] <= 0;
H_ram_temp[35] <= 0;
H_ram_temp[36] <= 0;
H_ram_temp[37] <= 0;
H_ram_temp[38] <= 0;
H_ram_temp[39] <= 0;
H_ram_temp[40] <= 0;
H_ram_temp[41] <= 0;
H_ram_temp[42] <= 0;
H_ram_temp[43] <= 0;
H_ram_temp[44] <= 0;
H_ram_temp[45] <= 0;
H_ram_temp[46] <= 0;
H_ram_temp[47] <= 0;
H_ram_temp[48] <= 0;
H_ram_temp[49] <= 0;
H_ram_temp[50] <= 0;
H_ram_temp[51] <= 0;
H_ram_temp[52] <= 0;
H_ram_temp[53] <= 0;
H_ram_temp[54] <= 0;
H_ram_temp[55] <= 0;
H_ram_temp[56] <= 0;
H_ram_temp[57] <= 0;
H_ram_temp[58] <= 0;
H_ram_temp[59] <= 0;
H_ram_temp[60] <= 0;
H_ram_temp[61] <= 0;
H_ram_temp[62] <= 0;
H_ram_temp[63] <= 0;
H_ram_temp[64] <= 0;
H_ram_temp[65] <= 0;
H_ram_temp[66] <= 0;
H_ram_temp[67] <= 0;
H_ram_temp[68] <= 0;
H_ram_temp[69] <= 0;
H_ram_temp[70] <= 0;
H_ram_temp[71] <= 0;
H_ram_temp[72] <= 0;
H_ram_temp[73] <= 0;
H_ram_temp[74] <= 0;
H_ram_temp[75] <= 0;
H_ram_temp[76] <= 0;
H_ram_temp[77] <= 0;
H_ram_temp[78] <= 0;
H_ram_temp[79] <= 0;
H_ram_temp[80] <= 0;
H_ram_temp[81] <= 0;
H_ram_temp[82] <= 0;
H_ram_temp[83] <= 0;
H_ram_temp[84] <= 0;
H_ram_temp[85] <= 0;
H_ram_temp[86] <= 0;
H_ram_temp[87] <= 0;
H_ram_temp[88] <= 0;
H_ram_temp[89] <= 0;
H_ram_temp[90] <= 0;
H_ram_temp[91] <= 0;
H_ram_temp[92] <= 0;
H_ram_temp[93] <= 0;
H_ram_temp[94] <= 0;
H_ram_temp[95] <= 0;
H_ram_temp[96] <= 0;
H_ram_temp[97] <= 0;
H_ram_temp[98] <= 0;
H_ram_temp[99] <= 0;
H_ram_temp[100] <= 0;
H_ram_temp[101] <= 0;
H_ram_temp[102] <= 0;
H_ram_temp[103] <= 0;
H_ram_temp[104] <= 0;
H_ram_temp[105] <= 0;
H_ram_temp[106] <= 0;
H_ram_temp[107] <= 0;
H_ram_temp[108] <= 0;
H_ram_temp[109] <= 0;
H_ram_temp[110] <= 0;
H_ram_temp[111] <= 0;
H_ram_temp[112] <= 0;
H_ram_temp[113] <= 0;
H_ram_temp[114] <= 0;
H_ram_temp[115] <= 0;
H_ram_temp[116] <= 0;
H_ram_temp[117] <= 0;
H_ram_temp[118] <= 0;
H_ram_temp[119] <= 0;
H_ram_temp[120] <= 0;
H_ram_temp[121] <= 0;
H_ram_temp[122] <= 0;
H_ram_temp[123] <= 0;
H_ram_temp[124] <= 0;
H_ram_temp[125] <= 0;
H_ram_temp[126] <= 0;
H_ram_temp[127] <= 0;
H_ram_temp[128] <= 0;
H_ram_temp[129] <= 0;
H_ram_temp[130] <= 0;
H_ram_temp[131] <= 0;
H_ram_temp[132] <= 0;
H_ram_temp[133] <= 0;
H_ram_temp[134] <= 0;
H_ram_temp[135] <= 0;
H_ram_temp[136] <= 0;
H_ram_temp[137] <= 0;
H_ram_temp[138] <= 0;
H_ram_temp[139] <= 0;
H_ram_temp[140] <= 0;
H_ram_temp[141] <= 0;
H_ram_temp[142] <= 0;
H_ram_temp[143] <= 0;
H_ram_temp[144] <= 0;
H_ram_temp[145] <= 0;
H_ram_temp[146] <= 0;
H_ram_temp[147] <= 0;
H_ram_temp[148] <= 0;
H_ram_temp[149] <= 0;
H_ram_temp[150] <= 0;
H_ram_temp[151] <= 0;
H_ram_temp[152] <= 0;
H_ram_temp[153] <= 0;
H_ram_temp[154] <= 0;
H_ram_temp[155] <= 0;
H_ram_temp[156] <= 0;
H_ram_temp[157] <= 0;
H_ram_temp[158] <= 0;
H_ram_temp[159] <= 0;
H_ram_temp[160] <= 0;
H_ram_temp[161] <= 0;
H_ram_temp[162] <= 0;
H_ram_temp[163] <= 0;
H_ram_temp[164] <= 0;
H_ram_temp[165] <= 0;
H_ram_temp[166] <= 0;
H_ram_temp[167] <= 0;
H_ram_temp[168] <= 0;
H_ram_temp[169] <= 0;
H_ram_temp[170] <= 0;
H_ram_temp[171] <= 0;
H_ram_temp[172] <= 0;
H_ram_temp[173] <= 0;
H_ram_temp[174] <= 0;
H_ram_temp[175] <= 0;
H_ram_temp[176] <= 0;
H_ram_temp[177] <= 0;
H_ram_temp[178] <= 0;
H_ram_temp[179] <= 0;
H_ram_temp[180] <= 0;
H_ram_temp[181] <= 0;
H_ram_temp[182] <= 0;
H_ram_temp[183] <= 0;
H_ram_temp[184] <= 0;
H_ram_temp[185] <= 0;
H_ram_temp[186] <= 0;
H_ram_temp[187] <= 0;
H_ram_temp[188] <= 0;
H_ram_temp[189] <= 0;
H_ram_temp[190] <= 0;
H_ram_temp[191] <= 0;
H_ram_temp[192] <= 0;
H_ram_temp[193] <= 0;
H_ram_temp[194] <= 0;
H_ram_temp[195] <= 0;
H_ram_temp[196] <= 0;
H_ram_temp[197] <= 0;
H_ram_temp[198] <= 0;
H_ram_temp[199] <= 0;
H_ram_temp[200] <= 0;
H_ram_temp[201] <= 0;
H_ram_temp[202] <= 0;
H_ram_temp[203] <= 0;
H_ram_temp[204] <= 0;
H_ram_temp[205] <= 0;
H_ram_temp[206] <= 0;
H_ram_temp[207] <= 0;
H_ram_temp[208] <= 0;
H_ram_temp[209] <= 0;
H_ram_temp[210] <= 0;
H_ram_temp[211] <= 0;
H_ram_temp[212] <= 0;
H_ram_temp[213] <= 0;
H_ram_temp[214] <= 0;
H_ram_temp[215] <= 0;
H_ram_temp[216] <= 0;
H_ram_temp[217] <= 0;
H_ram_temp[218] <= 0;
H_ram_temp[219] <= 0;
H_ram_temp[220] <= 0;
H_ram_temp[221] <= 0;
H_ram_temp[222] <= 0;
H_ram_temp[223] <= 0;
H_ram_temp[224] <= 0;
H_ram_temp[225] <= 0;
H_ram_temp[226] <= 0;
H_ram_temp[227] <= 0;
H_ram_temp[228] <= 0;
H_ram_temp[229] <= 0;
H_ram_temp[230] <= 0;
H_ram_temp[231] <= 0;
H_ram_temp[232] <= 0;
H_ram_temp[233] <= 0;
H_ram_temp[234] <= 0;
H_ram_temp[235] <= 0;
H_ram_temp[236] <= 0;
H_ram_temp[237] <= 0;
H_ram_temp[238] <= 0;
H_ram_temp[239] <= 0;
H_ram_temp[240] <= 0;
H_ram_temp[241] <= 0;
H_ram_temp[242] <= 0;
H_ram_temp[243] <= 0;
H_ram_temp[244] <= 0;
H_ram_temp[245] <= 0;
H_ram_temp[246] <= 0;
H_ram_temp[247] <= 0;
H_ram_temp[248] <= 0;
H_ram_temp[249] <= 0;
H_ram_temp[250] <= 0;
H_ram_temp[251] <= 0;
H_ram_temp[252] <= 0;
H_ram_temp[253] <= 0;
H_ram_temp[254] <= 0;
H_ram_temp[255] <= 0;
H_ram_temp[256] <= 0;
H_ram_temp[257] <= 0;
H_ram_temp[258] <= 0;
H_ram_temp[259] <= 0;
H_ram_temp[260] <= 0;
H_ram_temp[261] <= 0;
H_ram_temp[262] <= 0;
H_ram_temp[263] <= 0;
H_ram_temp[264] <= 0;
H_ram_temp[265] <= 0;
H_ram_temp[266] <= 0;
H_ram_temp[267] <= 0;
H_ram_temp[268] <= 0;
H_ram_temp[269] <= 0;
H_ram_temp[270] <= 0;
H_ram_temp[271] <= 0;
H_ram_temp[272] <= 0;
H_ram_temp[273] <= 0;
H_ram_temp[274] <= 0;
H_ram_temp[275] <= 0;
H_ram_temp[276] <= 0;
H_ram_temp[277] <= 0;
H_ram_temp[278] <= 0;
H_ram_temp[279] <= 0;
H_ram_temp[280] <= 0;
H_ram_temp[281] <= 0;
H_ram_temp[282] <= 0;
H_ram_temp[283] <= 0;
H_ram_temp[284] <= 0;
H_ram_temp[285] <= 0;
H_ram_temp[286] <= 0;
H_ram_temp[287] <= 0;
H_ram_temp[288] <= 0;
H_ram_temp[289] <= 0;
H_ram_temp[290] <= 0;
H_ram_temp[291] <= 0;
H_ram_temp[292] <= 0;
H_ram_temp[293] <= 0;
H_ram_temp[294] <= 0;
H_ram_temp[295] <= 0;
H_ram_temp[296] <= 0;
H_ram_temp[297] <= 0;
H_ram_temp[298] <= 0;
H_ram_temp[299] <= 0;
H_ram_temp[300] <= 0;
H_ram_temp[301] <= 0;
H_ram_temp[302] <= 0;
H_ram_temp[303] <= 0;
H_ram_temp[304] <= 0;
H_ram_temp[305] <= 0;
H_ram_temp[306] <= 0;
H_ram_temp[307] <= 0;
H_ram_temp[308] <= 0;
H_ram_temp[309] <= 0;
H_ram_temp[310] <= 0;
H_ram_temp[311] <= 0;
H_ram_temp[312] <= 0;
H_ram_temp[313] <= 0;
H_ram_temp[314] <= 0;
H_ram_temp[315] <= 0;
H_ram_temp[316] <= 0;
H_ram_temp[317] <= 0;
H_ram_temp[318] <= 0;
H_ram_temp[319] <= 0;

V_ram_temp[0] <= 0;
V_ram_temp[1] <= 0;
V_ram_temp[2] <= 0;
V_ram_temp[3] <= 0;
V_ram_temp[4] <= 0;
V_ram_temp[5] <= 0;
V_ram_temp[6] <= 0;
V_ram_temp[7] <= 0;
V_ram_temp[8] <= 0;
V_ram_temp[9] <= 0;
V_ram_temp[10] <= 0;
V_ram_temp[11] <= 0;
V_ram_temp[12] <= 0;
V_ram_temp[13] <= 0;
V_ram_temp[14] <= 0;
V_ram_temp[15] <= 0;
V_ram_temp[16] <= 0;
V_ram_temp[17] <= 0;
V_ram_temp[18] <= 0;
V_ram_temp[19] <= 0;
V_ram_temp[20] <= 0;
V_ram_temp[21] <= 0;
V_ram_temp[22] <= 0;
V_ram_temp[23] <= 0;
V_ram_temp[24] <= 0;
V_ram_temp[25] <= 0;
V_ram_temp[26] <= 0;
V_ram_temp[27] <= 0;
V_ram_temp[28] <= 0;
V_ram_temp[29] <= 0;
V_ram_temp[30] <= 0;
V_ram_temp[31] <= 0;
V_ram_temp[32] <= 0;
V_ram_temp[33] <= 0;
V_ram_temp[34] <= 0;
V_ram_temp[35] <= 0;
V_ram_temp[36] <= 0;
V_ram_temp[37] <= 0;
V_ram_temp[38] <= 0;
V_ram_temp[39] <= 0;
V_ram_temp[40] <= 0;
V_ram_temp[41] <= 0;
V_ram_temp[42] <= 0;
V_ram_temp[43] <= 0;
V_ram_temp[44] <= 0;
V_ram_temp[45] <= 0;
V_ram_temp[46] <= 0;
V_ram_temp[47] <= 0;
V_ram_temp[48] <= 0;
V_ram_temp[49] <= 0;
V_ram_temp[50] <= 0;
V_ram_temp[51] <= 0;
V_ram_temp[52] <= 0;
V_ram_temp[53] <= 0;
V_ram_temp[54] <= 0;
V_ram_temp[55] <= 0;
V_ram_temp[56] <= 0;
V_ram_temp[57] <= 0;
V_ram_temp[58] <= 0;
V_ram_temp[59] <= 0;
V_ram_temp[60] <= 0;
V_ram_temp[61] <= 0;
V_ram_temp[62] <= 0;
V_ram_temp[63] <= 0;
V_ram_temp[64] <= 0;
V_ram_temp[65] <= 0;
V_ram_temp[66] <= 0;
V_ram_temp[67] <= 0;
V_ram_temp[68] <= 0;
V_ram_temp[69] <= 0;
V_ram_temp[70] <= 0;
V_ram_temp[71] <= 0;
V_ram_temp[72] <= 0;
V_ram_temp[73] <= 0;
V_ram_temp[74] <= 0;
V_ram_temp[75] <= 0;
V_ram_temp[76] <= 0;
V_ram_temp[77] <= 0;
V_ram_temp[78] <= 0;
V_ram_temp[79] <= 0;
V_ram_temp[80] <= 0;
V_ram_temp[81] <= 0;
V_ram_temp[82] <= 0;
V_ram_temp[83] <= 0;
V_ram_temp[84] <= 0;
V_ram_temp[85] <= 0;
V_ram_temp[86] <= 0;
V_ram_temp[87] <= 0;
V_ram_temp[88] <= 0;
V_ram_temp[89] <= 0;
V_ram_temp[90] <= 0;
V_ram_temp[91] <= 0;
V_ram_temp[92] <= 0;
V_ram_temp[93] <= 0;
V_ram_temp[94] <= 0;
V_ram_temp[95] <= 0;
V_ram_temp[96] <= 0;
V_ram_temp[97] <= 0;
V_ram_temp[98] <= 0;
V_ram_temp[99] <= 0;
V_ram_temp[100] <= 0;
V_ram_temp[101] <= 0;
V_ram_temp[102] <= 0;
V_ram_temp[103] <= 0;
V_ram_temp[104] <= 0;
V_ram_temp[105] <= 0;
V_ram_temp[106] <= 0;
V_ram_temp[107] <= 0;
V_ram_temp[108] <= 0;
V_ram_temp[109] <= 0;
V_ram_temp[110] <= 0;
V_ram_temp[111] <= 0;
V_ram_temp[112] <= 0;
V_ram_temp[113] <= 0;
V_ram_temp[114] <= 0;
V_ram_temp[115] <= 0;
V_ram_temp[116] <= 0;
V_ram_temp[117] <= 0;
V_ram_temp[118] <= 0;
V_ram_temp[119] <= 0;
V_ram_temp[120] <= 0;
V_ram_temp[121] <= 0;
V_ram_temp[122] <= 0;
V_ram_temp[123] <= 0;
V_ram_temp[124] <= 0;
V_ram_temp[125] <= 0;
V_ram_temp[126] <= 0;
V_ram_temp[127] <= 0;
V_ram_temp[128] <= 0;
V_ram_temp[129] <= 0;
V_ram_temp[130] <= 0;
V_ram_temp[131] <= 0;
V_ram_temp[132] <= 0;
V_ram_temp[133] <= 0;
V_ram_temp[134] <= 0;
V_ram_temp[135] <= 0;
V_ram_temp[136] <= 0;
V_ram_temp[137] <= 0;
V_ram_temp[138] <= 0;
V_ram_temp[139] <= 0;
V_ram_temp[140] <= 0;
V_ram_temp[141] <= 0;
V_ram_temp[142] <= 0;
V_ram_temp[143] <= 0;
V_ram_temp[144] <= 0;
V_ram_temp[145] <= 0;
V_ram_temp[146] <= 0;
V_ram_temp[147] <= 0;
V_ram_temp[148] <= 0;
V_ram_temp[149] <= 0;
V_ram_temp[150] <= 0;
V_ram_temp[151] <= 0;
V_ram_temp[152] <= 0;
V_ram_temp[153] <= 0;
V_ram_temp[154] <= 0;
V_ram_temp[155] <= 0;
V_ram_temp[156] <= 0;
V_ram_temp[157] <= 0;
V_ram_temp[158] <= 0;
V_ram_temp[159] <= 0;
V_ram_temp[160] <= 0;
V_ram_temp[161] <= 0;
V_ram_temp[162] <= 0;
V_ram_temp[163] <= 0;
V_ram_temp[164] <= 0;
V_ram_temp[165] <= 0;
V_ram_temp[166] <= 0;
V_ram_temp[167] <= 0;
V_ram_temp[168] <= 0;
V_ram_temp[169] <= 0;
V_ram_temp[170] <= 0;
V_ram_temp[171] <= 0;
V_ram_temp[172] <= 0;
V_ram_temp[173] <= 0;
V_ram_temp[174] <= 0;
V_ram_temp[175] <= 0;
V_ram_temp[176] <= 0;
V_ram_temp[177] <= 0;
V_ram_temp[178] <= 0;
V_ram_temp[179] <= 0;
V_ram_temp[180] <= 0;
V_ram_temp[181] <= 0;
V_ram_temp[182] <= 0;
V_ram_temp[183] <= 0;
V_ram_temp[184] <= 0;
V_ram_temp[185] <= 0;
V_ram_temp[186] <= 0;
V_ram_temp[187] <= 0;
V_ram_temp[188] <= 0;
V_ram_temp[189] <= 0;
V_ram_temp[190] <= 0;
V_ram_temp[191] <= 0;
V_ram_temp[192] <= 0;
V_ram_temp[193] <= 0;
V_ram_temp[194] <= 0;
V_ram_temp[195] <= 0;
V_ram_temp[196] <= 0;
V_ram_temp[197] <= 0;
V_ram_temp[198] <= 0;
V_ram_temp[199] <= 0;
V_ram_temp[200] <= 0;
V_ram_temp[201] <= 0;
V_ram_temp[202] <= 0;
V_ram_temp[203] <= 0;
V_ram_temp[204] <= 0;
V_ram_temp[205] <= 0;
V_ram_temp[206] <= 0;
V_ram_temp[207] <= 0;
V_ram_temp[208] <= 0;
V_ram_temp[209] <= 0;
V_ram_temp[210] <= 0;
V_ram_temp[211] <= 0;
V_ram_temp[212] <= 0;
V_ram_temp[213] <= 0;
V_ram_temp[214] <= 0;
V_ram_temp[215] <= 0;
V_ram_temp[216] <= 0;
V_ram_temp[217] <= 0;
V_ram_temp[218] <= 0;
V_ram_temp[219] <= 0;
V_ram_temp[220] <= 0;
V_ram_temp[221] <= 0;
V_ram_temp[222] <= 0;
V_ram_temp[223] <= 0;
V_ram_temp[224] <= 0;
V_ram_temp[225] <= 0;
V_ram_temp[226] <= 0;
V_ram_temp[227] <= 0;
V_ram_temp[228] <= 0;
V_ram_temp[229] <= 0;
V_ram_temp[230] <= 0;
V_ram_temp[231] <= 0;
V_ram_temp[232] <= 0;
V_ram_temp[233] <= 0;
V_ram_temp[234] <= 0;
V_ram_temp[235] <= 0;
V_ram_temp[236] <= 0;
V_ram_temp[237] <= 0;
V_ram_temp[238] <= 0;
V_ram_temp[239] <= 0;
end
else begin  
         if( binary_i==1&&en==1)begin
        V_ram_temp[VtcVCnt] <= V_ram_temp[VtcVCnt]+1;
        H_ram_temp[VtcHCnt] <= H_ram_temp[VtcHCnt]+1;
        end
    end
end

always@(posedge pclk) begin
if(VtcHCnt==318 && VtcVCnt == 238)begin
V_ram[0] <= V_ram_temp[0];
V_ram[1] <= V_ram_temp[1];
V_ram[2] <= V_ram_temp[2];
V_ram[3] <= V_ram_temp[3];
V_ram[4] <= V_ram_temp[4];
V_ram[5] <= V_ram_temp[5];
V_ram[6] <= V_ram_temp[6];
V_ram[7] <= V_ram_temp[7];
V_ram[8] <= V_ram_temp[8];
V_ram[9] <= V_ram_temp[9];
V_ram[10] <= V_ram_temp[10];
V_ram[11] <= V_ram_temp[11];
V_ram[12] <= V_ram_temp[12];
V_ram[13] <= V_ram_temp[13];
V_ram[14] <= V_ram_temp[14];
V_ram[15] <= V_ram_temp[15];
V_ram[16] <= V_ram_temp[16];
V_ram[17] <= V_ram_temp[17];
V_ram[18] <= V_ram_temp[18];
V_ram[19] <= V_ram_temp[19];
V_ram[20] <= V_ram_temp[20];
V_ram[21] <= V_ram_temp[21];
V_ram[22] <= V_ram_temp[22];
V_ram[23] <= V_ram_temp[23];
V_ram[24] <= V_ram_temp[24];
V_ram[25] <= V_ram_temp[25];
V_ram[26] <= V_ram_temp[26];
V_ram[27] <= V_ram_temp[27];
V_ram[28] <= V_ram_temp[28];
V_ram[29] <= V_ram_temp[29];
V_ram[30] <= V_ram_temp[30];
V_ram[31] <= V_ram_temp[31];
V_ram[32] <= V_ram_temp[32];
V_ram[33] <= V_ram_temp[33];
V_ram[34] <= V_ram_temp[34];
V_ram[35] <= V_ram_temp[35];
V_ram[36] <= V_ram_temp[36];
V_ram[37] <= V_ram_temp[37];
V_ram[38] <= V_ram_temp[38];
V_ram[39] <= V_ram_temp[39];
V_ram[40] <= V_ram_temp[40];
V_ram[41] <= V_ram_temp[41];
V_ram[42] <= V_ram_temp[42];
V_ram[43] <= V_ram_temp[43];
V_ram[44] <= V_ram_temp[44];
V_ram[45] <= V_ram_temp[45];
V_ram[46] <= V_ram_temp[46];
V_ram[47] <= V_ram_temp[47];
V_ram[48] <= V_ram_temp[48];
V_ram[49] <= V_ram_temp[49];
V_ram[50] <= V_ram_temp[50];
V_ram[51] <= V_ram_temp[51];
V_ram[52] <= V_ram_temp[52];
V_ram[53] <= V_ram_temp[53];
V_ram[54] <= V_ram_temp[54];
V_ram[55] <= V_ram_temp[55];
V_ram[56] <= V_ram_temp[56];
V_ram[57] <= V_ram_temp[57];
V_ram[58] <= V_ram_temp[58];
V_ram[59] <= V_ram_temp[59];
V_ram[60] <= V_ram_temp[60];
V_ram[61] <= V_ram_temp[61];
V_ram[62] <= V_ram_temp[62];
V_ram[63] <= V_ram_temp[63];
V_ram[64] <= V_ram_temp[64];
V_ram[65] <= V_ram_temp[65];
V_ram[66] <= V_ram_temp[66];
V_ram[67] <= V_ram_temp[67];
V_ram[68] <= V_ram_temp[68];
V_ram[69] <= V_ram_temp[69];
V_ram[70] <= V_ram_temp[70];
V_ram[71] <= V_ram_temp[71];
V_ram[72] <= V_ram_temp[72];
V_ram[73] <= V_ram_temp[73];
V_ram[74] <= V_ram_temp[74];
V_ram[75] <= V_ram_temp[75];
V_ram[76] <= V_ram_temp[76];
V_ram[77] <= V_ram_temp[77];
V_ram[78] <= V_ram_temp[78];
V_ram[79] <= V_ram_temp[79];
V_ram[80] <= V_ram_temp[80];
V_ram[81] <= V_ram_temp[81];
V_ram[82] <= V_ram_temp[82];
V_ram[83] <= V_ram_temp[83];
V_ram[84] <= V_ram_temp[84];
V_ram[85] <= V_ram_temp[85];
V_ram[86] <= V_ram_temp[86];
V_ram[87] <= V_ram_temp[87];
V_ram[88] <= V_ram_temp[88];
V_ram[89] <= V_ram_temp[89];
V_ram[90] <= V_ram_temp[90];
V_ram[91] <= V_ram_temp[91];
V_ram[92] <= V_ram_temp[92];
V_ram[93] <= V_ram_temp[93];
V_ram[94] <= V_ram_temp[94];
V_ram[95] <= V_ram_temp[95];
V_ram[96] <= V_ram_temp[96];
V_ram[97] <= V_ram_temp[97];
V_ram[98] <= V_ram_temp[98];
V_ram[99] <= V_ram_temp[99];
V_ram[100] <= V_ram_temp[100];
V_ram[101] <= V_ram_temp[101];
V_ram[102] <= V_ram_temp[102];
V_ram[103] <= V_ram_temp[103];
V_ram[104] <= V_ram_temp[104];
V_ram[105] <= V_ram_temp[105];
V_ram[106] <= V_ram_temp[106];
V_ram[107] <= V_ram_temp[107];
V_ram[108] <= V_ram_temp[108];
V_ram[109] <= V_ram_temp[109];
V_ram[110] <= V_ram_temp[110];
V_ram[111] <= V_ram_temp[111];
V_ram[112] <= V_ram_temp[112];
V_ram[113] <= V_ram_temp[113];
V_ram[114] <= V_ram_temp[114];
V_ram[115] <= V_ram_temp[115];
V_ram[116] <= V_ram_temp[116];
V_ram[117] <= V_ram_temp[117];
V_ram[118] <= V_ram_temp[118];
V_ram[119] <= V_ram_temp[119];
V_ram[120] <= V_ram_temp[120];
V_ram[121] <= V_ram_temp[121];
V_ram[122] <= V_ram_temp[122];
V_ram[123] <= V_ram_temp[123];
V_ram[124] <= V_ram_temp[124];
V_ram[125] <= V_ram_temp[125];
V_ram[126] <= V_ram_temp[126];
V_ram[127] <= V_ram_temp[127];
V_ram[128] <= V_ram_temp[128];
V_ram[129] <= V_ram_temp[129];
V_ram[130] <= V_ram_temp[130];
V_ram[131] <= V_ram_temp[131];
V_ram[132] <= V_ram_temp[132];
V_ram[133] <= V_ram_temp[133];
V_ram[134] <= V_ram_temp[134];
V_ram[135] <= V_ram_temp[135];
V_ram[136] <= V_ram_temp[136];
V_ram[137] <= V_ram_temp[137];
V_ram[138] <= V_ram_temp[138];
V_ram[139] <= V_ram_temp[139];
V_ram[140] <= V_ram_temp[140];
V_ram[141] <= V_ram_temp[141];
V_ram[142] <= V_ram_temp[142];
V_ram[143] <= V_ram_temp[143];
V_ram[144] <= V_ram_temp[144];
V_ram[145] <= V_ram_temp[145];
V_ram[146] <= V_ram_temp[146];
V_ram[147] <= V_ram_temp[147];
V_ram[148] <= V_ram_temp[148];
V_ram[149] <= V_ram_temp[149];
V_ram[150] <= V_ram_temp[150];
V_ram[151] <= V_ram_temp[151];
V_ram[152] <= V_ram_temp[152];
V_ram[153] <= V_ram_temp[153];
V_ram[154] <= V_ram_temp[154];
V_ram[155] <= V_ram_temp[155];
V_ram[156] <= V_ram_temp[156];
V_ram[157] <= V_ram_temp[157];
V_ram[158] <= V_ram_temp[158];
V_ram[159] <= V_ram_temp[159];
V_ram[160] <= V_ram_temp[160];
V_ram[161] <= V_ram_temp[161];
V_ram[162] <= V_ram_temp[162];
V_ram[163] <= V_ram_temp[163];
V_ram[164] <= V_ram_temp[164];
V_ram[165] <= V_ram_temp[165];
V_ram[166] <= V_ram_temp[166];
V_ram[167] <= V_ram_temp[167];
V_ram[168] <= V_ram_temp[168];
V_ram[169] <= V_ram_temp[169];
V_ram[170] <= V_ram_temp[170];
V_ram[171] <= V_ram_temp[171];
V_ram[172] <= V_ram_temp[172];
V_ram[173] <= V_ram_temp[173];
V_ram[174] <= V_ram_temp[174];
V_ram[175] <= V_ram_temp[175];
V_ram[176] <= V_ram_temp[176];
V_ram[177] <= V_ram_temp[177];
V_ram[178] <= V_ram_temp[178];
V_ram[179] <= V_ram_temp[179];
V_ram[180] <= V_ram_temp[180];
V_ram[181] <= V_ram_temp[181];
V_ram[182] <= V_ram_temp[182];
V_ram[183] <= V_ram_temp[183];
V_ram[184] <= V_ram_temp[184];
V_ram[185] <= V_ram_temp[185];
V_ram[186] <= V_ram_temp[186];
V_ram[187] <= V_ram_temp[187];
V_ram[188] <= V_ram_temp[188];
V_ram[189] <= V_ram_temp[189];
V_ram[190] <= V_ram_temp[190];
V_ram[191] <= V_ram_temp[191];
V_ram[192] <= V_ram_temp[192];
V_ram[193] <= V_ram_temp[193];
V_ram[194] <= V_ram_temp[194];
V_ram[195] <= V_ram_temp[195];
V_ram[196] <= V_ram_temp[196];
V_ram[197] <= V_ram_temp[197];
V_ram[198] <= V_ram_temp[198];
V_ram[199] <= V_ram_temp[199];
V_ram[200] <= V_ram_temp[200];
V_ram[201] <= V_ram_temp[201];
V_ram[202] <= V_ram_temp[202];
V_ram[203] <= V_ram_temp[203];
V_ram[204] <= V_ram_temp[204];
V_ram[205] <= V_ram_temp[205];
V_ram[206] <= V_ram_temp[206];
V_ram[207] <= V_ram_temp[207];
V_ram[208] <= V_ram_temp[208];
V_ram[209] <= V_ram_temp[209];
V_ram[210] <= V_ram_temp[210];
V_ram[211] <= V_ram_temp[211];
V_ram[212] <= V_ram_temp[212];
V_ram[213] <= V_ram_temp[213];
V_ram[214] <= V_ram_temp[214];
V_ram[215] <= V_ram_temp[215];
V_ram[216] <= V_ram_temp[216];
V_ram[217] <= V_ram_temp[217];
V_ram[218] <= V_ram_temp[218];
V_ram[219] <= V_ram_temp[219];
V_ram[220] <= V_ram_temp[220];
V_ram[221] <= V_ram_temp[221];
V_ram[222] <= V_ram_temp[222];
V_ram[223] <= V_ram_temp[223];
V_ram[224] <= V_ram_temp[224];
V_ram[225] <= V_ram_temp[225];
V_ram[226] <= V_ram_temp[226];
V_ram[227] <= V_ram_temp[227];
V_ram[228] <= V_ram_temp[228];
V_ram[229] <= V_ram_temp[229];
V_ram[230] <= V_ram_temp[230];
V_ram[231] <= V_ram_temp[231];
V_ram[232] <= V_ram_temp[232];
V_ram[233] <= V_ram_temp[233];
V_ram[234] <= V_ram_temp[234];
V_ram[235] <= V_ram_temp[235];
V_ram[236] <= V_ram_temp[236];
V_ram[237] <= V_ram_temp[237];
V_ram[238] <= V_ram_temp[238];
V_ram[239] <= V_ram_temp[239];

H_ram[0] <= H_ram_temp[0];
H_ram[1] <= H_ram_temp[1];
H_ram[2] <= H_ram_temp[2];
H_ram[3] <= H_ram_temp[3];
H_ram[4] <= H_ram_temp[4];
H_ram[5] <= H_ram_temp[5];
H_ram[6] <= H_ram_temp[6];
H_ram[7] <= H_ram_temp[7];
H_ram[8] <= H_ram_temp[8];
H_ram[9] <= H_ram_temp[9];
H_ram[10] <= H_ram_temp[10];
H_ram[11] <= H_ram_temp[11];
H_ram[12] <= H_ram_temp[12];
H_ram[13] <= H_ram_temp[13];
H_ram[14] <= H_ram_temp[14];
H_ram[15] <= H_ram_temp[15];
H_ram[16] <= H_ram_temp[16];
H_ram[17] <= H_ram_temp[17];
H_ram[18] <= H_ram_temp[18];
H_ram[19] <= H_ram_temp[19];
H_ram[20] <= H_ram_temp[20];
H_ram[21] <= H_ram_temp[21];
H_ram[22] <= H_ram_temp[22];
H_ram[23] <= H_ram_temp[23];
H_ram[24] <= H_ram_temp[24];
H_ram[25] <= H_ram_temp[25];
H_ram[26] <= H_ram_temp[26];
H_ram[27] <= H_ram_temp[27];
H_ram[28] <= H_ram_temp[28];
H_ram[29] <= H_ram_temp[29];
H_ram[30] <= H_ram_temp[30];
H_ram[31] <= H_ram_temp[31];
H_ram[32] <= H_ram_temp[32];
H_ram[33] <= H_ram_temp[33];
H_ram[34] <= H_ram_temp[34];
H_ram[35] <= H_ram_temp[35];
H_ram[36] <= H_ram_temp[36];
H_ram[37] <= H_ram_temp[37];
H_ram[38] <= H_ram_temp[38];
H_ram[39] <= H_ram_temp[39];
H_ram[40] <= H_ram_temp[40];
H_ram[41] <= H_ram_temp[41];
H_ram[42] <= H_ram_temp[42];
H_ram[43] <= H_ram_temp[43];
H_ram[44] <= H_ram_temp[44];
H_ram[45] <= H_ram_temp[45];
H_ram[46] <= H_ram_temp[46];
H_ram[47] <= H_ram_temp[47];
H_ram[48] <= H_ram_temp[48];
H_ram[49] <= H_ram_temp[49];
H_ram[50] <= H_ram_temp[50];
H_ram[51] <= H_ram_temp[51];
H_ram[52] <= H_ram_temp[52];
H_ram[53] <= H_ram_temp[53];
H_ram[54] <= H_ram_temp[54];
H_ram[55] <= H_ram_temp[55];
H_ram[56] <= H_ram_temp[56];
H_ram[57] <= H_ram_temp[57];
H_ram[58] <= H_ram_temp[58];
H_ram[59] <= H_ram_temp[59];
H_ram[60] <= H_ram_temp[60];
H_ram[61] <= H_ram_temp[61];
H_ram[62] <= H_ram_temp[62];
H_ram[63] <= H_ram_temp[63];
H_ram[64] <= H_ram_temp[64];
H_ram[65] <= H_ram_temp[65];
H_ram[66] <= H_ram_temp[66];
H_ram[67] <= H_ram_temp[67];
H_ram[68] <= H_ram_temp[68];
H_ram[69] <= H_ram_temp[69];
H_ram[70] <= H_ram_temp[70];
H_ram[71] <= H_ram_temp[71];
H_ram[72] <= H_ram_temp[72];
H_ram[73] <= H_ram_temp[73];
H_ram[74] <= H_ram_temp[74];
H_ram[75] <= H_ram_temp[75];
H_ram[76] <= H_ram_temp[76];
H_ram[77] <= H_ram_temp[77];
H_ram[78] <= H_ram_temp[78];
H_ram[79] <= H_ram_temp[79];
H_ram[80] <= H_ram_temp[80];
H_ram[81] <= H_ram_temp[81];
H_ram[82] <= H_ram_temp[82];
H_ram[83] <= H_ram_temp[83];
H_ram[84] <= H_ram_temp[84];
H_ram[85] <= H_ram_temp[85];
H_ram[86] <= H_ram_temp[86];
H_ram[87] <= H_ram_temp[87];
H_ram[88] <= H_ram_temp[88];
H_ram[89] <= H_ram_temp[89];
H_ram[90] <= H_ram_temp[90];
H_ram[91] <= H_ram_temp[91];
H_ram[92] <= H_ram_temp[92];
H_ram[93] <= H_ram_temp[93];
H_ram[94] <= H_ram_temp[94];
H_ram[95] <= H_ram_temp[95];
H_ram[96] <= H_ram_temp[96];
H_ram[97] <= H_ram_temp[97];
H_ram[98] <= H_ram_temp[98];
H_ram[99] <= H_ram_temp[99];
H_ram[100] <= H_ram_temp[100];
H_ram[101] <= H_ram_temp[101];
H_ram[102] <= H_ram_temp[102];
H_ram[103] <= H_ram_temp[103];
H_ram[104] <= H_ram_temp[104];
H_ram[105] <= H_ram_temp[105];
H_ram[106] <= H_ram_temp[106];
H_ram[107] <= H_ram_temp[107];
H_ram[108] <= H_ram_temp[108];
H_ram[109] <= H_ram_temp[109];
H_ram[110] <= H_ram_temp[110];
H_ram[111] <= H_ram_temp[111];
H_ram[112] <= H_ram_temp[112];
H_ram[113] <= H_ram_temp[113];
H_ram[114] <= H_ram_temp[114];
H_ram[115] <= H_ram_temp[115];
H_ram[116] <= H_ram_temp[116];
H_ram[117] <= H_ram_temp[117];
H_ram[118] <= H_ram_temp[118];
H_ram[119] <= H_ram_temp[119];
H_ram[120] <= H_ram_temp[120];
H_ram[121] <= H_ram_temp[121];
H_ram[122] <= H_ram_temp[122];
H_ram[123] <= H_ram_temp[123];
H_ram[124] <= H_ram_temp[124];
H_ram[125] <= H_ram_temp[125];
H_ram[126] <= H_ram_temp[126];
H_ram[127] <= H_ram_temp[127];
H_ram[128] <= H_ram_temp[128];
H_ram[129] <= H_ram_temp[129];
H_ram[130] <= H_ram_temp[130];
H_ram[131] <= H_ram_temp[131];
H_ram[132] <= H_ram_temp[132];
H_ram[133] <= H_ram_temp[133];
H_ram[134] <= H_ram_temp[134];
H_ram[135] <= H_ram_temp[135];
H_ram[136] <= H_ram_temp[136];
H_ram[137] <= H_ram_temp[137];
H_ram[138] <= H_ram_temp[138];
H_ram[139] <= H_ram_temp[139];
H_ram[140] <= H_ram_temp[140];
H_ram[141] <= H_ram_temp[141];
H_ram[142] <= H_ram_temp[142];
H_ram[143] <= H_ram_temp[143];
H_ram[144] <= H_ram_temp[144];
H_ram[145] <= H_ram_temp[145];
H_ram[146] <= H_ram_temp[146];
H_ram[147] <= H_ram_temp[147];
H_ram[148] <= H_ram_temp[148];
H_ram[149] <= H_ram_temp[149];
H_ram[150] <= H_ram_temp[150];
H_ram[151] <= H_ram_temp[151];
H_ram[152] <= H_ram_temp[152];
H_ram[153] <= H_ram_temp[153];
H_ram[154] <= H_ram_temp[154];
H_ram[155] <= H_ram_temp[155];
H_ram[156] <= H_ram_temp[156];
H_ram[157] <= H_ram_temp[157];
H_ram[158] <= H_ram_temp[158];
H_ram[159] <= H_ram_temp[159];
H_ram[160] <= H_ram_temp[160];
H_ram[161] <= H_ram_temp[161];
H_ram[162] <= H_ram_temp[162];
H_ram[163] <= H_ram_temp[163];
H_ram[164] <= H_ram_temp[164];
H_ram[165] <= H_ram_temp[165];
H_ram[166] <= H_ram_temp[166];
H_ram[167] <= H_ram_temp[167];
H_ram[168] <= H_ram_temp[168];
H_ram[169] <= H_ram_temp[169];
H_ram[170] <= H_ram_temp[170];
H_ram[171] <= H_ram_temp[171];
H_ram[172] <= H_ram_temp[172];
H_ram[173] <= H_ram_temp[173];
H_ram[174] <= H_ram_temp[174];
H_ram[175] <= H_ram_temp[175];
H_ram[176] <= H_ram_temp[176];
H_ram[177] <= H_ram_temp[177];
H_ram[178] <= H_ram_temp[178];
H_ram[179] <= H_ram_temp[179];
H_ram[180] <= H_ram_temp[180];
H_ram[181] <= H_ram_temp[181];
H_ram[182] <= H_ram_temp[182];
H_ram[183] <= H_ram_temp[183];
H_ram[184] <= H_ram_temp[184];
H_ram[185] <= H_ram_temp[185];
H_ram[186] <= H_ram_temp[186];
H_ram[187] <= H_ram_temp[187];
H_ram[188] <= H_ram_temp[188];
H_ram[189] <= H_ram_temp[189];
H_ram[190] <= H_ram_temp[190];
H_ram[191] <= H_ram_temp[191];
H_ram[192] <= H_ram_temp[192];
H_ram[193] <= H_ram_temp[193];
H_ram[194] <= H_ram_temp[194];
H_ram[195] <= H_ram_temp[195];
H_ram[196] <= H_ram_temp[196];
H_ram[197] <= H_ram_temp[197];
H_ram[198] <= H_ram_temp[198];
H_ram[199] <= H_ram_temp[199];
H_ram[200] <= H_ram_temp[200];
H_ram[201] <= H_ram_temp[201];
H_ram[202] <= H_ram_temp[202];
H_ram[203] <= H_ram_temp[203];
H_ram[204] <= H_ram_temp[204];
H_ram[205] <= H_ram_temp[205];
H_ram[206] <= H_ram_temp[206];
H_ram[207] <= H_ram_temp[207];
H_ram[208] <= H_ram_temp[208];
H_ram[209] <= H_ram_temp[209];
H_ram[210] <= H_ram_temp[210];
H_ram[211] <= H_ram_temp[211];
H_ram[212] <= H_ram_temp[212];
H_ram[213] <= H_ram_temp[213];
H_ram[214] <= H_ram_temp[214];
H_ram[215] <= H_ram_temp[215];
H_ram[216] <= H_ram_temp[216];
H_ram[217] <= H_ram_temp[217];
H_ram[218] <= H_ram_temp[218];
H_ram[219] <= H_ram_temp[219];
H_ram[220] <= H_ram_temp[220];
H_ram[221] <= H_ram_temp[221];
H_ram[222] <= H_ram_temp[222];
H_ram[223] <= H_ram_temp[223];
H_ram[224] <= H_ram_temp[224];
H_ram[225] <= H_ram_temp[225];
H_ram[226] <= H_ram_temp[226];
H_ram[227] <= H_ram_temp[227];
H_ram[228] <= H_ram_temp[228];
H_ram[229] <= H_ram_temp[229];
H_ram[230] <= H_ram_temp[230];
H_ram[231] <= H_ram_temp[231];
H_ram[232] <= H_ram_temp[232];
H_ram[233] <= H_ram_temp[233];
H_ram[234] <= H_ram_temp[234];
H_ram[235] <= H_ram_temp[235];
H_ram[236] <= H_ram_temp[236];
H_ram[237] <= H_ram_temp[237];
H_ram[238] <= H_ram_temp[238];
H_ram[239] <= H_ram_temp[239];
H_ram[240] <= H_ram_temp[240];
H_ram[241] <= H_ram_temp[241];
H_ram[242] <= H_ram_temp[242];
H_ram[243] <= H_ram_temp[243];
H_ram[244] <= H_ram_temp[244];
H_ram[245] <= H_ram_temp[245];
H_ram[246] <= H_ram_temp[246];
H_ram[247] <= H_ram_temp[247];
H_ram[248] <= H_ram_temp[248];
H_ram[249] <= H_ram_temp[249];
H_ram[250] <= H_ram_temp[250];
H_ram[251] <= H_ram_temp[251];
H_ram[252] <= H_ram_temp[252];
H_ram[253] <= H_ram_temp[253];
H_ram[254] <= H_ram_temp[254];
H_ram[255] <= H_ram_temp[255];
H_ram[256] <= H_ram_temp[256];
H_ram[257] <= H_ram_temp[257];
H_ram[258] <= H_ram_temp[258];
H_ram[259] <= H_ram_temp[259];
H_ram[260] <= H_ram_temp[260];
H_ram[261] <= H_ram_temp[261];
H_ram[262] <= H_ram_temp[262];
H_ram[263] <= H_ram_temp[263];
H_ram[264] <= H_ram_temp[264];
H_ram[265] <= H_ram_temp[265];
H_ram[266] <= H_ram_temp[266];
H_ram[267] <= H_ram_temp[267];
H_ram[268] <= H_ram_temp[268];
H_ram[269] <= H_ram_temp[269];
H_ram[270] <= H_ram_temp[270];
H_ram[271] <= H_ram_temp[271];
H_ram[272] <= H_ram_temp[272];
H_ram[273] <= H_ram_temp[273];
H_ram[274] <= H_ram_temp[274];
H_ram[275] <= H_ram_temp[275];
H_ram[276] <= H_ram_temp[276];
H_ram[277] <= H_ram_temp[277];
H_ram[278] <= H_ram_temp[278];
H_ram[279] <= H_ram_temp[279];
H_ram[280] <= H_ram_temp[280];
H_ram[281] <= H_ram_temp[281];
H_ram[282] <= H_ram_temp[282];
H_ram[283] <= H_ram_temp[283];
H_ram[284] <= H_ram_temp[284];
H_ram[285] <= H_ram_temp[285];
H_ram[286] <= H_ram_temp[286];
H_ram[287] <= H_ram_temp[287];
H_ram[288] <= H_ram_temp[288];
H_ram[289] <= H_ram_temp[289];
H_ram[290] <= H_ram_temp[290];
H_ram[291] <= H_ram_temp[291];
H_ram[292] <= H_ram_temp[292];
H_ram[293] <= H_ram_temp[293];
H_ram[294] <= H_ram_temp[294];
H_ram[295] <= H_ram_temp[295];
H_ram[296] <= H_ram_temp[296];
H_ram[297] <= H_ram_temp[297];
H_ram[298] <= H_ram_temp[298];
H_ram[299] <= H_ram_temp[299];
H_ram[300] <= H_ram_temp[300];
H_ram[301] <= H_ram_temp[301];
H_ram[302] <= H_ram_temp[302];
H_ram[303] <= H_ram_temp[303];
H_ram[304] <= H_ram_temp[304];
H_ram[305] <= H_ram_temp[305];
H_ram[306] <= H_ram_temp[306];
H_ram[307] <= H_ram_temp[307];
H_ram[308] <= H_ram_temp[308];
H_ram[309] <= H_ram_temp[309];
H_ram[310] <= H_ram_temp[310];
H_ram[311] <= H_ram_temp[311];
H_ram[312] <= H_ram_temp[312];
H_ram[313] <= H_ram_temp[313];
H_ram[314] <= H_ram_temp[314];
H_ram[315] <= H_ram_temp[315];
H_ram[316] <= H_ram_temp[316];
H_ram[317] <= H_ram_temp[317];
H_ram[318] <= H_ram_temp[318];
H_ram[319] <= H_ram_temp[319];


edge_up <= edge_up_temp;
edge_down <= edge_down_temp;
edge_left <= edge_left_temp;
edge_right <= edge_right_temp;

end
end

//find the edge
always@(posedge pclk)begin
    if(en==1) begin
        if(V_ram[VtcVCnt-1] <3 &&V_ram[VtcVCnt] <3&& V_ram[VtcVCnt+1]>5  )begin
            edge_up_temp <= VtcVCnt;
        end 
    end
end
//find the edge
always@(posedge pclk)begin
    if(en==1) begin
        if(V_ram[VtcVCnt+1] <3&&V_ram[VtcVCnt] <3  && V_ram[VtcVCnt-1]>5  )begin
            edge_down_temp <= VtcVCnt;
        end

    end
end

//find the edge
always@(posedge pclk)begin
    if(en==1) begin
        if(H_ram[VtcHCnt-1] <3 &&H_ram[VtcHCnt] <3 &&  H_ram[VtcHCnt+1]>5  )begin
            edge_left_temp <= VtcHCnt;
        end        
    end
end

//find the edge
always@(posedge pclk)begin
    if(en==1) begin 
        if( H_ram[VtcHCnt+1] <3 && H_ram[VtcHCnt] <3 && H_ram[VtcHCnt-1]>5  )begin
            edge_right_temp <= VtcHCnt;
        end
    end
end


always@(posedge pclk) begin

    
     if ((160-96==VtcHCnt||160+96==VtcHCnt) && VtcVCnt>=120-32&&VtcVCnt<=120+32 //show a yellow rectangle
       ||(120-32==VtcVCnt||120+32==VtcVCnt) && VtcHCnt>=160-96&&VtcHCnt<=160+96  )begin
                   binary_render <=1;
       end
    else if(edge_left==VtcHCnt || edge_right==VtcHCnt || edge_up==VtcVCnt || edge_down==VtcVCnt)//label 2 cross line. The intersection point is the ball's center.
        binary_render <=1;
    else
        binary_render <= binary_i;

end

always@(posedge pclk) begin

    
     if ((160-96==VtcHCnt||160+96==VtcHCnt) && VtcVCnt>=120-32&&VtcVCnt<=120+32 //show a yellow rectangle
       ||(120-32==VtcVCnt||120+32==VtcVCnt) && VtcHCnt>=160-96&&VtcHCnt<=160+96  )begin
                   rgb_render <=24'b11111111_11111111_00000000;
       end
    else if(edge_left==VtcHCnt || edge_right==VtcHCnt || edge_up==VtcVCnt || edge_down==VtcVCnt)//label 2 cross line. The intersection point is the ball's center.
        rgb_render <=24'b11111111_00000000_00000000;
    else
        rgb_render <= rgb_i;

end
//assign debug = 16'd115;
wire[10:0]rom_addr_9,rom_pix_9;
reg [11:0]match_num_9,match_9;
assign rom_pix_9=(VtcHCnt-edge_left)/4;
assign rom_addr_9=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_9[rom_pix_9] == binary_i)
        match_num_9 <= match_num_9 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_9 <= match_num_9;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_9 <= 0;
end

wire[10:0]rom_addr_8,rom_pix_8;
reg [11:0]match_num_8,match_8;
assign rom_pix_8=(VtcHCnt-edge_left)/4;
assign rom_addr_8=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_8[rom_pix_8] == binary_i)
        match_num_8 <= match_num_8 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_8 <= match_num_8;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_8 <= 0;
end

wire[10:0]rom_addr_7,rom_pix_7;
reg [11:0]match_num_7,match_7;
assign rom_pix_7=(VtcHCnt-edge_left)/4;
assign rom_addr_7=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_7[rom_pix_7] == binary_i)
        match_num_7 <= match_num_7 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_7 <= match_num_7;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_7 <= 0;
end

wire[10:0]rom_addr_6,rom_pix_6;
reg [11:0]match_num_6,match_6;
assign rom_pix_6=(VtcHCnt-edge_left)/4;
assign rom_addr_6=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_6[rom_pix_6] == binary_i)
        match_num_6 <= match_num_6 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_6 <= match_num_6;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_6 <= 0;
end

wire[10:0]rom_addr_5,rom_pix_5;
reg [11:0]match_num_5,match_5;
assign rom_pix_5=(VtcHCnt-edge_left)/4;
assign rom_addr_5=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_5[rom_pix_5] == binary_i)
        match_num_5 <= match_num_5 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_5 <= match_num_5;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_5 <= 0;
end

wire[10:0]rom_addr_4,rom_pix_4;
reg [11:0]match_num_4,match_4;
assign rom_pix_4=(VtcHCnt-edge_left)/4;
assign rom_addr_4=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_4[rom_pix_4] == binary_i)
        match_num_4 <= match_num_4 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_4 <= match_num_4;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_4 <= 0;
end

wire[10:0]rom_addr_3,rom_pix_3;
reg [11:0]match_num_3,match_3;
assign rom_pix_3=(VtcHCnt-edge_left)/4;
assign rom_addr_3=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_3[rom_pix_3] == binary_i)
        match_num_3 <= match_num_3 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_3 <= match_num_3;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_3 <= 0;
end

wire[10:0]rom_addr_2,rom_pix_2;
reg [11:0]match_num_2,match_2;
assign rom_pix_2=(VtcHCnt-edge_left)/4;
assign rom_addr_2=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_2[rom_pix_2] == binary_i)
        match_num_2 <= match_num_2 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_2 <= match_num_2;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_2 <= 0;
end

wire[10:0]rom_addr_1,rom_pix_1;
reg [11:0]match_num_1,match_1;
assign rom_pix_1=(VtcHCnt-edge_left)/4;
assign rom_addr_1=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
//    if(en)begin
   if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
        if(M_1[rom_pix_1] == binary_i)
        match_num_1 <= match_num_1 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_1 <= match_num_1;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_1 <= 0;
end

wire[10:0]rom_addr_0,rom_pix_0;
reg [11:0]match_num_0,match_0;
assign rom_pix_0=(VtcHCnt-edge_left)/4;
assign rom_addr_0=(VtcVCnt-edge_up)/4;
always@(posedge pclk)begin
 if(VtcHCnt>=edge_left && VtcHCnt <edge_left+64 && en==1 )begin
         if(M_0[rom_pix_0] == binary_i)
        match_num_0 <= match_num_0 +1;
    end
    else if(VtcHCnt==318 && VtcVCnt == 238)
        match_0 <= match_num_0;
    else if(VtcHCnt==1 && VtcVCnt == 1)
        match_num_0 <= 0;
end

reg[11:0]max;
reg[2:0]cnt;
always@(posedge pclk)begin
if(VtcHCnt==318 && VtcVCnt == 238)
cnt<=0;
else begin
        if(cnt>=3)cnt<=3;
        else
        cnt <= cnt+1;
end

end

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
//get the index
always@(posedge pclk)begin
if(max[11:7] >5'b10110)begin
    if(max[11:7]==match_0[11:7])
        index <= 4'b0000;
    if(max[11:7]==match_1[11:7])
        index <= 4'b0001;
    if(max[11:7]==match_2[11:7])
        index <= 4'b0010;
    if(max[11:7]==match_3[11:7])
        index <= 4'b0011;
    if(max[11:7]==match_4[11:7])
        index <= 4'b0100;
    if(max[11:7]==match_5[11:7])
        index <= 4'b0101;
    if(max[11:7]==match_6[11:7])
        index <= 4'b0110;
    if(max[11:7]==match_7[11:7])
        index <= 4'b0111;
    if(max[11:7]==match_8[11:7])
        index <= 4'b1000;
    if(max[11:7]==match_9[11:7])
        index <= 4'b1001;
    end
else
   index <= 4'b0000;
end

endmodule
