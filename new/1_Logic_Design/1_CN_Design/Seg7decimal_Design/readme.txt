Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
 This is a basic 4-digit 7-segment display

.using 16-bit switches as 16-bit value input, and show the value on 7-segment display
.the value displayed on 7-segment is composed of 4 number:sw[15:12],sw[11:8],sw[7:4],sw[3:0]

How to run the demo:
setp1:copy B3_seg7decimal_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_seg7decimal_download.bit;
step3:You can change switches, and 7-segment display will show the value.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Seg7decimal_Design.tcl, you should use this command: cd f:/Src/Tcl; The tcl named "Seg7decimal_Design.tcl" is used to build the project, another tcl named "Seg7decimal.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Seg7decimal_Design.tcl, you can just use command: source ./Seg7decimal_Design.tcl;
step4:Wait for a minute ,then the project is built.