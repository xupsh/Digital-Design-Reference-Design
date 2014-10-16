`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: bluetooth_top

//////////////////////////////////////////////////////////////////////////////////


module bluetooth_top(
    input wire clk,reset,rx,tx_start,
    input wire [7:0]data_in,
    output wire [7:0]data_out,
    output reg led,
    output wire tx,
    output wire rx_done,tx_done,
    output wire [3:0]an,
    output wire [6:0]seg
    );
    
    reg tx_start;
    reg [7:0]data_in;
    UART_0 UART(
        .clk(clk),
        .reset(reset),
        .rx(rx),
        .tx_btn(tx_start),
        .data_in(data_in),
        .data_out(data_out),
        .rx_done(rx_done),
        .tx_done(tx_done),
        .tx(tx)
        );
        
    reg [7:0]uart_reg;
    reg [7:0]uart_reg_0;
    wire led_flag,seg_flag,max_flag;
    always@(posedge clk)begin
        uart_reg <=( data_out == 8'h0 )? uart_reg : data_out;
        uart_reg_0 <= uart_reg;
    end    
    assign led_flag = (uart_reg ==8'h01)&&(uart_reg_0 == 8'hff);
    assign seg_flag = (uart_reg_0 == 8'hfe) ;
    assign max_flag = (uart_reg_0 == 8'hfd);
    
    reg [7:0]bin;
    reg [7:0]max;
    always@(negedge clk,posedge reset)
    if(reset)begin
        led <= 0;
        bin <=0;
        max <= 0;
    end
    else begin
        if(led_flag)
            led = led + 1;
        if(seg_flag)
            bin = uart_reg;
        if(max_flag)
            max = uart_reg;
    end
    
    wire [9:0]bcd_bin;
    binbcd8 U1 (.bin(bin),.bcd(bcd_bin));
    wire [9:0]bcd_max;
    binbcd8 U2 (.bin(max),.bcd(bcd_max));
    
    wire [3:0]bcd_one,bcd_ten,bcd_hun;
    assign bcd_one = bcd_bin[3:0];
    assign bcd_ten = bcd_bin[7:4];
    assign bcd_hun ={2'b0, bcd_bin[9:8]};
    
    wire [3:0]max_one,max_ten,max_hun;
    assign max_one = bcd_max[3:0];
    assign max_ten = bcd_max[7:4];
    assign max_hun ={2'b0, bcd_max[9:8]};
    
    display U3(.clk(clk),.reset(reset),.bcd_one(bcd_one),.bcd_ten(bcd_ten),.bcd_hun(bcd_hun),.seg(seg),.ans(an)); 
    
//    always@(posedge clk,posedge reset)
//    if(reset)begin
//        count = 0;
//        tx_start = 0;
//    end
//    else begin
//        if(count > 32'd199_999999)begin
//                count <= 0;
//        end
//        else begin
//            count <= count + 1'b1;
//             if(count == 32'd99_999999)begin
//                   tx_start = 1;
//                   data_in = temp[7:0];
//               end
//               else if(count == 32'd199_999999)begin
//                   tx_start = 1;
//                   data_in = temp[7:0];
//               end
//               else begin
//                   tx_start = 0;
//               end
//        end
//    end
    
endmodule
