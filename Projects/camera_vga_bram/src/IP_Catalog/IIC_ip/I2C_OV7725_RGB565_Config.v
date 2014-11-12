module	I2C_OV7725_RGB565_Config
(
	input		[7:0]	LUT_INDEX,
	output	reg	[15:0]	LUT_DATA)
;


parameter	Read_DATA	=	0;		
parameter	SET_OV7725	=	2;			

always@(*)
begin
	case(LUT_INDEX)
	
  	SET_OV7725 +     1  :LUT_DATA = 16'h1100; /*clock config*/	
    SET_OV7725 +  2     :LUT_DATA = 16'h1246; /*QVGA RGB565 */	
    SET_OV7725 +  3     :LUT_DATA = 16'h0cd0; 

	default		 :	LUT_DATA	=	0;
	endcase
end

endmodule
