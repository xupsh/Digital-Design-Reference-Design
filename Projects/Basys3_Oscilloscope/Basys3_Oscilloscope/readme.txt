This project's function is:
.generate 4 kind waveforms, and their frequence can be set by buttons(0-4999Hz)
.show waveform and its frequence and Vpp value on VGA displayer.The source of waveform can be internal or external.

this demo use 5 buttons and 3 switchs:
sw[15]--The source of waveform,1 is internal,0 is external;
sw[0]-sw[1]--the kind of waveform,  "00" is triangular wave
                                    "01" is square wave
				    "10" is sawtooth wave
				    "11" is sine wave
BTNC--change the sampling clock;
BTNU,BTND,BTNL,BTNR--set the frequence of internal waveform

How to run the demo:
.internal waveform displaying:
step1:connect VGA with Basys3;
setp2:copy B3_OSC_download.bit to USB flash disk, connect USB disk to Basys3;
step3:power on Basys3, download bitstream file, set sw[15] to 1;
step4:Set the waveform's type by sw[0]&sw[1]. Set the  waveform's frequence by BTNU,BTND,BTNL,BTNR, you can see the frequence on Nixie light. The waveform, and its frequence and Vpp value are displaying on VGA. If the sampling clock is not suitable, you can change the clock by pressing BTNC.

.external waveform displaying:
step1:connect VGA with Basys3;
setp2:copy B3_OSC_download.bit to USB flash disk, connect USB disk to Basys3, and connect Function signal generator's probe with Basys3 XADC pmod(only one port:J1),and connect Function signal generator's GND with Basys3's GND;
step3:power on Basys3, download bitstream file, set sw[15] to 0;
step4:The waveform, and its frequence and Vpp value are displaying on VGA. If the sampling clock is not suitable, you can change the clock by pressing BTNC.

How to build the demo:
step1:Open vivado 2014.2;
step2:in the tcl console, use cd command to into the current tclfile path.For example, if tcl file is in F:/project/X.tcl, you should use this command: cd f:/project;
step3:Then use source command to run tcl.For example,if tcl file is in F:/project/X.tcl, you can just use command: source ./X.tcl;
step4:Wait for a minute ,then the project is built.