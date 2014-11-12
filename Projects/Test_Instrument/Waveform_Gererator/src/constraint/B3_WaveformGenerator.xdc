set_property PACKAGE_PIN V17 [get_ports {wave_type[0]}]
set_property PACKAGE_PIN V16 [get_ports {wave_type[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {wave_type[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {wave_type[0]}]

#key
set_property PACKAGE_PIN W19 [get_ports key_t]
set_property IOSTANDARD LVCMOS33 [get_ports key_t] 
set_property PACKAGE_PIN T18 [get_ports key_h]
set_property IOSTANDARD LVCMOS33 [get_ports key_h] 
set_property PACKAGE_PIN T17 [get_ports key_d]
set_property IOSTANDARD LVCMOS33 [get_ports key_d] 
set_property PACKAGE_PIN U17 [get_ports key_u]
set_property IOSTANDARD LVCMOS33 [get_ports key_u] 

#main clock 100MHz
set_property PACKAGE_PIN W5 [get_ports clk100]
set_property IOSTANDARD LVCMOS33 [get_ports clk100]  


#dac
set_property PACKAGE_PIN C16 [get_ports {data_gen[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[7]}]
set_property PACKAGE_PIN C15 [get_ports {data_gen[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[6]}]
set_property PACKAGE_PIN A17 [get_ports {data_gen[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[5]}]
set_property PACKAGE_PIN A15 [get_ports {data_gen[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[4]}]
set_property PACKAGE_PIN B16 [get_ports {data_gen[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[3]}]
set_property PACKAGE_PIN B15 [get_ports {data_gen[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[2]}]
set_property PACKAGE_PIN A16 [get_ports {data_gen[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[1]}]
set_property PACKAGE_PIN A14 [get_ports {data_gen[0]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {data_gen[0]}]	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]
set_property PACKAGE_PIN W6 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN U8 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN V8 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN U5 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN V5 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN U7 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN V7 [get_ports {seg[0]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]	

set_property PACKAGE_PIN U2 [get_ports {seg[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[8]}]
set_property PACKAGE_PIN U4 [get_ports {seg[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[9]}]
set_property PACKAGE_PIN V4 [get_ports {seg[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[10]}]
set_property PACKAGE_PIN W4 [get_ports {seg[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[11]}]


