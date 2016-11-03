Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
An encoder essentially performs the reverse of a decoder function in a combinational logic. It receives N inputs (where N is typically power of two, i.e., 4, 8, 16, etc.), and asserts an output binary code of M bits (usually M=log2N). The M-bit binary code indicates which input was asserted. Since more than one input line to the encoder might be asserted at any given time, the priority encoder asserts an output code corresponding to the highest numbered input that is asserted. 

.using the 74LS148 to implement the function of the project.
.sw[7:0] is the inputs, sw[8] is the Enable Input. the led[2:0] is the encoded output, and they are negative logic. and the led[4] and led[3] are the enable signals.

How to run the demo:
setp1:copy B3_Priority_Encoder_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_Priority_Encoder_download.bit;
step3:You can change switches, and the leds show the encoded values.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Priority_Encoder_Design.tcl, you should use this command: cd f:/Src/Tcl; The tcl named "Priority_Encoder_Design.tcl" is used to build the project, another tcl named "Priority_Encoder.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Priority_Encoder_Design.tcl, you can just use command: source ./Priority_Encoder_Design.tcl;
step4:Wait for a minute ,then the project is built.