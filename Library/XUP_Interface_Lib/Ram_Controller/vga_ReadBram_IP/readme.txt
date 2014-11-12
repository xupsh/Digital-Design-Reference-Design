Description:
.generate VGA signal(RGB, field and line synchronous signal)
.resolution:640x480

the ip's interface:
.clk25:clock input(25MHz)
.vga_red:RGB data's red signal
.vga_green:RGB data's green signal
.vga_blue:RGB data's blue signal
.vga_hsync:VGA's line synchronous signal
.vga_vsync:VGA's field synchronous signal
.HCnt:column's count value
.VCnt:row's count value
.frame_addr:read address,connect to frame buffer read address
.frame_pixel:RGB pixel data read from frame buffer

