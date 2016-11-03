#uart gpio
#set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]
#set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]

#set_property PACKAGE_PIN B18 [get_ports UART_rxd]
#set_property PACKAGE_PIN A18 [get_ports UART_txd]


#main clock
set_property PACKAGE_PIN W5 [get_ports clk_in1]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in1]


set_property PACKAGE_PIN B16 [get_ports spi_0_sck_io]
set_property PACKAGE_PIN B15 [get_ports spi_0_io0_io]
set_property PACKAGE_PIN A17 [get_ports spi_0_io1_io]
set_property PACKAGE_PIN C15 [get_ports {spi_0_ss_io[0]}]
set_property PACKAGE_PIN A16 [get_ports {reset_tri_io[0]}]
set_property PACKAGE_PIN A14 [get_ports {dc_tri_io[0]}]
set_property PACKAGE_PIN U16 [get_ports led1_tri_io]
set_property PACKAGE_PIN E19 [get_ports led2_tri_io]
#set_property PACKAGE_PIN W5 [get_ports clk]
#set_property PACKAGE_PIN A15 [get_ports sck_reg]



set_property IOSTANDARD LVCMOS33 [get_ports spi_0_sck_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_0_io1_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_0_io0_io]
set_property IOSTANDARD LVCMOS33 [get_ports {spi_0_ss_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dc_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports led1_tri_io]
set_property IOSTANDARD LVCMOS33 [get_ports led2_tri_io]
#set_property IOSTANDARD LVCMOS33 [get_ports clk]
#set_property IOSTANDARD LVCMOS33 [get_ports sck_reg]
