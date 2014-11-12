`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/09/19 10:21:52
// Design Name: 
// Module Name: Motor_Ctrl
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

module Motor_Ctrl(
input clk_50M ,
input reset ,
input Move_EN,
input vsync_in,
input[11:0] x,
input[10:0] y,
output reg pwm_x,pwm_y,
input             lost_y,lost_x,
input [10:0]      lost_coordinate_y,lost_coordinate_x,
//XADC input
input  A_VAUXP,A_VAUXN,B_VAUXP,B_VAUXN//A_VAUX is from Basys3's JXADC3,B_VAUX is from  JXADC1
    );

wire  [14:0] pwm_thresh_x,pwm_thresh_y;   
wire  pwm_x_reg,pwm_thresh_y;
reg  clk_1us_reg;
reg  [4:0] cnt;
always@(posedge clk_50M)begin
    if(cnt >= 24)begin
        cnt <= 0;
        clk_1us_reg <= ~ clk_1us_reg;
    end
    else
        cnt <= cnt +1;
end
    
always@(*)begin
    if(Move_EN == 1)begin
        pwm_x <= pwm_x_reg;
        pwm_y <=  pwm_y_reg;
    end
    else begin
        pwm_x <= 0;
        pwm_y <= 0;
    end
end    
    
wire[15:0]MEASURED_AUX_A,MEASURED_AUX_B;

// Component XADC. referenced by ug480
    xadc_top u_xadc(
     .DCLK(clk_50M),
     .RESET(reset),
     .MEASURED_AUX_A(MEASURED_AUX_A),
     .MEASURED_AUX_B(MEASURED_AUX_B),
     .A_VAUXP(A_VAUXP),
     .A_VAUXN(A_VAUXN),
     .B_VAUXP(B_VAUXP),
     .B_VAUXN(B_VAUXN)//A_VAUX is from  JXADC3,B_VAUX is from  JXADC1
    );
    
    
    servo_pwm u_servo_pwm_x(
     .clk_1us(clk_1us_reg),
     .pwm_out(pwm_x_reg ) ,
     .pwm_thres(pwm_thresh_x)
    );
    pwm_gen_x u_pwm_gen_x(
     .vsync_in(vsync_in),
     .MEASURED_AUX_A(MEASURED_AUX_A),
     .x (x),
     .lost_x(lost_x),
     .lost_coordinate_x(lost_coordinate_x),
     .pwm_thres(pwm_thresh_x)
    );           
    servo_pwm u_servo_pwm_y(
     .clk_1us(clk_1us_reg),
     .pwm_out(pwm_y_reg ) ,
     .pwm_thres(pwm_thresh_y)
    );
    pwm_gen_y u_pwm_gen_y(
     .vsync_in(vsync_in),
     .MEASURED_AUX_B(MEASURED_AUX_B),
     .y (y),
     .lost_y(lost_y),
     .lost_coordinate_y(lost_coordinate_y),
     .pwm_thres(pwm_thresh_y)
    ); 

endmodule
