#key
set_property PACKAGE_PIN U18 [get_ports btn_ChangeFre]
set_property IOSTANDARD LVCMOS33 [get_ports btn_ChangeFre] 

# VGA signals
set_property PACKAGE_PIN J18 [get_ports {blue[1]}]
set_property PACKAGE_PIN K18 [get_ports {blue[0]}]

set_property PACKAGE_PIN D17 [get_ports {green[2]}]
set_property PACKAGE_PIN G17 [get_ports {green[1]}]
set_property PACKAGE_PIN H17 [get_ports {green[0]}]
set_property PACKAGE_PIN N19 [get_ports {red[2]}]
set_property PACKAGE_PIN J19 [get_ports {red[1]}]
set_property PACKAGE_PIN H19 [get_ports {red[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]
set_property PACKAGE_PIN P19 [get_ports hsync]
set_property PACKAGE_PIN R19 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

#main clock 100MHz
set_property PACKAGE_PIN W5 [get_ports mclk]
set_property IOSTANDARD LVCMOS33 [get_ports mclk]  
	
#XADC signal
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
set_property IOSTANDARD LVCMOS33 [get_ports vauxp6]
set_property IOSTANDARD LVCMOS33 [get_ports vauxn6]
set_property IOSTANDARD LVCMOS33 [get_ports vauxp7]
set_property IOSTANDARD LVCMOS33 [get_ports vauxn7]
set_property IOSTANDARD LVCMOS33 [get_ports vauxp14]
set_property IOSTANDARD LVCMOS33 [get_ports vauxn14]
set_property IOSTANDARD LVCMOS33 [get_ports vauxp15]
set_property IOSTANDARD LVCMOS33 [get_ports vauxn15]
