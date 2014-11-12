This project's function is:
.using ov7725 camera to capture picture
.calculate the object's RGB value,and show the value on VGA

this demo use one button:
BTNC --extract object's RGB value.

How to run the demo:
step1:connect the ov7725 camera module with Basys3 JB&JC pmod(constraints is specificly defined in B3_ValueRGB.xdc),and connect VGA;
setp2:copy B3_ValueRGB_download.bit to USB flash disk, connect USB disk to Basys3;
step3:power on Basys3, download bitstream file;
step4:hold on an object, make it close to camera and observe VGA simultaneously. If object covers the yellow rectangle, press the BTNC;
then you can see the object's RGB value displayed on VGA.

How to build the demo:
step1:Open vivado 2014.2;
step2:in the tcl console, use cd command to into the current tclfile path.For example, if tcl file is in F:/project/X.tcl, you should use this command: cd f:/project;
step3:Then use source command to run tcl.For example,if tcl file is in F:/project/X.tcl, you can just use command: source ./X.tcl;
step4:Wait for a minute ,then the project is built.