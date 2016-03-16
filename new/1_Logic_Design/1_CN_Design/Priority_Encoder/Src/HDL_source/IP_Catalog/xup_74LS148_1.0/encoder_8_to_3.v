`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx  
// Engineer: Cui Hongyu
// 
// Create Date: 2014/10/11 12:53:18
// Design Name: digital_base_IP
// Module Name: encoder_8_to_3
// Project Name: 74LS148
// Target Devices: Basys3
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


module encoder_8_to_3(
    input I7,I6,I5,I4,I3,I2,I1,I0,
    input EI,
    output Qc,Qb,Qa,   
    output reg GS,EO
    );
    
    wire [7:0]v;
    reg [2:0]y;
    integer i;

    assign v = {I7,I6,I5,I4,I3,I2,I1,I0};
    
    always @(*)
        if(EI)
        begin
            y = 3'b111;
            GS = 1'b1;
            EO = 1'b1;
        end
        else
            if( &v )
            begin
                y = 3'b111;
                GS = 1'b1;
                EO = 1'b0;
            end
            else    
            begin
                GS = 1'b0;
                EO = 1'b1;
                for(i=0;i<8;i=i+1)
                    if(v[i] == 0)
                        y = ~i;
            end
    
    assign Qa = y[0];
    assign Qb = y[1];
    assign Qc = y[2];
    
endmodule

