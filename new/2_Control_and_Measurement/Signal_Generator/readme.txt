Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
.generate 4 kind waveforms, and their frequence can be set by buttons(0-4999Hz),simultaneously the frequence can be showed on 7-segment display 

this demo use 4 buttons and 2 switches:
sw[1]&sw[0]--set the type of waveform,  "00" is triangular wave
                                        "01" is square wave
				        "10" is sawtooth wave
				    	"11" is sine wave
BTNU,BTND,BTNL,BTNR--set the frequence of waveform

How to run the demo:
step1:connect DA module with Basys3;
setp2:copy B3_signalGen_download.bit to USB flash disk, connect USB disk to Basys3, set B3's boot mode to usb boot;
step3:power on Basys3;
step4:The waveform is generated, you can set the frequence by BTNU,BTND,BTNL,BTNR, and you can set the waveform's type by sw[1]&sw[0]

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the "Signal_Generator.tcl" tclfile path.For example, if tcl file is in F:\Src\Tcl,
 you should use this command: cd f:/Src/Tcl;
step3:Then use source command to run tcl.You can just use command: source ./Signal_Generator.tcl;
step4:Wait for a minute ,then the project is built.