`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/30 12:47:13
// Design Name: 
// Module Name: prom_5
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


module prom_4(
input wire[3:0]addr_R_h,addr_R_d,addr_R_u,
input wire[3:0]addr_G_h,addr_G_d,addr_G_u,
input wire[3:0]addr_B_h,addr_B_d,addr_B_u,

output wire[0:15]Char_R_h,Char_R_d,Char_R_u,
output wire[0:15]Char_G_h,Char_G_d,Char_G_u,
output wire[0:15]Char_B_h,Char_B_d,Char_B_u
    );
    
reg[0:15]rom[0:15];
parameter data={
16'b0000001111111000,
16'b0000001111111000,
16'b0000001111111000,
16'b0001110000111000,
16'b0001110000111000,
16'b0001110000111000,
16'b1110000000111000,
16'b1110000000111000,
16'b1110000000111000,
16'b1111111111111111,
16'b1111111111111111,
16'b1111111111111111,
16'b0000000000111000,
16'b0000000000111000,
16'b0000000000111000,
16'b0000000000111000
};

    
integer i;

initial
begin
    for(i=0;i<16;i=i+1)
        rom[i]=data[(255-16*i)-:16];
end

assign Char_R_h=rom[addr_R_h];
assign Char_R_d=rom[addr_R_d];
assign Char_R_u=rom[addr_R_u];
assign Char_G_h=rom[addr_G_h];
assign Char_G_d=rom[addr_G_d];
assign Char_G_u=rom[addr_G_u];
assign Char_B_h=rom[addr_B_h];
assign Char_B_d=rom[addr_B_d];
assign Char_B_u=rom[addr_B_u];

endmodule
