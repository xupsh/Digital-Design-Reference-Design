`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: display

//////////////////////////////////////////////////////////////////////////////////

module display(
    input wire clk,reset,
    input wire [3:0]bcd_one,bcd_ten,bcd_hun,
    output wire [6:0]seg,
    output reg [3:0]ans
    );
    reg [19:0]count;
    reg [3:0]digit; 
    always@(posedge clk,posedge reset)
    if(reset)  
        count = 0;
    else 
        count = count + 1;
       
    always @(posedge clk)
    case(count[19:18])
        1:begin
            ans = 4'b1110;
            digit = bcd_one[3:0];
        end
             
        2:begin
            ans = 4'b1101;
            digit = bcd_ten[3:0];
        end
        
        3:begin
            ans = 4'b1011;
            digit = bcd_hun[3:0];
        end 
        
        default: begin
            ans = 8'b1111_1110;
            digit = bcd_one[3:0];
        end
    endcase
    
    seg7 U4(.din(digit),.dout(seg));
endmodule
