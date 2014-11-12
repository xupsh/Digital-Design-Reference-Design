`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/07 19:09:28
// Design Name: 
// Module Name: spi_master
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


module spi_master(
    input [1:0]addr,
    input [7:0]in_data,
    output reg [7:0]out_data,
    input rd,wr,cs,clk,
    inout miso,mosi,sclk
    );
    
    reg sclk_buffer = 0;
    reg mosi_buffer = 0;
    reg busy = 0;
    
    reg [7:0]in_buffer = 0;
    reg [7:0]out_buffer = 0;
    reg [7:0]clkcount = 0;
    reg [7:0]clkdiv = 0;
    reg [4:0]count = 0;
    
    always@(cs,rd,addr,out_buffer,busy,clkdiv)begin
        out_data = 8'bx;
        if(cs & rd)begin
            case(addr)
            2'b00: begin
                out_data = out_buffer;
            end
            
            2'b01: begin
                out_data = {7'b0,busy};
            end
            
            2'b10: begin
                out_data = clkdiv;
            end
            endcase
        end
    end
    
    always@(posedge clk) begin
        if(!busy)begin
            if(cs & wr)begin
                case(addr)
                2'b00: begin
                    in_buffer = in_data;
                end
                    
                2'b01: begin
                    clkdiv = in_data;
                end
                endcase
            end
        end
        else begin
            clkcount = clkcount + 1;
            if(clkcount >= clkdiv)begin
                clkcount = 0;
                if((count%2)==0) begin
                    mosi_buffer = in_buffer[7];
                    in_buffer=in_buffer << 1;
                end
                
                if(count > 0 && count < 17)begin
                    sclk_buffer = ~sclk_buffer;
                end
                
                count = count + 1;
                
                if(count > 17)begin
                    count = 0;
                    busy = 1'b0;
                end
            end
        end
    end
    
    always@(posedge sclk_buffer)begin
        out_buffer = out_buffer << 1;
        out_buffer[0] = miso;
    end
    
    assign sclk = sclk_buffer;
    assign mosi = mosi_buffer;
endmodule
