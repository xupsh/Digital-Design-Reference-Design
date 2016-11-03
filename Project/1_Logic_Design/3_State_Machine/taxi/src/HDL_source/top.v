`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2016 02:45:58 PM
// Design Name: 
// Module Name: top
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


module top(
input clk100,
input rst,
input temp_stop,
input completion,
input check_total,
output [11:0] seg,
output [4:0] led,
output led11
    );
    
    wire [12:0] result;
    wire [3:0] thousands;
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;
    
    taxi taxi(
    .clk100(clk100),
    .rst(rst),
    .temp_stop(temp_stop),
    .completion(completion),
    .check_total(check_total),
    .result(result),
    .led(led),
    .led11(led11)   
        );


    bcd bcd(
    .number(result), 
    .thousands(thousands),
    .hundreds(hundreds), 
    .tens(tens), 
    .ones(ones)
    );
    
wire [7:0] seg_temp;
wire [3:0] ans_temp;

    seg_display u_seg_disp(
        .clk(clk100),
        .data_in({thousands,hundreds,tens,ones}),
        .seg(seg_temp),
        .ans(ans_temp)
    );
    assign seg = {ans_temp,seg_temp};    
        
        
    
endmodule
