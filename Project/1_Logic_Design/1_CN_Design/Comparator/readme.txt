Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
A magnitude comparator is a device that receives two N-bit inputs and asserts one of three possible outputs depending on whether one input is greater than, less than, or equal to the other.

.the project is built by an IP called 74LS85. this IP is a 4-bit comparator with cascade input.
.compare 2 group of 4-bit input:data A,sw[3:0] and data B,sw[7:4], and sw[10:8] is cascade input signals.sw[8] represents the equal cascade input,sw[9] represents the greater cascade input,sw[10] represents the less cascade input.
.using 3-bits led to show the result of comparation : LD[2:0]. when the LD[0] is lighted, the data A is equal to B; when the LD[1] is lighted, the data A is greater than B; when the LD[2] is lighted, the data A is less than B;

How to run the demo:
setp1:copy B3_Comparator_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_Comparator_download.bit;
step3:You can compare 2 group of 4-bit input signals by  sw[3:0] and sw[7:4], and you can use sw[8],sw[9],sw[10] as cascade signals

Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Comparator_Design.tcl, you should use this command: cd f:/Src/Tcl;The tcl named "Comparator_Design.tcl" is used to build the project, another tcl named "Comparator.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Comparator_Design.tcl, you can just use command: source ./Comparator_Design.tcl;
step4:Wait for a minute ,then the project is built.