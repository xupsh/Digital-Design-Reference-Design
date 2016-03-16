Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
Gray Code is one of the most important codes. It is a non-weighted code which belongs to a class of codes called minimum change codes. In this codes while traversing from one step to another step only one bit in the code group changes. In case of Gray Code two adjacent code numbers differs from each other by only one bit. 

.the project is to convert the binary data to gray data.
.the sw[3:0] is the binary input, the led[3:0] is the gray code output.
.using sw[4] as GND.because the highest bit of binary input should be xor with zero.

How to run the demo:
setp1:copy B3_gray_code_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_gray_code_download.bit;
step3:You can change switches, and leds display will show the corresponding gray codes.

How to build the demo:
step1:Open Vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Gray_Code_converter_Design.tcl, you should use this command: cd f:/Src/Tcl;The tcl named "Gray_Code_converter_Design.tcl" is used to build the project, another tcl named "gray_code.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Gray_Code_converter_Design.tcl, you can just use command: source ./Gray_Code_converter_Design.tcl;
step4:Wait for a minute ,then the project is built.