# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IMG_HEIGHT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IMG_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.IMG_HEIGHT { PARAM_VALUE.IMG_HEIGHT } {
	# Procedure called to update IMG_HEIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMG_HEIGHT { PARAM_VALUE.IMG_HEIGHT } {
	# Procedure called to validate IMG_HEIGHT
	return true
}

proc update_PARAM_VALUE.IMG_WIDTH { PARAM_VALUE.IMG_WIDTH } {
	# Procedure called to update IMG_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMG_WIDTH { PARAM_VALUE.IMG_WIDTH } {
	# Procedure called to validate IMG_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.IMG_WIDTH { MODELPARAM_VALUE.IMG_WIDTH PARAM_VALUE.IMG_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IMG_WIDTH}] ${MODELPARAM_VALUE.IMG_WIDTH}
}

proc update_MODELPARAM_VALUE.IMG_HEIGHT { MODELPARAM_VALUE.IMG_HEIGHT PARAM_VALUE.IMG_HEIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IMG_HEIGHT}] ${MODELPARAM_VALUE.IMG_HEIGHT}
}

