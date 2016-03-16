`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2015 09:00:07 AM
// Design Name: 
// Module Name: magnitude_comparator_4bits
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


module magnitude_comparator_4bits(
    input A3,B3,A2,B2,A1,B1,A0,B0,
    input Igt,Ilt,Ieq,
    output Ogt,Olt,Oeq
    );
    
    wire [2:0]cascade_in;
    reg [2:0]result; //result[2]:Ogt ; result[1]:Olt ; result[0]:Oeq
    wire [3:0]opa,opb;
    
    assign cascade_in = {Igt,Ilt,Ieq};
    assign opa = {A3,A2,A1,A0}; 
    assign opb = {B3,B2,B1,B0}; 

    always@(*)begin
        if(opa > opb)
            result = 3'b100;
        else if(opa < opb)
            result = 3'b010;
        else begin
            case(cascade_in)
                3'b100:result = 3'b100;
                
                3'b010:result = 3'b010;
                
                3'b001:result = 3'b001;
                
                3'b??1:result = 3'b001;
                
                3'b110:result = 3'b000;
                
                3'b000:result = 3'b110;
            endcase
        end
    end
    
    assign Ogt = result[2];
    assign Olt = result[1];
    assign Oeq = result[0];
    
endmodule
