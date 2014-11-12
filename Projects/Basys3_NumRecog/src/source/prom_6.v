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


module prom_6(
input wire[3:0]addr,
input wire[3:0]addr_disp,
output wire[0:15]Char,
output wire[0:15]Char_disp
    );
    
reg[0:15]rom[0:15];
parameter data={
16'b0001111111111000,
16'b0001111111111000,
16'b0001111111111000,
16'b1110000000000000,
16'b1110000000000000,
16'b1110000000000000,
16'b1111111111111000,
16'b1111111111111000,
16'b1111111111111000,
16'b1110000000001111,
16'b1110000000001111,
16'b1110000000001111,
16'b1110000000001111,
16'b0001111111111000,
16'b0001111111111000,
16'b0001111111111000
};

    
integer i;

initial
begin
    for(i=0;i<16;i=i+1)
        rom[i]=data[(255-16*i)-:16];
end

assign Char=rom[addr];
assign Char_disp=rom[addr_disp];


endmodule
