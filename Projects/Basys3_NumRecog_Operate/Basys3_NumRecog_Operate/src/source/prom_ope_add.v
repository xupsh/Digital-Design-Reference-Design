`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/31 20:37:43
// Design Name: 
// Module Name: prom_operator
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


module prom_ope_add(
input wire[3:0]addr,addr_disp,
output wire[0:15]Char,Char_disp
    );
    
reg[0:15]rom[0:15];
parameter data={
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b1111111111111111,
16'b1111111111111111,
16'b1111111111111111,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000,
16'b0000001110000000
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
