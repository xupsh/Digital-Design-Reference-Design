#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("inter_pix_V_address0", 21, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("inter_pix_V_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("inter_pix_V_q0", 24, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("out_pix_V_address0", 21, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("out_pix_V_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("out_pix_V_we0", 1, hls_out, 1, "ap_memory", "mem_we", 1),
	Port_Property("out_pix_V_d0", 24, hls_out, 1, "ap_memory", "mem_din", 1),
	Port_Property("rows", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("cols", 32, hls_in, 3, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "sobel_filter";
