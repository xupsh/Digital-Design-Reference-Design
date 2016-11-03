Description:
.drive cmos camera ov7670/ov7725, get rgb pixel,and generate frame buffer's write address

Interface:
.pclk:   pixel clock input from camera module
.vsync:  frame synchronization signal
.href:   line synchronization signal
.d:      camera's 8-bit data input
.dout:   16-bit rgb pixel data output
.addr:   frame buffer write address
.we: 	 frame buffer write enable
.wclk:	 frame buffer write clock
.H_cnt:  column  count,0-319
.V_cnt:  row  count,0-239