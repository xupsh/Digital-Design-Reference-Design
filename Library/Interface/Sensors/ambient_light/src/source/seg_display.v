`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/15 20:49:39
// Design Name: 
// Module Name: seg_display
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


module seg_display(
input clk,
input[15:0] data_in,
output  [7:0]seg,
output  [3:0]ans
    );
    
reg [13:0] cnt;
always@(posedge clk)begin
    if(cnt>=9999) cnt<=0;
    else cnt<=cnt+1;
end

reg[11:0]  seg_ans_temp;
always@(*)begin
    if(0<=cnt && cnt<=2499)begin
        case (data_in[15:12])
        4'b0000: seg_ans_temp = 12'b011100000011;
        4'b0001: seg_ans_temp = 12'b011110011111;
        4'b0010: seg_ans_temp = 12'b011100100101;
        4'b0011: seg_ans_temp = 12'b011100001101;
        4'b0100: seg_ans_temp = 12'b011110011001;
        4'b0101: seg_ans_temp = 12'b011101001001;                                        
        4'b0110: seg_ans_temp = 12'b011101000001;                
        4'b0111: seg_ans_temp = 12'b011100011111;                
        4'b1000: seg_ans_temp = 12'b011100000001;                
        4'b1001: seg_ans_temp = 12'b011100001001;                
        default: seg_ans_temp = 12'b011100000011;                          
        endcase;
    end    
    else if(2499<cnt  &&  cnt<=4999)begin
        case (data_in[11:8])
        4'b0000: seg_ans_temp = 12'b101100000011;             
        4'b0001: seg_ans_temp = 12'b101110011111;                    
        4'b0010: seg_ans_temp = 12'b101100100101;                   
        4'b0011: seg_ans_temp = 12'b101100001101;              
        4'b0100: seg_ans_temp = 12'b101110011001;               
        4'b0101: seg_ans_temp = 12'b101101001001;                                         
        4'b0110: seg_ans_temp = 12'b101101000001;               
        4'b0111: seg_ans_temp = 12'b101100011111;               
        4'b1000: seg_ans_temp = 12'b101100000001;                
        4'b1001: seg_ans_temp = 12'b101100001001;                
        default: seg_ans_temp = 12'b101100000011;                          
        endcase;    
    end    
    else if(4999<cnt  &&  cnt<=7499)begin 
        case (data_in[7:4])
        4'b0000: seg_ans_temp = 12'b110100000011;
        4'b0001: seg_ans_temp = 12'b110110011111;
        4'b0010: seg_ans_temp = 12'b110100100101;
        4'b0011: seg_ans_temp = 12'b110100001101;               
        4'b0100: seg_ans_temp = 12'b110110011001;                   
        4'b0101: seg_ans_temp = 12'b110101001001;                                  
        4'b0110: seg_ans_temp = 12'b110101000001;                    
        4'b0111: seg_ans_temp = 12'b110100011111;               
        4'b1000: seg_ans_temp = 12'b110100000001;                   
        4'b1001: seg_ans_temp = 12'b110100001001;
        default: seg_ans_temp = 12'b110100000011;                  
        endcase;    
    end    
    else if(7499<cnt  &&  cnt<=9999)begin
        case (data_in[3:0]) 
        4'b0000: seg_ans_temp = 12'b111000000011;                
        4'b0001: seg_ans_temp = 12'b111010011111;                    
        4'b0010: seg_ans_temp = 12'b111000100101;                  
        4'b0011: seg_ans_temp = 12'b111000001101;               
        4'b0100: seg_ans_temp = 12'b111010011001;               
        4'b0101: seg_ans_temp = 12'b111001001001;                                        
        4'b0110: seg_ans_temp = 12'b111001000001;               
        4'b0111: seg_ans_temp = 12'b111000011111;                
        4'b1000: seg_ans_temp = 12'b111000000001;               
        4'b1001: seg_ans_temp = 12'b111000001001;
        default: seg_ans_temp = 12'b111000000011;                  
        endcase;    
    end
end

assign seg = seg_ans_temp[7:0];
assign ans = seg_ans_temp[11:8];
endmodule
