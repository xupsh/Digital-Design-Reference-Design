Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
The designed trafficlights system is used for the crossroad. One road is a arterial traffic A, another is a by-pass B.
                       |   |
                  _____| B |_____

		    A
                  _____     _____
                       |   |
                       |   |
The time for cars on the road A is 45s,and the time for cars on the road B is 25s
When there is no cars and pedestrains on the by-pass B, the by-pass B's trafficlight is red,and the arterial trafficlight is green.
When there are cars or pedestrains on the by-pass B, the arterial traffic's light turns to be yellow for 5s.

The arterial traffic lights is set on the LD[2..0], LD[2] stands for red trafficlight; LD[1] stands for green trafficlight; LD[0] stands for yellow trafficlight. and the by-pass traffic lights is set on the LD [15..13]. LD[15] stands for red trafficlight; LD[14] stands for green trafficlight; LD[13] stands for yellow trafficlight;

sw[0] is used as GND, so it should be set low level.

How to run the demo:
setp1:change JP1 to usb mode on board, copy "B3_TrafficLight_download.bit" to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, wait for several seconds. The traffic lights system is on. The countdown is displayed on the 7segment.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tclfile path.For example, if tcl file is in F:\Traffic_Light\Src\Tcl, you should use this command: cd f:/Traffic_Light/Src/Tcl;The tcl named "TrafficLight_Design.tcl" is used to build the project, another tcl named "TrafficLight.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl. you can just use command: source ./TrafficLight_Design.tcl;
step4:Wait for a minute ,then the project is built.