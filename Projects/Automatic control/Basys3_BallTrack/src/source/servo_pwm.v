`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		Digilent China
// Engineer: 		Jerry Peng
// 
// Create Date:    14:23:51 01/21/2014 
// Design Name: 
// Module Name:    servo_pwm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module servo_pwm(
    input clk_1us,				// 1 usec input clock
    input [14:0] pwm_thres,	// 14-bit pwm threshold, for servo-motor 500~2500 is valid
    output reg pwm_out			// pwm signal output
    );
	 
	 
//20ms clk counter///////////////
reg [14:0] count;  // 0~19999

always@(posedge clk_1us) begin

	if(count == 19999)
		count <= 0;
	else
		count <= count + 1;
end

//PWM generate///////////////////
always@(*) begin

	if(count < pwm_thres)  
		pwm_out <=1;
	else
		pwm_out <=0;
end

endmodule
