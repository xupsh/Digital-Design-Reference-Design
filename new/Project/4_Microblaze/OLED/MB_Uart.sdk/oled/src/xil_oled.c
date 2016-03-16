/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 *
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "xspi.h"
#include "spi_header.h"

#include <sys/time.h>
#include "microblaze_sleep.h"

#define OLED_USE_SPI

#define DC_CHANNEL 1
#define reset_CHANNEL 1
XGpio dc;
XGpio reset;
XGpio led1;
XGpio led2;
XSpi Spi;

#define SPI_DEVICE_ID       XPAR_AXI_QUAD_SPI_0_DEVICE_ID//XPAR_SPI_0_DEVICE_ID

const u8 F6x8[][6] = { { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },   // sp
		{ 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00 },   // !
		{ 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 },   // "
		{ 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14 },   // #
		{ 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12 },   // $
		{ 0x00, 0x62, 0x64, 0x08, 0x13, 0x23 },   // %
		{ 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 },   // &
		{ 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 },   // '
		{ 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00 },   // (
		{ 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00 },   // )
		{ 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 },   // *
		{ 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 },   // +
		{ 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00 },   // ,
		{ 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 },   // -
		{ 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 },   // .
		{ 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 },   // /
		{ 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E },   // 0
		{ 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 },   // 1
		{ 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 },   // 2
		{ 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 },   // 3
		{ 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 },   // 4
		{ 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 },   // 5
		{ 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 },   // 6
		{ 0x00, 0x01, 0x71, 0x09, 0x05, 0x03 },   // 7
		{ 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 },   // 8
		{ 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E },   // 9
		{ 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 },   // :
		{ 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 },   // ;
		{ 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 },   // <
		{ 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 },   // =
		{ 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 },   // >
		{ 0x00, 0x02, 0x01, 0x51, 0x09, 0x06 },   // ?
		{ 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E },   // @
		{ 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C },   // A
		{ 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36 },   // B
		{ 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 },   // C
		{ 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C },   // D
		{ 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41 },   // E
		{ 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01 },   // F
		{ 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A },   // G
		{ 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F },   // H
		{ 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 },   // I
		{ 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 },   // J
		{ 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 },   // K
		{ 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 },   // L
		{ 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F },   // M
		{ 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F },   // N
		{ 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E },   // O
		{ 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 },   // P
		{ 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E },   // Q
		{ 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 },   // R
		{ 0x00, 0x46, 0x49, 0x49, 0x49, 0x31 },   // S
		{ 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 },   // T
		{ 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F },   // U
		{ 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F },   // V
		{ 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F },   // W
		{ 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 },   // X
		{ 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 },   // Y
		{ 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 },   // Z
		{ 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 },   // [ 91
		{ 0x00, 0x02, 0x04, 0x08, 0x10, 0x20 },    // \92
		{ 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 },   // ]
		{ 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 },   // ^
		{ 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 },   // _
		{ 0x00, 0x00, 0x01, 0x02, 0x04, 0x00 },   // '
		{ 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 },   // a
		{ 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 },   // b
		{ 0x00, 0x38, 0x44, 0x44, 0x44, 0x20 },   // c
		{ 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F },   // d
		{ 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 },   // e
		{ 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02 },   // f
		{ 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C },   // g
		{ 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 },   // h
		{ 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 },   // i
		{ 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00 },   // j
		{ 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00 },   // k
		{ 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 },   // l
		{ 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78 },   // m
		{ 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 },   // n
		{ 0x00, 0x38, 0x44, 0x44, 0x44, 0x38 },   // o
		{ 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18 },   // p
		{ 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC },   // q
		{ 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 },   // r
		{ 0x00, 0x48, 0x54, 0x54, 0x54, 0x20 },   // s
		{ 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 },   // t
		{ 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C },   // u
		{ 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C },   // v
		{ 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C },   // w
		{ 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 },   // x
		{ 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C },   // y
		{ 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 },   // z
		{ 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 }    // horiz lines
};

void LEDPIN_Init(void)
{
	int Status;
	Status = XGpio_Initialize(&dc, XPAR_AXI_GPIO_0_DEVICE_ID);
		 if (Status != XST_SUCCESS)  {
			  return XST_FAILURE;
		 }

	Status = XGpio_Initialize(&reset, XPAR_AXI_GPIO_1_DEVICE_ID);
		 if (Status != XST_SUCCESS)  {
		 		return XST_FAILURE;
		 }

		 Status = XGpio_Initialize(&led1, XPAR_AXI_GPIO_2_DEVICE_ID);
		 		 if (Status != XST_SUCCESS)  {
		 		 		return XST_FAILURE;
		 		 }

		 		Status = XGpio_Initialize(&led2, XPAR_AXI_GPIO_3_DEVICE_ID);
		 				 if (Status != XST_SUCCESS)  {
		 				 		return XST_FAILURE;
		 				 }
	XGpio_SetDataDirection(&dc, DC_CHANNEL, 0x0);
	XGpio_DiscreteWrite(&dc, DC_CHANNEL, 0x0);

	XGpio_SetDataDirection(&reset, reset_CHANNEL, 0x0);
	XGpio_DiscreteWrite(&reset, reset_CHANNEL, 0x0);

	XGpio_SetDataDirection(&led1, reset_CHANNEL, 0x0);
	XGpio_DiscreteWrite(&led1, reset_CHANNEL, 0x0);

	XGpio_SetDataDirection(&led2, reset_CHANNEL, 0x0);
	XGpio_DiscreteWrite(&led2, reset_CHANNEL, 0x0);

	XGpio_DiscreteWrite(&led2, reset_CHANNEL, 0x1);
	XSpi_Config *ConfigPtr;	/* Pointer to Configuration data */

		/*
		 * Initialize the SPI driver so that it is  ready to use.
		 */
		ConfigPtr = XSpi_LookupConfig(SPI_DEVICE_ID);
		if (ConfigPtr == NULL) {
			return XST_DEVICE_NOT_FOUND;

		}

		Status = XSpi_CfgInitialize(&Spi, ConfigPtr,
					  ConfigPtr->BaseAddress);
		if (Status != XST_SUCCESS) {
			return XST_FAILURE;

		}

		/*
		 * Perform a self-test to ensure that the hardware was built correctly
		 */
		Status = XSpi_SelfTest(&Spi);
		if (Status != XST_SUCCESS) {
			return XST_FAILURE;

		}

		Status = XSpi_SetOptions(&Spi, XSP_MASTER_OPTION | XSP_CLK_ACTIVE_LOW_OPTION );//|  XSP_CR_CLK_POLARITY_MASK | XSP_CR_CLK_PHASE_MASK);
						if (Status != XST_SUCCESS) {
							return XST_FAILURE;
							XGpio_DiscreteWrite(&led2, reset_CHANNEL, 0x0);
						}

				// | XSP_CR_CPOL_MASK|XSP_CR_CPHA_MASK);
		//XSpiPs_SetClkPrescaler(&Spi, XSPIPS_CLK_PRESCALE_256);

		XSpi_SetSlaveSelect(&Spi, 0x1);

		//XSpi_Start(&Spi);

		Status = XSpi_Start(&Spi);
				if (Status != XST_SUCCESS) {
					return XST_FAILURE;

				}
		XSpi_IntrGlobalDisable(&Spi);
		/*Status = XSpi_SetSlaveSelect(&Spi, 0x1);
				if (Status != XST_SUCCESS) {
					return XST_FAILURE;
				}*/


}


void LED_WrDat(u8 data)
{

	XGpio_DiscreteWrite(&dc, DC_CHANNEL, 0x1);

	XSpi_Transfer(&Spi, &data, 0, sizeof(data));
	//oled_SPI->RWOneByte(oled_SPI, data, 0);

	}


void LED_WrCmd(u8 cmd)
{

	XGpio_DiscreteWrite(&dc, DC_CHANNEL, 0x0);
	XSpi_Transfer(&Spi, &cmd, 0, sizeof(cmd));

	XGpio_DiscreteWrite(&led1, reset_CHANNEL, 0x1);
	//oled_gpio->digitalWrite(oled_gpio, 0, OLED_DC_PIN, 0);

	//oled_SPI->RWOneByte(oled_SPI, cmd, 0);

}

void LED_Set_Pos(u8 x, u8 y)
{
	LED_WrCmd(0xb0 + y);
	LED_WrCmd(((x & 0xf0) >> 4) | 0x10);
	LED_WrCmd((x & 0x0f) | 0x00);
}

void LED_Fill(u8 bmp_data) {
	u8 y, x;

	for (y = 0; y < 8; y++) {
		LED_WrCmd(0xb0 + y);
		LED_WrCmd(0x00);
		LED_WrCmd(0x10);
		for (x = 0; x < 130; x++)
			LED_WrDat(bmp_data);
	}
}

void LED_CLS(void)
{
	u8 y, x;
	for (y = 0; y < 8; y++) {
		LED_WrCmd(0xb0 + y);
		LED_WrCmd(0x00);
		LED_WrCmd(0x10);
		for (x = 0; x < 130; x++)
			LED_WrDat(0);
	}
}

void SetStartColumn(unsigned char d) {
	LED_WrCmd(0x00 + d % 16); // Set Lower Column Start Address for Page Addressing Mode
							  // Default => 0x00
	LED_WrCmd(0x10 + d / 16);// Set Higher Column Start Address for Page Addressing Mode
							 // Default => 0x10
}

void SetAddressingMode(unsigned char d) {
	LED_WrCmd(0x20);			// Set Memory Addressing Mode
	LED_WrCmd(d);			// Default => 0x02
							// 0x00 => Horizontal Addressing Mode
							// 0x01 => Vertical Addressing Mode
							// 0x02 => Page Addressing Mode
}

void SetColumnAddress(unsigned char a, unsigned char b) {
	LED_WrCmd(0x21);			// Set Column Address
	LED_WrCmd(a);			// Default => 0x00 (Column Start Address)
	LED_WrCmd(b);			// Default => 0x7F (Column End Address)
}

void SetPageAddress(unsigned char a, unsigned char b) {
	LED_WrCmd(0x22);			// Set Page Address
	LED_WrCmd(a);			// Default => 0x00 (Page Start Address)
	LED_WrCmd(b);			// Default => 0x07 (Page End Address)
}

void SetStartLine(unsigned char d) {
	LED_WrCmd(0x40 | d);		// Set Display Start Line
								// Default => 0x40 (0x00)
}

void SetContrastControl(unsigned char d) {
	LED_WrCmd(0x81);			// Set Contrast Control
	LED_WrCmd(d);			// Default => 0x7F
}

void Set_Charge_Pump(unsigned char d) {
	LED_WrCmd(0x8D);			// Set Charge Pump
	LED_WrCmd(0x10 | d);		// Default => 0x10
								// 0x10 (0x00) => Disable Charge Pump
								// 0x14 (0x04) => Enable Charge Pump
}

void Set_Segment_Remap(unsigned char d) {
	LED_WrCmd(0xA0 | d);		// Set Segment Re-Map
								// Default => 0xA0
								// 0xA0 (0x00) => Column Address 0 Mapped to SEG0
								// 0xA1 (0x01) => Column Address 0 Mapped to SEG127
}

void Set_Entire_Display(unsigned char d) {
	LED_WrCmd(0xA4 | d);		// Set Entire Display On / Off
								// Default => 0xA4
								// 0xA4 (0x00) => Normal Display
								// 0xA5 (0x01) => Entire Display On
}

void Set_Inverse_Display(unsigned char d) {
	LED_WrCmd(0xA6 | d);		// Set Inverse Display On/Off
								// Default => 0xA6
								// 0xA6 (0x00) => Normal Display
								// 0xA7 (0x01) => Inverse Display On
}

void Set_Multiplex_Ratio(unsigned char d) {
	LED_WrCmd(0xA8);			// Set Multiplex Ratio
	LED_WrCmd(d);			// Default => 0x3F (1/64 Duty)
}

void Set_Display_On_Off(unsigned char d) {
	LED_WrCmd(0xAE | d);		// Set Display On/Off
								// Default => 0xAE
								// 0xAE (0x00) => Display Off
								// 0xAF (0x01) => Display On
}

void SetStartPage(unsigned char d) {
	LED_WrCmd(0xB0 | d);	// Set Page Start Address for Page Addressing Mode
							// Default => 0xB0 (0x00)
}

void Set_Common_Remap(unsigned char d) {
	LED_WrCmd(0xC0 | d);		// Set COM Output Scan Direction
								// Default => 0xC0
								// 0xC0 (0x00) => Scan from COM0 to 63
								// 0xC8 (0x08) => Scan from COM63 to 0
}

void Set_Display_Offset(unsigned char d) {
	LED_WrCmd(0xD3);			// Set Display Offset
	LED_WrCmd(d);			// Default => 0x00
}

void Set_Display_Clock(unsigned char d) {
	LED_WrCmd(0xD5);	// Set Display Clock Divide Ratio / Oscillator Frequency
	LED_WrCmd(d);			// Default => 0x80
							// D[3:0] => Display Clock Divider
							// D[7:4] => Oscillator Frequency
}

void Set_Precharge_Period(unsigned char d) {
	LED_WrCmd(0xD9);			// Set Pre-Charge Period
	LED_WrCmd(d);// Default => 0x22 (2 Display Clocks [Phase 2] / 2 Display Clocks [Phase 1])
				 // D[3:0] => Phase 1 Period in 1~15 Display Clocks
				 // D[7:4] => Phase 2 Period in 1~15 Display Clocks
}

void Set_Common_Config(unsigned char d) {
	LED_WrCmd(0xDA);			// Set COM Pins Hardware Configuration
	LED_WrCmd(0x02 | d);		// Default => 0x12 (0x10)
								// Alternative COM Pin Configuration
								// Disable COM Left/Right Re-Map
}

void Set_VCOMH(unsigned char d) {
	LED_WrCmd(0xDB);			// Set VCOMH Deselect Level
	LED_WrCmd(d);			// Default => 0x20 (0.77*VCC)
}

void Set_NOP(void) {
	LED_WrCmd(0xE3);			// Command for No Operation
}

void LED_Init(void) {

	LEDPIN_Init();

	/*while(1)
			{
				//MB_Sleep(1000);
				LED_WrCmd(0xaa);
				//MB_Sleep(1000);
				XGpio_DiscreteWrite(&led2, reset_CHANNEL, 0x1);
				XGpio_DiscreteWrite(&led1, reset_CHANNEL, 0x0);
			}*/
	XGpio_DiscreteWrite(&reset, reset_CHANNEL, 0x0);
	//usleep(800);
	MB_Sleep(80);
	XGpio_DiscreteWrite(&reset, reset_CHANNEL, 0x1);
	Set_Display_On_Off(0x00);		  // Display Off (0x00/0x01)
	Set_Display_Clock(0x80);		  // Set Clock as 100 Frames/Sec
	Set_Multiplex_Ratio(0x3F);	  // 1/64 Duty (0x0F~0x3F)
	Set_Display_Offset(0x00);		  // Shift Mapping RAM Counter (0x00~0x3F)
	SetStartLine(0x00);		// Set Mapping RAM Display Start Line (0x00~0x3F)
	Set_Charge_Pump(0x04);		  // Enable Embedded DC/DC Converter (0x00/0x04)
	SetAddressingMode(0x02);	  // Set Page Addressing Mode (0x00/0x01/0x02)
	Set_Segment_Remap(0x01);	// Set SEG/Column Mapping     0x00左右反置 0x01正常
	Set_Common_Remap(0x08);	  // Set COM/Row Scan Direction 0x00上下反置 0x08正常
	Set_Common_Config(0x10);	  // Set Sequential Configuration (0x00/0x10)
	SetContrastControl(0xCF); // Set SEG Output Current
	Set_Precharge_Period(0xF1);	// Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
	Set_VCOMH(0x40);			  // Set VCOM Deselect Level
	Set_Entire_Display(0x00);		  // Disable Entire Display On (0x00/0x01)
	Set_Inverse_Display(0x00);	  // Disable Inverse Display On (0x00/0x01)
	Set_Display_On_Off(0x01);		  // Display On (0x00/0x01)
	LED_Fill(0x00);                               //初始清屏
	LED_Set_Pos(0, 0);
}


//==============================================================

//==============================================================
void LED_P6x8Char(u8 x, u8 y, u8 ch) {
	u8 c = 0, i = 0;
	//   j=0;

	c = ch - 32;
	if (x > 122) {
		x = 0;
		y++;
	}
	LED_Set_Pos(x, y);
	for (i = 0; i < 6; i++) {
		LED_WrDat(F6x8[c][i]);
	}
}

//==============================================================

//==============================================================
void LED_P6x8Str(u8 x, u8 y, u8 ch[]) {
	u8 c = 0, i = 0, j = 0;
	while (ch[j] != '\0') {
		c = ch[j] - 32;
		if (x > 126) {
			x = 0;
			y++;
		}
		LED_Set_Pos(x, y);
		for (i = 0; i < 6; i++) {
			LED_WrDat(F6x8[c][i]);
		}
		x += 6;
		j++;
	}
}
//==============================================================

//==============================================================

//==============================================================

//==============================================================





