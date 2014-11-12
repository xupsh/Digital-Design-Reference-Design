# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set I2C_Freq [ipgui::add_param $IPINST -parent $Page0 -name I2C_Freq]
	set CLK_Freq [ipgui::add_param $IPINST -parent $Page0 -name CLK_Freq]
	set LUT_SIZE [ipgui::add_param $IPINST -parent $Page0 -name LUT_SIZE]
}

proc update_PARAM_VALUE.I2C_Freq { PARAM_VALUE.I2C_Freq } {
	# Procedure called to update I2C_Freq when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.I2C_Freq { PARAM_VALUE.I2C_Freq } {
	# Procedure called to validate I2C_Freq
	return true
}

proc update_PARAM_VALUE.CLK_Freq { PARAM_VALUE.CLK_Freq } {
	# Procedure called to update CLK_Freq when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_Freq { PARAM_VALUE.CLK_Freq } {
	# Procedure called to validate CLK_Freq
	return true
}

proc update_PARAM_VALUE.LUT_SIZE { PARAM_VALUE.LUT_SIZE } {
	# Procedure called to update LUT_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LUT_SIZE { PARAM_VALUE.LUT_SIZE } {
	# Procedure called to validate LUT_SIZE
	return true
}


proc update_MODELPARAM_VALUE.LUT_SIZE { MODELPARAM_VALUE.LUT_SIZE PARAM_VALUE.LUT_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LUT_SIZE}] ${MODELPARAM_VALUE.LUT_SIZE}
}

proc update_MODELPARAM_VALUE.CLK_Freq { MODELPARAM_VALUE.CLK_Freq PARAM_VALUE.CLK_Freq } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_Freq}] ${MODELPARAM_VALUE.CLK_Freq}
}

proc update_MODELPARAM_VALUE.I2C_Freq { MODELPARAM_VALUE.I2C_Freq PARAM_VALUE.I2C_Freq } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.I2C_Freq}] ${MODELPARAM_VALUE.I2C_Freq}
}

