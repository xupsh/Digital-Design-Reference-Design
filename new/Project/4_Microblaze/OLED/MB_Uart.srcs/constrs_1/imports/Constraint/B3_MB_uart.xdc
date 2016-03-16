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

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/clk_wiz_0_clk_out2]]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list spi_0_io0_o]]
create_debug_core u_ila_1_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1_0]
set_property port_width 1 [get_debug_ports u_ila_1_0/clk]
connect_debug_port u_ila_1_0/clk [get_nets [list design_1_i/microblaze_0_Clk]]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe0]
connect_debug_port u_ila_1_0/probe0 [get_nets [list dc_tri_o_0]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_wiz_0_clk_out2]
