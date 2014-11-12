`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: vga_1440x900

//////////////////////////////////////////////////////////////////////////////////


module vga_1440x900(
    input wire vga_pclk,vga_rst,
    output wire vga_hsync,vga_vsync,vga_valid,
    output wire [11:0]vga_h_cnt,
    output wire [10:0]vga_v_cnt
    );
    
    localparam 
        HD = 11'd1440,
        HF = 11'd80,
        HA = 11'd152,
        HB = 11'd232,
        HT = 11'd1904,
        VD = 10'd900,
        VF = 10'd1,
        VA = 10'd3,
        VB = 10'd28,
        VT = 10'd932;
    
    reg [11:0]pixel_cnt;
    reg [10:0]line_cnt;
    reg hsync,vsync,hactive,vactive;
    
    always@(posedge vga_pclk,posedge vga_rst)
        if(vga_rst)
            pixel_cnt <= 0;
        else if(pixel_cnt < (HT - 1))
                pixel_cnt <= pixel_cnt + 1;
             else
                pixel_cnt <= 0;

    always@(posedge vga_pclk,posedge vga_rst)
        if(vga_rst)
            hsync <= 1;
        else if((pixel_cnt >= (HD + HF - 1))&&(pixel_cnt < (HD + HF + HA -1)))
                hsync <= 0;
            else
                hsync <= 1;
    
    always@(posedge vga_pclk,posedge vga_rst)
        if(vga_rst)
            line_cnt <= 0;
        else if(pixel_cnt == (HT -1))
                if(line_cnt < (VT - 1))
                    line_cnt <= line_cnt + 1;
                else
                    line_cnt <= 0;
                    
    always@(posedge vga_pclk,posedge vga_rst)
        if(vga_rst)
            vsync <= 1;
        else if((line_cnt >= (VD + VF - 1))&&(line_cnt < (VD + VF + VA - 1)))
            vsync <= 0;
        else
            vsync <= 1;
                    
    assign vga_hsync = hsync;
    assign vga_vsync = vsync;
    assign vga_valid = ((pixel_cnt < HD) && (line_cnt < VD));
    
    assign vga_h_cnt = (pixel_cnt < HD) ? pixel_cnt:11'd0;
    assign vga_v_cnt = (line_cnt < VD) ? line_cnt:10'd0;
           
endmodule
