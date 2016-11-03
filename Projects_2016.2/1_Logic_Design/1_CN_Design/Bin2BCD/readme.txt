Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:
All digital hardware manipulates information in binary digits (bits). However, human are much more familiar with decimal representations. Therefore, it is often that binary values are converted into decimal digits, which is known as binary-coded decimal (BCD) numbers. For example, an 8-bit number 8’b01111100 which could be display on the 7-segment display as two digit hex number 8’h7C, is better displayed as 8’d124, using three BCD digits. Each digit is still coded as a 4-bit decimal entity, but the range of the value is now 0 to 9, instead of 0 to F.

.the project is using an IP called 74LS185, this IP can converter the binary data to BCD format.the chip has 8bits output. however, there are two highest bits setting hign electrical level all the time. they can be ignored.
.using 6-bits switches as binary input: sw[5:0]
.using 7-bits LEDs as BCD output: LD[6:0]
.using 1-bit switch as an Enable input.
.using 2-bits LEDs as the two highest bits: LD[8:7]

How to run the demo:
setp1:copy B3_bin_to_BCD_downloadr.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_bin_to_BCD_downloadr.bit;
step3:You can using switches sw[5:0] as binary input, and 8-bit BCD output will show on LD[6:0] correctly,when the Enable input is low.

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example,if tcl file is in F:/Src/Tcl/Bin2BCD_Design.tcl, you should use this command: cd f:/Src/Tcl;The tcl named "Bin2BCD_Design.tcl" is used to build the project, another tcl named "bin_to_BCD.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Bin2BCD_Design.tcl, you can just use command: source ./Bin2BCD_Design.tcl;
step4:Wait for a minute ,then the project is built.