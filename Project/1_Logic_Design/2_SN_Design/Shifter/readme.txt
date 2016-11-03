Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
A shifter is a circuit that produces an N-bit output based on an N-bit data input and some control bits, where the N output bits are place-shifted copies of the input bits, and the way the bits will be shifted is determined by the control bits.

.using the 74LS164 and clk_div IP to build the shifter. the register will shift left by one bit in a second.
.using 8-bit LEDs(LED[7:0]) to display the 8bits register.
.the sw[0] is the upcoming data. after a second, it will be delivered into the lowest bit of shifter register.For example, when the sw[0] is keeped high level, the LEDs will turn on one by one. at last, all LEDs will be lighted.
.the sw[1] is the Enable input of 74LS164. it should be set high level.

How to run the demo:
setp1:copy B3_shifter_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_shifter_download.bit;
step3:You can change switches, and 7-segment display will show the value.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Shifter_Design.tcl, you should use this command: cd f:/Src/Tcl; The tcl named "Shifter_Design.tcl" is used to build the project, another tcl named "shifter.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Shifter_Design.tcl, you can just use command: source ./Shifter_Design.tcl;
step4:Wait for a minute ,then the project is built.