`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: counter

//////////////////////////////////////////////////////////////////////////////////

module counter #(parameter count_max = 60)(
    input wire clk,reset,
//    input wire up,down,en,
    input wire cin,
    output reg [7:0] count,
    output reg cout
    );
    
    always@(posedge clk,posedge reset)
        if(reset)
            count <= 0;
        else begin
            cout <= 0;
            if(cin)begin
                if(count < count_max - 1)
                    count <= count + 1;
                else begin
                    count <= 0;    
                    cout <= 1;
                end
            end
        end
   
endmodule
