`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2014 04:18:01 PM
// Design Name: 
// Module Name: xadc_top
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


module xadc_top(
input  DCLK,RESET,
output [15:0] MEASURED_AUX_A,MEASURED_AUX_B,
input  A_VAUXP,A_VAUXN,B_VAUXP,B_VAUXN//A_VAUX is from Basys3's JXADC3,B_VAUX is from  JXADC1
    );

    wire DCLK;
    wire[15:0]MEASURED_AUX_A,MEASURED_AUX_B;

    ug480 u_xadc(
     .DCLK(DCLK),
     .RESET(RESET),
     .VAUXP({A_VAUXP,B_VAUXP,2'b00}),
     .VAUXN({A_VAUXN,B_VAUXN,2'b00}),  // Auxiliary analog channel inputs
     .VP(), 
     .VN(),// Dedicated and Hardwired Analog Input Pair
     
     .MEASURED_TEMP(), 
     .MEASURED_VCCINT(),  
     .MEASURED_VCCAUX(), 
     .MEASURED_VCCBRAM(), 
     .MEASURED_AUX0(MEASURED_AUX_A), 
     .MEASURED_AUX1(), 
     .MEASURED_AUX2(MEASURED_AUX_B), 
     .MEASURED_AUX3(), 
 
     .ALM(), 
     .CHANNEL(),       
     .OT(), 
     .EOC(), 
     .EOS()
    );


endmodule
