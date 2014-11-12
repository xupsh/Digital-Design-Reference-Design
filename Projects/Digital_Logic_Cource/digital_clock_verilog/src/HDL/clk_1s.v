`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: clk_1s

//////////////////////////////////////////////////////////////////////////////////

module clk_1s #(parameter N = 99_999999)(
    input wire clk,reset,
    output reg clk_1s
    );
    
    reg [31:0]count;
    
    always@(posedge clk,posedge reset)begin
        if(reset)
            count <= 0;
        else begin 
            clk_1s <= 0;
            if(count < N)
                count <= count + 1;
            else begin
                count <= 0;
                clk_1s <= 1;
            end 
        end     
    end
        
endmodule
