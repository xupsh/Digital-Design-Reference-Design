`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/20 16:33:01
// Design Name: 
// Module Name: trafficLights
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


module trafficLights_controller(
    input tclk,rst,
    output reg [2:0]tf0,tf1, //tf0_2 :red ; tf0_1 :green ; tf0_0 :yellow  
    output reg [7:0]count
    );
    
    reg [31:0]count_1s;
    reg clk_1s;
    reg [1:0]state,state_next;
    reg [1:0]
        S0 = 2'b00,
        S1 = 2'b01,
        S2 = 2'b10,
        S3 = 2'b11;
    reg [7:0]count_next;
    
    always@(posedge tclk,posedge rst)
    begin
        if(rst)begin
            count_1s <= 0;
            clk_1s <= 0;
        end
        else if(count_1s < 9999_9999) begin
            count_1s <= count_1s +1;
            clk_1s <= 0;
        end
        else begin
            count_1s <= 0;
            clk_1s <= 1;
        end
    end
    
    always@(posedge clk_1s,posedge rst) begin
        if(rst)begin
            state <= S0;
            count <= 45;
        end
        else begin
            state <= state_next;
            count <= count_next;
        end    
    end
    
    always@(*) begin     
        state_next <= state;
        count_next <= count;
        
        case(state)
            S0 : begin
                tf0 <= 3'b010;tf1 <= 3'b100;
                if(count < 1)begin
                    state_next <= S1;
                    count_next <= 5;
                end
                else
                    count_next <= count - 1;
            end
            
            S1 : begin
                tf0 <= 3'b001;tf1 <= 3'b100;
//                    if(clk_1s) begin
                    if(count < 1)begin
                        state_next <= S2;
                        count_next <= 25;
                    end
                    else
                        count_next <= count - 1;
//                    end
            end
            
            S2 : begin
                tf0 <= 3'b100;tf1 <= 3'b010;
//                    if(clk_1s) begin
                    if(count < 1)begin
                        state_next <= S3;
                        count_next <= 5;
                    end
                    else
                        count_next <= count - 1;
//                    end
            end
            
            S3 : begin
                tf0 <= 3'b100;tf1 <= 3'b001;
//                    if(clk_1s) begin
                    if(count < 1)begin
                        state_next <= S0;
                        count_next <= 45;
                    end
                    else
                        count_next <= count - 1;
//                    end
            end
        endcase
    end
    
endmodule
