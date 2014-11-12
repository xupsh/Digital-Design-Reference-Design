Description: 
.Universal Asynchronous and Transmitter(UART) contains 2 module: send module and receive module. 

the ip's interface:
.DVSR:baund rate divide value(DVSR = clk/(baunds*16))
.clk:system clock
.reset:system reset
.rx:serial port receive
.tx:serial port send
.data_in:8-bit data signal input
.data_out:8-bit data signal output
.tx_btn:send control(should be connected with a button)
.rx_done:receive done signal
.tx_done:send done signal
