Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
A digital clock is a type of clock that displays the time digitally (i.e. in numerals or other symbols), as opposed to an analog clock, where the time is indicated by the positions of rotating hands.

The project designs a digital clock with IPs,such as 74LS90, 74LS 08,clk_dic and seg7decimal. because the B3 has only four 7segments, the second and minute are displayed.
the sw[1] is designed for GND, and the sw[0] is designed for clr signal of 7seg display, so they should be set low level before the system is powered on.

How to run the demo:
setp1:change JP1 to usb mode on board, copy "B3_digital_clock_download.bit" to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, wait for several seconds. Turn the sw[9:1] on and turn sw[0] off. The digital clock runs. The seconds and minutes run correctly.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tclfile path.For example, if tcl file is in F:Digital_Clock\Src\TCL, you should use this command: cd f:/Digital_Clock/Src/TCL; The tcl named "Digital_Clock_Design.tcl" is used to build the project, another tcl named "Digital_Clock.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl. you can just use command: source ./Digital_Clock_Design.tcl;
step4:Wait for a minute ,then the project is built.