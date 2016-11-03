`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2015 03:29:55 PM
// Design Name: 
// Module Name: uart_tb
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


module uart_tb(

    );
    
    reg clk,reset;
    reg rx,tx_btn;
    reg [7:0]data_in;
    wire [7:0]data_out;
    wire rx_done,tx_done;
    wire tx;
    
    uart_top #(.DVSR(651),.DATA_WIDTH(8),.SB_TICK(16)) DUT (
        .clk(clk),.reset(reset),
        .rx(rx),.tx_btn(tx_btn),
        .data_in(data_in),
        .data_out(data_out),
        .rx_done(rx_done),.tx_done(tx_done),
        .tx(tx)
        );
        
    reg [7:0]data;
    initial begin
        clk = 0;reset = 1;tx_btn = 0;
        #2 reset = 0;
        data_in = 8'hf5;
        #1000 tx_btn = 1;  
        #20 tx_btn = 0;  
        
        #(651*16*2*10) data_in = 8'h5e;
        #100 tx_btn = 1;  
        #20 tx_btn = 0;
    end
    
    always #1 clk = ~clk;
    
    integer i;
    initial begin
        data = 8'h72;rx = 1;
        senddata(data,rx);
        rx = 1;
        #(651*16*6) data = 8'h55;
        senddata(data,rx);   
        rx = 1;     
    end
    
    task senddata;
        input [7:0]din;
        output dout;
        begin
            rx =0;
            #(651*16*2);
            for(i = 0; i<8;i = i + 1)begin
                rx = data[0];
                #(651*16*2);
                data = data>>1;
            end
            rx = 1;
            #(651*16*2);
            $display("transmition finish!!");
        end
    endtask
        
endmodule
