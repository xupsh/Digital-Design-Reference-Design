Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
.using ov7725 camera to capture picture, and show on VGA
.using servo to trace ping-pang ball

this demo use 2 buttons and 2 switchs:
BTNC --to extract the ball¡¯s RGB color value
BTND --system reset
sw[0]-- clear the stored ball¡¯s RGB color value
sw[1]-- enable/disable servos work(¡®1¡¯: enable, ¡®0¡¯: disable)

How to run the demo(for details, please see files in ZRobot_VM_V1_B3\Doc):
step1:connect the ov7725 camera module with Basys3 JB&JC pmod,connect servos,and connect VGA((constraints is specificly defined in B3_Balltrack.xdc));
setp2:copy B3_BallTrack_download.bit to USB flash disk, connect USB disk to Basys3;
step3:Set sw[1] and sw[0] to ¡®0¡¯.power on Basys3, download bitstream file,Then we can see servo will turn to a fixed direction, and VGA  display terminal will show image at the same time;
step4:hold on an object(ping-pang ball), make it close to camera and observe VGA simultaneously. If object covers the yellow rectangle, press the BTNC.This step¡¯s function is to extract the ball¡¯s color;
step5:Then it comes into tracking mode. We can see some green pixels in screen because their RGB color are similar to ball¡¯s color. And we can see 2 lines, one is vertical and the other is horizontal, the 2 line¡¯s intersection is the center of ¡°ball region¡±. At the same time, we should set SW[1] to ¡®1¡¯,then the servo begin tracking the ball;
step6:If we want to re-extract the ball¡¯s RGB color value, at first the SW[1] need to be set to ¡®0¡¯ to stop the servo moving. Then the SW[0] should be set to ¡®1¡¯ and then set to ¡®0¡¯. At this time the 
green region on screen disappears. Then repeat step 4 and step 5.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the "Basys3_BallTrack.tcl" tclfile path.For example, if tcl file is in F:\B3_BallTrack\Src\Tcl,
 you should use this command: cd f:/B3_BallTrack/Src/Tcl;
step3:Then use source command to run tcl.You can just use command: source ./Basys3_BallTrack.tcl;
step4:Wait for a minute ,then the project is built.

Attention:
When you run the Basys3_BallTrack.tcl, vivado's run operation may be obstrucked in runing "place_design" progress. Then you can stop the running progress, open the vivado project setting options, 
and set "Place Design -directive" to "quick". Then re-run synthesis, implementation, and generate bitstream.
