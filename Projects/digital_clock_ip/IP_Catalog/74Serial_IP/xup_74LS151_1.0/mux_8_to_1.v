`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Cui Hongyu
// 
// Create Date: 2014/10/11 13:07:56
// Design Name: digital_base_IP
// Module Name: mux_8_to_1
// Project Name: 74LS148
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


module mux_8_to_1(
    input S_n,A2,A1,A0,D7,D6,D5,D4,D3,D2,D1,D0,
    output Q,Q_n
    );
    reg Q_r;
    wire [2:0]A;
    
    assign A = {A2,A1,A0};
    
    always@(*)begin
        if(S_n)
            Q_r <= 1'b0;
        else
            case(A)
                3'b000: Q_r <= D0;
                3'b001: Q_r <= D1;
                3'b010: Q_r <= D2;
                3'b011: Q_r <= D3;
                3'b100: Q_r <= D4;
                3'b101: Q_r <= D5;
                3'b110: Q_r <= D6;
                3'b111: Q_r <= D7;
            endcase
    end
        
    assign Q = Q_r;
    assign Q_n = ~Q;
    
endmodule
