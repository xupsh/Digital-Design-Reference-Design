Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
.using xadc to sample one channel signal
.show waveform and its frequence and Vpp value on VGA displayer

this demo use 1 button:
BTNC --to change the sample clock's frequence

How to run the demo:
step1:connect VGA with Basys3;
setp2:copy B3_OSC_download.bit to USB flash disk, connect USB disk to Basys3, and connect Function signal generator's probe with Basys3 XADC pmod(only one port:JXADC1),
and connect Function signal generator's GND with Basys3's GND;
step3:power on Basys3, download bitstream file;
step4:The waveform, and its frequence and Vpp value are displaying on VGA. If the sampling clock's frequence is not suitable, you can change the clock by pressing BTNC.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the "Oscilloscope.tcl" tclfile path.For example, if tcl file is in F:\Src\Tcl,
 you should use this command: cd f:/Src/Tcl;
step3:Then use source command to run tcl.You can just use command: source ./Oscilloscope.tcl;
step4:Wait for a minute ,then the project is built.