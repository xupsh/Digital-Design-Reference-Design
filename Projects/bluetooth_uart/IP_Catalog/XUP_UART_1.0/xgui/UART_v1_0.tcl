# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set SB_TICK [ipgui::add_param $IPINST -parent $Page0 -name SB_TICK -widget comboBox]
	set DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name DATA_WIDTH]
	set DVSR [ipgui::add_param $IPINST -parent $Page0 -name DVSR]
}

proc update_PARAM_VALUE.SB_TICK { PARAM_VALUE.SB_TICK } {
	# Procedure called to update SB_TICK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SB_TICK { PARAM_VALUE.SB_TICK } {
	# Procedure called to validate SB_TICK
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DVSR { PARAM_VALUE.DVSR } {
	# Procedure called to update DVSR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DVSR { PARAM_VALUE.DVSR } {
	# Procedure called to validate DVSR
	return true
}


proc update_MODELPARAM_VALUE.DVSR { MODELPARAM_VALUE.DVSR PARAM_VALUE.DVSR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DVSR}] ${MODELPARAM_VALUE.DVSR}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.SB_TICK { MODELPARAM_VALUE.SB_TICK PARAM_VALUE.SB_TICK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SB_TICK}] ${MODELPARAM_VALUE.SB_TICK}
}

