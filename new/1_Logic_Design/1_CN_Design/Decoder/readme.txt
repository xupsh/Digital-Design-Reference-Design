Tool:  Vivado 2014.4 
Board: Digilent Basys3 Board

Introduction:

Decoder circuits receive inputs in the form of an N-bit binary number and generate one or more outputs according to some requirement. A binary decoder has N inputs and 2^N outputs. If the N inputs are taken as an N-bit binary number, then only the output that corresponds to the input binary number is asserted. For example, in the 3:8 binary decoder shown in Fig. 3 below, if a binary 5 (or “101”) is presented on the input of the decoder, then only the 5th output of the decoder (Y5) will be asserted and all of the other outputs will be de-asserted.

.the project is built with an IP 74LS138, which is 3-8 Decoder.
.3-bit to 8-bit decoder, the sw[2:0] is input signals, and sw[3] is E1,  and sw[4] is E2_n, and sw[5] is E3_n. And led LD[7:0] is output.
.The decoder works correctly, when the sw[5:3] is 3'b001.

How to run the demo:
setp1:copy B3_Decoder_download.bit to USB flash disk, connect USB disk to Basys3;
step2:power on Basys3, download the B3_Decoder_download.bit;
step3:You can use switches sw[2:0] as input, and the decoder is enable when the sw[5:3] is 3'b001.And the decoder output is shown on LD[7:0].

How to build the demo:
step1:Open vivado 2014.4;
step2:in the tcl console, use cd command to into the current tcl file path.For example, if tcl file is in F:/Src/Tcl/Decoder_Design.tcl, you should use this command: cd f:/Src/Tcl;The tcl named "Decoder_Design.tcl" is used to build the project, another tcl named "Decoder.tcl" is used to decribe the block design exported by vivado.
step3:Then use source command to run tcl.For example,if tcl file is in F:/Src/Tcl/Decoder_Design.tcl, you can just use command: source ./Decoder_Design.tcl;
step4:Wait for a minute ,then the project is built.