This project's function is:
.generate 4 kind waveforms, and their frequence can be set by buttons(0-4999Hz)
.to observe the generated waveform, you should have a DA module and an oscilloscope.

this demo use 4 buttons and 2 switchs:
sw[0]-sw[1]--the kind of waveform,  "00" is triangular wave
                                    "01" is square wave
				    "10" is sawtooth wave
				    "11" is sine wave
BTNU,BTND,BTNL,BTNR--set the frequence of internal waveform

How to run the demo:
setp1:copy B3_WaveformGenerator_download.bit to USB flash disk, connect USB disk to Basys3, and connect DA module to Basys3 JB pmod;
step2:power on Basys3, download bitstream file;
step3:Set the waveform's type by sw[0]&sw[1]. Set the  waveform's frequence by BTNU,BTND,BTNL,BTNR.
step4:connect oscilloscope's probe with DA output, you can see the waveform displaying on oscilloscope.

How to build the demo:
step1:Open vivado 2014.2;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/project/X.tcl, you should use this command: cd f:/project;
step3:Then use source command to run tcl.For example,if tcl file is in F:/project/X.tcl, you can just use command: source ./X.tcl;
step4:Wait for a minute ,then the project is built.