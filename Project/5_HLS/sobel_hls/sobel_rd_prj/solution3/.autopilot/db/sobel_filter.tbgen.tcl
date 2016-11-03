set C_TypeInfoList {{ 
"sobel_filter" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"inter_pix": [[], {"array": [ {"array": ["0", [1920]]}, [1080]]}] }, {"out_pix": [[], {"array": [ {"array": ["0", [1920]]}, [1080]]}] }, {"rows": [[], {"scalar": "int"}] }, {"cols": [[], {"scalar": "int"}] }],[],""], 
"0": [ "sobel_vga", {"typedef": [[[],"1"],""]}], 
"1": [ "ap_fixed<24, 24, 5, 3, 0>", {"hls_type": {"ap_fixed": [[[[], {"scalar": { "int": 24}}],[[], {"scalar": { "int": 24}}],[[], {"scalar": { "2": 5}}],[[], {"scalar": { "3": 3}}],[[], {"scalar": { "int": 0}}]],""]}}], 
"3": [ "ap_o_mode", {"enum": [[],[],[{"SC_SAT":  {"scalar": "__integer__"}},{"SC_SAT_ZERO":  {"scalar": "__integer__"}},{"SC_SAT_SYM":  {"scalar": "__integer__"}},{"SC_WRAP":  {"scalar": "__integer__"}},{"SC_WRAP_SM":  {"scalar": "__integer__"}}],""]}], 
"2": [ "ap_q_mode", {"enum": [[],[],[{"SC_RND":  {"scalar": "__integer__"}},{"SC_RND_ZERO":  {"scalar": "__integer__"}},{"SC_RND_MIN_INF":  {"scalar": "__integer__"}},{"SC_RND_INF":  {"scalar": "__integer__"}},{"SC_RND_CONV":  {"scalar": "__integer__"}},{"SC_TRN":  {"scalar": "__integer__"}},{"SC_TRN_ZERO":  {"scalar": "__integer__"}}],""]}]
}}
set moduleName sobel_filter
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set C_modelName {sobel_filter}
set C_modelType { void 0 }
set C_modelArgList { 
	{ inter_pix_V int 24 regular {array 2073600 { 1 3 } 3 1 }  }
	{ out_pix_V int 24 regular {array 2073600 { 0 3 } 1 1 }  }
	{ rows int 32 regular  }
	{ cols int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inter_pix_V", "interface" : "memory", "bitwidth" : 24, "direction" : "READONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "inter_pix.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 1079,"step" : 1},{"low" : 0,"up" : 1919,"step" : 1}]}]}]} , 
 	{ "Name" : "out_pix_V", "interface" : "memory", "bitwidth" : 24, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":23,"cElement": [{"cName": "out_pix.V","cData": "int24","bit_use": { "low": 0,"up": 23},"cArray": [{"low" : 0,"up" : 1079,"step" : 1},{"low" : 0,"up" : 1919,"step" : 1}]}]}]} , 
 	{ "Name" : "rows", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "rows","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "cols", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "cols","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 11
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ inter_pix_V_address0 sc_out sc_lv 21 signal 0 } 
	{ inter_pix_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ inter_pix_V_q0 sc_in sc_lv 24 signal 0 } 
	{ out_pix_V_address0 sc_out sc_lv 21 signal 1 } 
	{ out_pix_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ out_pix_V_we0 sc_out sc_logic 1 signal 1 } 
	{ out_pix_V_d0 sc_out sc_lv 24 signal 1 } 
	{ rows sc_in sc_lv 32 signal 2 } 
	{ cols sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "inter_pix_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":21, "type": "signal", "bundle":{"name": "inter_pix_V", "role": "address0" }} , 
 	{ "name": "inter_pix_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inter_pix_V", "role": "ce0" }} , 
 	{ "name": "inter_pix_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "inter_pix_V", "role": "q0" }} , 
 	{ "name": "out_pix_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":21, "type": "signal", "bundle":{"name": "out_pix_V", "role": "address0" }} , 
 	{ "name": "out_pix_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_pix_V", "role": "ce0" }} , 
 	{ "name": "out_pix_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_pix_V", "role": "we0" }} , 
 	{ "name": "out_pix_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "out_pix_V", "role": "d0" }} , 
 	{ "name": "rows", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "default" }} , 
 	{ "name": "cols", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "default" }}  ]}
set Spec2ImplPortList { 
	inter_pix_V { ap_memory {  { inter_pix_V_address0 mem_address 1 21 }  { inter_pix_V_ce0 mem_ce 1 1 }  { inter_pix_V_q0 mem_dout 0 24 } } }
	out_pix_V { ap_memory {  { out_pix_V_address0 mem_address 1 21 }  { out_pix_V_ce0 mem_ce 1 1 }  { out_pix_V_we0 mem_we 1 1 }  { out_pix_V_d0 mem_din 1 24 } } }
	rows { ap_none {  { rows in_data 0 32 } } }
	cols { ap_none {  { cols in_data 0 32 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
	{ inter_pix_V 3 }
}
