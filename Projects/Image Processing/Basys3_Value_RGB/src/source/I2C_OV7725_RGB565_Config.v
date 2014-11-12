/*-------------------------------------------------------------------------
This confidential and proprietary software may be only used as authorized
by a licensing agreement from amfpga.
(C COPYRIGHT 2013.www.amfpga.com ALL RIGHTS RESERVED
Filename			:		sdram_ov7725_vga.v
Author				:		Amfpga
Data				:		2013-02-1
Version				:		1.0
Description			:		sdram vga controller with ov7725 display.
Modification History	:
Data			By			Version			Change Description
===========================================================================
13/02/1
--------------------------------------------------------------------------*/

`timescale 1ns/1ns
module	I2C_OV7725_RGB565_Config
(
	input		[7:0]	LUT_INDEX,
	output	reg	[15:0]	LUT_DATA)
;


parameter	Read_DATA	=	0;			//Read data LUT Address
parameter	SET_OV7670	=	2;			//SET_OV LUT Adderss

/////////////////////	Config Data LUT	  //////////////////////////	
always@(*)
begin
	case(LUT_INDEX)
	
 	SET_OV7670 +     1  :LUT_DATA = 16'h1100; /*clock config*/	
    SET_OV7670 +  2     :LUT_DATA = 16'h1246; /*QVGA RGB565 */	
    SET_OV7670 +  3     :LUT_DATA = 16'h0cd0; 



	default		 :	LUT_DATA	=	0;
	endcase
end

endmodule
