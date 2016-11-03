#uart gpio
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]

set_property PACKAGE_PIN B18 [get_ports UART_rxd]
set_property PACKAGE_PIN A18 [get_ports UART_txd]



#main clock
set_property PACKAGE_PIN W5 [get_ports clk_in1]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in1]


