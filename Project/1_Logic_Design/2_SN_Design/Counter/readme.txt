Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
,using 74LS90, a decimal counter IP, to count. the range of the counter is 0-9999.
.using 7-segment to display the value of the counter.

How to run the demo:
setp1:copy B3_Counter_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_Counter_download.bit;
step3:7-segment display will show the value.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Counter_Design.tcl, you should use this command: cd f:/Src/Tcl;The tcl named "Counter_Design.tcl" is used to build the project, another tcl named "Counter.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Counter_Design.tcl, you can just use command: source ./Counter_Design.tcl;
step4:Wait for a minute ,then the project is built.