Description:
.according to ov7725 's timing sequence, capture the cmos's data and put them together to RGB pixel
.generate the write address for frame buffer

the ip's interface:
.pclk:pixel clock from camera
.vsync:field sync signal from camera
.href:line sync signal from camera
.d:data signal from camera(8 bit)
.dout:RGB pixel data signal, to framebuffer(16 bit)
.addr:write address signal, to framebuffer
.we:write enable signal, to framebuffer
.wclk:write clock signal, to framebuffer
