This project's function is:
.using ov7725 camera to capture picture, and show on VGA

How to run the demo:
step1:connect the ov7725 camera module with Basys3 JB&JC pmod(constraints is specificly defined in design_1_wrapper.xdc),and connect VGA to Basys3;
setp2:copy B3_CameraVgaBram_download.bit to USB flash disk, connect USB disk to Basys3;
step3:power on Basys3, download the B3_CameraVgaBram_download.bit;
step4:You can see image is show on VGA screen.

How to build the demo:
step1:Open vivado 2014.2;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/project/X.tcl, you should use this command: cd f:/project. In this project, the tcl file to run is camera_vga_bram.tcl;
step3:Then use source command to run tcl.For example,if tcl file is in F:/project/X.tcl, you can just use command: source ./X.tcl;
step4:Wait for a minute ,then the project is built.