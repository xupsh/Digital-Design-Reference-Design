This project's function is:
.using ov7725 camera to capture picture
.recognize the mathematical operation characters in picture, compute the operation's result and show

this demo use 10 switch:
sw[0]-sw[7] --binary image's threshold(sw[7]is high-bit)
sw[14]--image show mode(1 is binary image, 0 is normal RGB image)
sw[15]--image pause or not(1 is pause , 0 is not pause)

How to run the demo:
step1:connect the ov7725 camera module with Basys3 JB&JC pmod(constraints is specificly defined in B3_OCRoperation.xdc),and connect VGA to Basys3;
setp2:copy B3_OCRoperation_download.bit to USB flash disk, connect USB disk to Basys3;
step3:power on Basys3, set sw[14] and sw[15]  to 1, download the B3_OCRoperation_download.bit;
step4:open the .jpg file in Misc floder£¬make the camera's lens focus on the  mathematical operation characters,make sure that all the characters is within the yellow rectangle,and the character's height
is nearly equal to the   yellow rectangle's height, and do not dilt characters;
step5:set sw[14] to 0 to observe the binary image. The binary threshold can be setting by sw[0]-sw[7](sw[7]is high-bit).If binary threshold is suitable, then set sw[14]  to 1 ;
step6: Set sw[15]  to 0 to pause image. The operation's result is show on VGA screen.

How to build the demo:
step1:Open vivado 2014.2;
step2:in the tcl console, use cd command to into the current tclfile path.For example, if tcl file is in F:/project/X.tcl, you should use this command: cd f:/project;
step3:Then use source command to run tcl.For example,if tcl file is in F:/project/X.tcl, you can just use command: source ./X.tcl;
step4:Wait for a minute ,then the project is built.