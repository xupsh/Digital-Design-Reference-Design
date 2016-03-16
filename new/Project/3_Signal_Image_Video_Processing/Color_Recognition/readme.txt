Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
.using ov7725 camera to capture picture, use color detect module to process the image, and show on VGA

this demo use 2 buttons and a switch:
BTND --system reset
BTNC --extract color
sw[0] --clear color

How to run the demo:
step1:connect the ov7725 camera module with Basys3 JB&JC pmod, connect VGA((constraints is specificly defined in B3_colorRecog.xdc));
setp2:copy B3_colorRecong_download.bit to USB flash disk, connect USB disk to Basys3;
step3:Set sw[0] to ¡®0¡¯.power on Basys3, download bitstream file,Then we can see image is showed on VGA  display;
step4:hold on an monochromatic object(for example,ping-pang ball), make it close to camera and observe VGA simultaneously. If object covers the yellow rectangle, press the BTNC.
This step¡¯s function is to extract the ball¡¯s color;
step5:We can see some green pixels in screen because their RGB color are similar to ball¡¯s color.If we want to re-extract the ball¡¯s RGB color value, 
the SW[0] should be set to ¡®1¡¯ and then set to ¡®0¡¯. At this time the green region on screen disappears. Then repeat step 4 and step 5.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the "Color_Recognition.tcl" tcl file path.For example, if tcl file is in F:\Src\Tcl,
 you should use this command: cd f:/Src/Tcl;
step3:Then use source command to run tcl.You can just use command: source ./Color_Recognition.tcl;
step4:Wait for a minute ,then the project is built.
