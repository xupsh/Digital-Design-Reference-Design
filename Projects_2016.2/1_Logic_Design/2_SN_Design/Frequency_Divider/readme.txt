Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
A clock signal is needed in order for sequential circuits to function. Usually the clock signal comes from a crystal oscillator on-board. The oscillator used on Digilent FPGA boards usually ranges from 50 MHz to 100 MHz. However, some peripheral controllers do not need such a high frequency to operate.

.using the clk_div to product a tick to flip the value of the DFF.
.the LD[1:0] is the result of the frequency divider, the LD[0] blinks in a second.and the LD[1] blinks in half second.
.the sw[0] is the preset input of DFF, so when it is set low level, the LD[1:0] will be lighted.
.the sw[1] is the preset input of DFF, so when it is set low level and the preset input is set high level, the LD[1:0] will go out.
.to make the system work properly, the sw[1:0] should set high both.

How to run the demo:
setp1:copy B3_seg7decimal_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_freq_divider_download.bit;
step3:the LED[1] and LED[0] will blink to show the frequency.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Frequency_Divider_Design.tcl, you should use this command: cd f:/Src/Tcl;The tcl named "Frequency_Divider_Design.tcl" is used to build the project, another tcl named "freq_divider.tcl" is used to describe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Frequency_Divider_Design.tcl, you can just use command: source ./Frequency_Divider_Design.tcl;
step4:Wait for a minute ,then the project is built.