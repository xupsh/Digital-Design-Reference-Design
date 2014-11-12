This project's function is:
.using ov7725 camera to capture picture
.recognize the number character(0-9) in picture

this demo use 10 switch:
sw[0]-sw[7] --binary image's threshold(sw[7]is high-bit)
sw[14]--image show mode(1 is binary image, 0 is normal RGB image)
sw[15]--image pause or not(1 is pause , 0 is not pause)

How to run the demo:
step1:connect the ov7725 camera module with Basys3 JB&JC pmod(constraints is specificly defined in B3_OCR.xdc),and connect VGA to Basys3;
setp2:copy B3_OCR_download.bit to USB flash disk, connect USB disk to Basys3;
step3:power on Basys3, set sw[14] and sw[15]  to 1, download the B3_OCR_download.bit;
step34:open the .jpg file£¬make the camera's lens focus on the Number character,make sure that the character is within the yellow rectangle,and the character's height
is nearly equal to the   yellow rectangle's height, and do not dilt character;
step5:set sw[14] to 0 to observe the binary image. The binary threshold can be setting by sw[0]-sw[7](sw[7]is high-bit).If binary threshold is suitable, then set sw[14]  to 1 ;
step6: Set sw[15]  to 0 to pause image. The result is show on VGA screen.

How to build the demo:
step1:Open vivado 2014.2;
step2:in the tcl console, use cd command to into the current tclfile path.For example, if tcl file is in F:/project/X.tcl, you should use this command: cd f:/project;
step3:Then use source command to run tcl.For example,if tcl file is in F:/project/X.tcl, you can just use command: source ./X.tcl;
step4:Wait for a minute ,then the project is built.