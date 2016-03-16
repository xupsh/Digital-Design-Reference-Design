`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/19 12:18:42
// Design Name: 
// Module Name: MIPS_CPU_TB
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
module CLOCK (
	output bit clk
	);
	
	always #(10ns) begin
		clk = ~clk;
	end
endmodule

module MIPS_CPU_TB();

	bit clk,reset;
	bit[31:0] alu_outpin,data_outpin,inst_outpin,pc_outpin;

	CLOCK CLOCK1(clk);
	MIPS_CPU_wrapper MIPS_CPU_wrapper1(alu_outpin,clk,data_outpin,inst_outpin,pc_outpin, reset);

	initial begin 
		reset = 1'b0;
		repeat(100) @(posedge clk);
		reset = 1'b1;
		repeat(1000) @(posedge clk);
		reset = 1'b0;
		$finish;
	end

endmodule