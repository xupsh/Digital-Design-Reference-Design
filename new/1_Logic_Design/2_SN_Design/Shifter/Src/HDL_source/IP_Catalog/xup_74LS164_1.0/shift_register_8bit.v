`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/10/10 21:08:45
// Design Name: digital_base_IP
// Module Name: shift_register_8bit
// Project Name: 74LS164
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


module shift_register_8bit(
    input DSA,DSB,CP,MR_n,
    output Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0
    );
    
    reg [7:0]Q_r;
    
    always@(posedge CP,negedge MR_n)begin
        if(!MR_n)
            Q_r <= 8'b0;
        else begin
            Q_r = Q_r << 1;
            Q_r[0] = DSA && DSB;
        end
    end
    
    assign {Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0} = Q_r;
    
endmodule
