`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: bcd_counter

//////////////////////////////////////////////////////////////////////////////////

module bcd_counter #(parameter N=60)(
    input wire clk,reset,
    input wire cin,
    output wire [9:0]bcd,
    output wire cout
    );
    
    wire [7:0]count;
    counter #(.count_max(N))U1(.clk(clk),.reset(reset),.cin(cin),.count(count),.cout(cout));
    
    binbcd8 U2(.bin(count),.bcd(bcd));
    
    
endmodule
