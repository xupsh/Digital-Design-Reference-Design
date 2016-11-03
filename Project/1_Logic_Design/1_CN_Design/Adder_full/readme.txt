Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
A full adder adds binary numbers and accounts for values carried in as well as out. A one-bit full adder adds three one-bit numbers, often written as A, B, and Cin; A and B are the operands, and Cin is a bit carried in from the previous less significant stage.[2] The full adder is usually a component in a cascade of adders, which add 8, 16, 32, etc. bit binary numbers. The circuit produces a two-bit output, output carry and sum typically represented by the signals Cout and S, where sum = 2 * Cout + S.

4-bit adder, with carry in and carry out
using 9-bit switches: sw[3:0] and sw[7:4] are 2 operands, sw[8] is carry in
using 1 bit led to show the state of carry out: LD[4]
using 4-bit led to show the result: LD[3:0]

How to run the demo:
setp1:copy B3_adder_full_4bits_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, B3_adder_full_4bits_download.bit;
step3:You can using switches sw[3:0] and sw[7:4] as 2 operands, and sw[8] is carry in

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, 
if tcl file is in F:/Src/Tcl/Add_full_Design.tcl, you should use this command: cd f:/Src/Tcl; The tcl named "Add_full_Design.tcl" is used to build the project, another tcl named "adder_full_4bits.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Add_full_Design.tcl, you can just use command: source ./Add_full_Design.tcl;
step4:Wait for a minute ,then the project is built.