Description: 
.Serial Peripheral Interface(SPI) is a kind of synchronous serial interface.The ip implement the SPI0 mode of SPI master mode.

the ip's interface:
.sclk:serial clock signal
.miso:data signal (master input/slave output)
.mosi:data signal (master output/slave input)
.cs:slave salect signal(active low)
.rd:read signal
.wr:write signal
.clk:system clock
.in_data:8-bit data signal input
.out_data:8-bit data signal output
.addr:IP work mode(00:normal
 		   01:master busy
		   10:set clock)

