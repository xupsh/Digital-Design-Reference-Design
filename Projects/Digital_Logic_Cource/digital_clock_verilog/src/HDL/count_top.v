`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: count_top

//////////////////////////////////////////////////////////////////////////////////

module count_top(
    input wire clk,reset,
    output wire [6:0]seg,
    output wire [3:0]ans
    );
           
    wire clk_1s;
    clk_1s #(.N(9999_9999)) U1(.clk(clk),.reset(reset),.clk_1s(clk_1s));
    
    wire cout_s;
    wire [9:0]bcd_s;
    bcd_counter U2_s(.clk(clk),.reset(reset),.cin(clk_1s),.bcd(bcd_s),.cout(cout_s));   
    
    wire cout_m;
    wire [9:0]bcd_m;
    bcd_counter U2_m(.clk(clk),.reset(reset),.cin(cout_s),.bcd(bcd_m),.cout(cout_m));
    
    wire [9:0]bcd_h;
    bcd_counter #(.N(24)) U2_h(.clk(clk),.reset(reset),.cin(cout_m),.bcd(bcd_h),.cout()); 
 
    display U3(.clk(clk),.reset(reset),.bcd_s(bcd_s),.bcd_m(bcd_m),.bcd_h(bcd_h),.ans(ans),.seg(seg));
    
endmodule
