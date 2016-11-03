Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
.using ov7725 camera to capture picture, use sobel module to process the image, and show on VGA

this demo use 1 button:
BTND --system reset

How to run the demo:
step1:connect the ov7725 camera module with Basys3 JB&JC pmod, connect VGA((constraints is specificly defined in B3_Sobel.xdc));
setp2:copy B3_sobel_download.bit to USB flash disk, connect USB disk to Basys3(or write B3_sobel_download.bin to flash);
step3:power on Basys3, then we can see VGA  display sobel image;

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the "Sobel_Filter.tcl" tcl file path.For example, if tcl file is in F:\Src\Tcl,
 you should use this command: cd f:/Src/Tcl;
step3:Then use source command to run tcl.You can just use command: source ./Sobel_Filter.tcl;
step4:Wait for a minute ,then the project is built.
