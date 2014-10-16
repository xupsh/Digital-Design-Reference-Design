`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/09/16 20:36:12
// Design Name: digital_base_IP
// Module Name: BCD_Decimal
// Project Name: 74LS42
// Target Devices: Basys3
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


module BCD_Decimal(
    input wire A,B,C,D,
    output wire Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9
    );
    
    reg [9:0]y;
    
    always@*
        case({D,C,B,A})
            4'h0: y = 10'b11_1111_1110;
            4'h1: y = 10'b11_1111_1101;
            4'h2: y = 10'b11_1111_1011;
            4'h3: y = 10'b11_1111_0111;
            4'h4: y = 10'b11_1110_1111;
            4'h5: y = 10'b11_1101_1111;
            4'h6: y = 10'b11_1011_1111;
            4'h7: y = 10'b11_0111_1111;
            4'h8: y = 10'b10_1111_1111;
            4'h9: y = 10'b01_1111_1111;
            default: y = 10'b11_1111_1111;            
        endcase
    
    assign Y0 = y[0];
    assign Y1 = y[1];
    assign Y2 = y[2];
    assign Y3 = y[3];
    assign Y4 = y[4];
    assign Y5 = y[5];
    assign Y6 = y[6];
    assign Y7 = y[7];
    assign Y8 = y[8];
    assign Y9 = y[9];
    
endmodule
