Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
In electronics, a multiplexer (or mux) is a device that selects one of several analog or digital input signals and forwards the selected input into a single line.[1] A multiplexer of 2n inputs has n select lines, which are used to select which input line to send to the output. Multiplexers are mainly used to increase the amount of data that can be sent over the network within a certain amount of time and bandwidth. A multiplexer is also called a data selector.

.using the 74LS151 IP to implement the function of MUX.
.the sw[7:0] is the data input,and the sw[10:8]is the setting of the MUX's channels.the LD[0]is the data output. the LD[1] is the opposite output.
.the sw[11] should be set low level to make it work correctly.

How to run the demo:
setp1:copy B3_mux_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_mux_download.bit;
step3:You can change switches, and 7-segment display will show the value.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/MUX_Design.tcl, you should use this command: cd f:/Src/Tcl;The tcl named "MUX_Design.tcl" is used to build the project, another tcl named "mux.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/MUX_Design.tcl, you can just use command: source ./MUX_Design.tcl;
step4:Wait for a minute ,then the project is built.