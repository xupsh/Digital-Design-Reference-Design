
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set OV7725_D [ create_bd_port -dir I -from 7 -to 0 OV7725_D ]
  set OV7725_HREF [ create_bd_port -dir I OV7725_HREF ]
  set OV7725_PCLK [ create_bd_port -dir I OV7725_PCLK ]
  set OV7725_SIOC [ create_bd_port -dir O OV7725_SIOC ]
  set OV7725_SIOD [ create_bd_port -dir IO OV7725_SIOD ]
  set OV7725_VSYNC [ create_bd_port -dir I OV7725_VSYNC ]
  set OV7725_XCLK [ create_bd_port -dir O -type clk OV7725_XCLK ]
  set clk100 [ create_bd_port -dir I -type clk clk100 ]
  set rst [ create_bd_port -dir I rst ]
  set vga_blue [ create_bd_port -dir O -from 3 -to 0 vga_blue ]
  set vga_green [ create_bd_port -dir O -from 3 -to 0 vga_green ]
  set vga_hsync [ create_bd_port -dir O vga_hsync ]
  set vga_red [ create_bd_port -dir O -from 3 -to 0 vga_red ]
  set vga_vsync [ create_bd_port -dir O vga_vsync ]

  # Create instance: IICctrl_0, and set properties
  set IICctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:IICctrl:1.0 IICctrl_0 ]

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.2 blk_mem_gen_0 ]
  set_property -dict [ list \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_A {Always_Enabled} \
CONFIG.Enable_B {Always_Enabled} \
CONFIG.MEM_FILE {NONE} \
CONFIG.Memory_Type {Simple_Dual_Port_RAM} \
CONFIG.Operating_Mode_A {NO_CHANGE} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Read_Width_B {16} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Write_Depth_A {76800} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MEM_FILE.VALUE_SRC {DEFAULT} \
CONFIG.Register_PortA_Output_of_Memory_Primitives.VALUE_SRC {DEFAULT} \
 ] $blk_mem_gen_0

  # Create instance: cam_ov7670_ov7725_0, and set properties
  set cam_ov7670_ov7725_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:cam_ov7670_ov7725:1.0 cam_ov7670_ov7725_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CALC_DONE {empty} \
CONFIG.CDDCDONE_PORT {cddcdone} \
CONFIG.CDDCREQ_PORT {cddcreq} \
CONFIG.CLKFB_IN_N_PORT {clkfb_in_n} \
CONFIG.CLKFB_IN_PORT {clkfb_in} \
CONFIG.CLKFB_IN_P_PORT {clkfb_in_p} \
CONFIG.CLKFB_IN_SIGNALING {SINGLE} \
CONFIG.CLKFB_OUT_N_PORT {clkfb_out_n} \
CONFIG.CLKFB_OUT_PORT {clkfb_out} \
CONFIG.CLKFB_OUT_P_PORT {clkfb_out_p} \
CONFIG.CLKFB_STOPPED_PORT {clkfb_stopped} \
CONFIG.CLKIN1_JITTER_PS {100.0} \
CONFIG.CLKIN1_UI_JITTER {0.010} \
CONFIG.CLKIN2_JITTER_PS {100.0} \
CONFIG.CLKIN2_UI_JITTER {0.010} \
CONFIG.CLKOUT1_DRIVES {BUFG} \
CONFIG.CLKOUT1_JITTER {130.958} \
CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
CONFIG.CLKOUT1_REQUESTED_DUTY_CYCLE {50.000} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT1_REQUESTED_PHASE {0.000} \
CONFIG.CLKOUT1_SEQUENCE_NUMBER {1} \
CONFIG.CLKOUT1_USED {true} \
CONFIG.CLKOUT2_DRIVES {BUFG} \
CONFIG.CLKOUT2_JITTER {175.402} \
CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
CONFIG.CLKOUT2_REQUESTED_DUTY_CYCLE {50.000} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25.000} \
CONFIG.CLKOUT2_REQUESTED_PHASE {0.000} \
CONFIG.CLKOUT2_SEQUENCE_NUMBER {1} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_DRIVES {BUFG} \
CONFIG.CLKOUT3_JITTER {0.0} \
CONFIG.CLKOUT3_PHASE_ERROR {0.0} \
CONFIG.CLKOUT3_REQUESTED_DUTY_CYCLE {50.000} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT3_REQUESTED_PHASE {0.000} \
CONFIG.CLKOUT3_SEQUENCE_NUMBER {1} \
CONFIG.CLKOUT3_USED {false} \
CONFIG.CLKOUT4_DRIVES {BUFG} \
CONFIG.CLKOUT4_JITTER {0.0} \
CONFIG.CLKOUT4_PHASE_ERROR {0.0} \
CONFIG.CLKOUT4_REQUESTED_DUTY_CYCLE {50.000} \
CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT4_REQUESTED_PHASE {0.000} \
CONFIG.CLKOUT4_SEQUENCE_NUMBER {1} \
CONFIG.CLKOUT4_USED {false} \
CONFIG.CLKOUT5_DRIVES {BUFG} \
CONFIG.CLKOUT5_JITTER {0.0} \
CONFIG.CLKOUT5_PHASE_ERROR {0.0} \
CONFIG.CLKOUT5_REQUESTED_DUTY_CYCLE {50.000} \
CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT5_REQUESTED_PHASE {0.000} \
CONFIG.CLKOUT5_SEQUENCE_NUMBER {1} \
CONFIG.CLKOUT5_USED {false} \
CONFIG.CLKOUT6_DRIVES {BUFG} \
CONFIG.CLKOUT6_JITTER {0.0} \
CONFIG.CLKOUT6_PHASE_ERROR {0.0} \
CONFIG.CLKOUT6_REQUESTED_DUTY_CYCLE {50.000} \
CONFIG.CLKOUT6_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT6_REQUESTED_PHASE {0.000} \
CONFIG.CLKOUT6_SEQUENCE_NUMBER {1} \
CONFIG.CLKOUT6_USED {false} \
CONFIG.CLKOUT7_DRIVES {BUFG} \
CONFIG.CLKOUT7_JITTER {0.0} \
CONFIG.CLKOUT7_PHASE_ERROR {0.0} \
CONFIG.CLKOUT7_REQUESTED_DUTY_CYCLE {50.000} \
CONFIG.CLKOUT7_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT7_REQUESTED_PHASE {0.000} \
CONFIG.CLKOUT7_SEQUENCE_NUMBER {1} \
CONFIG.CLKOUT7_USED {false} \
CONFIG.CLKOUTPHY_REQUESTED_FREQ {600.000} \
CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
CONFIG.CLK_IN2_BOARD_INTERFACE {Custom} \
CONFIG.CLK_IN_SEL_PORT {clk_in_sel} \
CONFIG.CLK_OUT1_PORT {clk_out1} \
CONFIG.CLK_OUT1_USE_FINE_PS_GUI {false} \
CONFIG.CLK_OUT2_PORT {clk_out2} \
CONFIG.CLK_OUT2_USE_FINE_PS_GUI {false} \
CONFIG.CLK_OUT3_PORT {clk_out3} \
CONFIG.CLK_OUT3_USE_FINE_PS_GUI {false} \
CONFIG.CLK_OUT4_PORT {clk_out4} \
CONFIG.CLK_OUT4_USE_FINE_PS_GUI {false} \
CONFIG.CLK_OUT5_PORT {clk_out5} \
CONFIG.CLK_OUT5_USE_FINE_PS_GUI {false} \
CONFIG.CLK_OUT6_PORT {clk_out6} \
CONFIG.CLK_OUT6_USE_FINE_PS_GUI {false} \
CONFIG.CLK_OUT7_PORT {clk_out7} \
CONFIG.CLK_OUT7_USE_FINE_PS_GUI {false} \
CONFIG.CLK_VALID_PORT {CLK_VALID} \
CONFIG.CLOCK_MGR_TYPE {auto} \
CONFIG.DADDR_PORT {daddr} \
CONFIG.DCLK_PORT {dclk} \
CONFIG.DEN_PORT {den} \
CONFIG.DIFF_CLK_IN1_BOARD_INTERFACE {Custom} \
CONFIG.DIFF_CLK_IN2_BOARD_INTERFACE {Custom} \
CONFIG.DIN_PORT {din} \
CONFIG.DOUT_PORT {dout} \
CONFIG.DRDY_PORT {drdy} \
CONFIG.DWE_PORT {dwe} \
CONFIG.ENABLE_CDDC {false} \
CONFIG.ENABLE_CLKOUTPHY {false} \
CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
CONFIG.INPUT_CLK_STOPPED_PORT {input_clk_stopped} \
CONFIG.INTERFACE_SELECTION {Enable_AXI} \
CONFIG.IN_FREQ_UNITS {Units_MHz} \
CONFIG.IN_JITTER_UNITS {Units_UI} \
CONFIG.JITTER_OPTIONS {UI} \
CONFIG.JITTER_SEL {No_Jitter} \
CONFIG.LOCKED_PORT {locked} \
CONFIG.MMCM_BANDWIDTH {OPTIMIZED} \
CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
CONFIG.MMCM_CLKFBOUT_PHASE {0.000} \
CONFIG.MMCM_CLKFBOUT_USE_FINE_PS {false} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.500} \
CONFIG.MMCM_CLKOUT0_PHASE {0.000} \
CONFIG.MMCM_CLKOUT0_USE_FINE_PS {false} \
CONFIG.MMCM_CLKOUT1_DIVIDE {40} \
CONFIG.MMCM_CLKOUT1_DUTY_CYCLE {0.500} \
CONFIG.MMCM_CLKOUT1_PHASE {0.000} \
CONFIG.MMCM_CLKOUT1_USE_FINE_PS {false} \
CONFIG.MMCM_CLKOUT2_DIVIDE {1} \
CONFIG.MMCM_CLKOUT2_DUTY_CYCLE {0.500} \
CONFIG.MMCM_CLKOUT2_PHASE {0.000} \
CONFIG.MMCM_CLKOUT2_USE_FINE_PS {false} \
CONFIG.MMCM_CLKOUT3_DIVIDE {1} \
CONFIG.MMCM_CLKOUT3_DUTY_CYCLE {0.500} \
CONFIG.MMCM_CLKOUT3_PHASE {0.000} \
CONFIG.MMCM_CLKOUT3_USE_FINE_PS {false} \
CONFIG.MMCM_CLKOUT4_CASCADE {false} \
CONFIG.MMCM_CLKOUT4_DIVIDE {1} \
CONFIG.MMCM_CLKOUT4_DUTY_CYCLE {0.500} \
CONFIG.MMCM_CLKOUT4_PHASE {0.000} \
CONFIG.MMCM_CLKOUT4_USE_FINE_PS {false} \
CONFIG.MMCM_CLKOUT5_DIVIDE {1} \
CONFIG.MMCM_CLKOUT5_DUTY_CYCLE {0.500} \
CONFIG.MMCM_CLKOUT5_PHASE {0.000} \
CONFIG.MMCM_CLKOUT5_USE_FINE_PS {false} \
CONFIG.MMCM_CLKOUT6_DIVIDE {1} \
CONFIG.MMCM_CLKOUT6_DUTY_CYCLE {0.500} \
CONFIG.MMCM_CLKOUT6_PHASE {0.000} \
CONFIG.MMCM_CLKOUT6_USE_FINE_PS {false} \
CONFIG.MMCM_CLOCK_HOLD {false} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.MMCM_NOTES {None} \
CONFIG.MMCM_REF_JITTER1 {0.010} \
CONFIG.MMCM_REF_JITTER2 {0.010} \
CONFIG.MMCM_STARTUP_WAIT {false} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.OVERRIDE_MMCM {false} \
CONFIG.OVERRIDE_PLL {false} \
CONFIG.PHASE_DUTY_CONFIG {false} \
CONFIG.PLATFORM {UNKNOWN} \
CONFIG.PLL_BANDWIDTH {OPTIMIZED} \
CONFIG.PLL_CLKFBOUT_MULT {4} \
CONFIG.PLL_CLKFBOUT_PHASE {0.000} \
CONFIG.PLL_CLKIN_PERIOD {10.000} \
CONFIG.PLL_CLKOUT0_DIVIDE {1} \
CONFIG.PLL_CLKOUT0_DUTY_CYCLE {0.500} \
CONFIG.PLL_CLKOUT0_PHASE {0.000} \
CONFIG.PLL_CLKOUT1_DIVIDE {1} \
CONFIG.PLL_CLKOUT1_DUTY_CYCLE {0.500} \
CONFIG.PLL_CLKOUT1_PHASE {0.000} \
CONFIG.PLL_CLKOUT2_DIVIDE {1} \
CONFIG.PLL_CLKOUT2_DUTY_CYCLE {0.500} \
CONFIG.PLL_CLKOUT2_PHASE {0.000} \
CONFIG.PLL_CLKOUT3_DIVIDE {1} \
CONFIG.PLL_CLKOUT3_DUTY_CYCLE {0.500} \
CONFIG.PLL_CLKOUT3_PHASE {0.000} \
CONFIG.PLL_CLKOUT4_DIVIDE {1} \
CONFIG.PLL_CLKOUT4_DUTY_CYCLE {0.500} \
CONFIG.PLL_CLKOUT4_PHASE {0.000} \
CONFIG.PLL_CLKOUT5_DIVIDE {1} \
CONFIG.PLL_CLKOUT5_DUTY_CYCLE {0.500} \
CONFIG.PLL_CLKOUT5_PHASE {0.000} \
CONFIG.PLL_CLK_FEEDBACK {CLKFBOUT} \
CONFIG.PLL_COMPENSATION {SYSTEM_SYNCHRONOUS} \
CONFIG.PLL_DIVCLK_DIVIDE {1} \
CONFIG.PLL_NOTES {None} \
CONFIG.PLL_REF_JITTER {0.010} \
CONFIG.POWER_DOWN_PORT {power_down} \
CONFIG.PRIMARY_PORT {clk_in1} \
CONFIG.PRIMITIVE {MMCM} \
CONFIG.PRIMTYPE_SEL {mmcm_adv} \
CONFIG.PRIM_IN_FREQ {100.000} \
CONFIG.PRIM_IN_JITTER {0.010} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.PSCLK_PORT {psclk} \
CONFIG.PSDONE_PORT {psdone} \
CONFIG.PSEN_PORT {psen} \
CONFIG.PSINCDEC_PORT {psincdec} \
CONFIG.RELATIVE_INCLK {REL_PRIMARY} \
CONFIG.RESET_BOARD_INTERFACE {Custom} \
CONFIG.RESET_PORT {reset} \
CONFIG.RESET_TYPE {ACTIVE_HIGH} \
CONFIG.SECONDARY_IN_FREQ {100.000} \
CONFIG.SECONDARY_IN_JITTER {0.010} \
CONFIG.SECONDARY_PORT {clk_in2} \
CONFIG.SECONDARY_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.SS_MODE {CENTER_HIGH} \
CONFIG.SS_MOD_FREQ {250} \
CONFIG.STATUS_PORT {STATUS} \
CONFIG.SUMMARY_STRINGS {empty} \
CONFIG.USE_BOARD_FLOW {false} \
CONFIG.USE_CLKFB_STOPPED {false} \
CONFIG.USE_CLK_VALID {false} \
CONFIG.USE_CLOCK_SEQUENCING {false} \
CONFIG.USE_DYN_PHASE_SHIFT {false} \
CONFIG.USE_DYN_RECONFIG {false} \
CONFIG.USE_FREEZE {false} \
CONFIG.USE_FREQ_SYNTH {true} \
CONFIG.USE_INCLK_STOPPED {false} \
CONFIG.USE_INCLK_SWITCHOVER {false} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_MAX_I_JITTER {false} \
CONFIG.USE_MIN_O_JITTER {false} \
CONFIG.USE_MIN_POWER {false} \
CONFIG.USE_PHASE_ALIGNMENT {true} \
CONFIG.USE_POWER_DOWN {false} \
CONFIG.USE_RESET {false} \
CONFIG.USE_SAFE_CLOCK_STARTUP {false} \
CONFIG.USE_SPREAD_SPECTRUM {false} \
CONFIG.USE_STATUS {false} \
 ] $clk_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CALC_DONE.VALUE_SRC {DEFAULT} \
CONFIG.CDDCDONE_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CDDCREQ_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_IN_N_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_IN_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_IN_P_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_IN_SIGNALING.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_OUT_N_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_OUT_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_OUT_P_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKFB_STOPPED_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLKIN1_JITTER_PS.VALUE_SRC {DEFAULT} \
CONFIG.CLKIN1_UI_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKIN2_JITTER_PS.VALUE_SRC {DEFAULT} \
CONFIG.CLKIN2_UI_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_REQUESTED_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_SEQUENCE_NUMBER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_USED.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_REQUESTED_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT2_SEQUENCE_NUMBER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_REQUESTED_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_SEQUENCE_NUMBER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT3_USED.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_REQUESTED_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_SEQUENCE_NUMBER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_USED.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_REQUESTED_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_SEQUENCE_NUMBER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_USED.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_REQUESTED_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_SEQUENCE_NUMBER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_USED.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_REQUESTED_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_REQUESTED_OUT_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_SEQUENCE_NUMBER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_USED.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUTPHY_REQUESTED_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.CLK_IN1_BOARD_INTERFACE.VALUE_SRC {DEFAULT} \
CONFIG.CLK_IN2_BOARD_INTERFACE.VALUE_SRC {DEFAULT} \
CONFIG.CLK_IN_SEL_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT1_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT1_USE_FINE_PS_GUI.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT2_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT2_USE_FINE_PS_GUI.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT3_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT3_USE_FINE_PS_GUI.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT4_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT4_USE_FINE_PS_GUI.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT5_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT5_USE_FINE_PS_GUI.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT6_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT6_USE_FINE_PS_GUI.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT7_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLK_OUT7_USE_FINE_PS_GUI.VALUE_SRC {DEFAULT} \
CONFIG.CLK_VALID_PORT.VALUE_SRC {DEFAULT} \
CONFIG.CLOCK_MGR_TYPE.VALUE_SRC {DEFAULT} \
CONFIG.DADDR_PORT.VALUE_SRC {DEFAULT} \
CONFIG.DCLK_PORT.VALUE_SRC {DEFAULT} \
CONFIG.DEN_PORT.VALUE_SRC {DEFAULT} \
CONFIG.DIFF_CLK_IN1_BOARD_INTERFACE.VALUE_SRC {DEFAULT} \
CONFIG.DIFF_CLK_IN2_BOARD_INTERFACE.VALUE_SRC {DEFAULT} \
CONFIG.DIN_PORT.VALUE_SRC {DEFAULT} \
CONFIG.DOUT_PORT.VALUE_SRC {DEFAULT} \
CONFIG.DRDY_PORT.VALUE_SRC {DEFAULT} \
CONFIG.DWE_PORT.VALUE_SRC {DEFAULT} \
CONFIG.ENABLE_CDDC.VALUE_SRC {DEFAULT} \
CONFIG.ENABLE_CLKOUTPHY.VALUE_SRC {DEFAULT} \
CONFIG.FEEDBACK_SOURCE.VALUE_SRC {DEFAULT} \
CONFIG.INPUT_CLK_STOPPED_PORT.VALUE_SRC {DEFAULT} \
CONFIG.INTERFACE_SELECTION.VALUE_SRC {DEFAULT} \
CONFIG.IN_FREQ_UNITS.VALUE_SRC {DEFAULT} \
CONFIG.IN_JITTER_UNITS.VALUE_SRC {DEFAULT} \
CONFIG.JITTER_OPTIONS.VALUE_SRC {DEFAULT} \
CONFIG.JITTER_SEL.VALUE_SRC {DEFAULT} \
CONFIG.LOCKED_PORT.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_BANDWIDTH.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT2_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT2_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT2_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT2_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT3_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT3_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT3_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT3_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT4_CASCADE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT4_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT4_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT4_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT4_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT5_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT5_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT5_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT5_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT6_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT6_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT6_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT6_USE_FINE_PS.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLOCK_HOLD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_DIVCLK_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_NOTES.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_REF_JITTER1.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_REF_JITTER2.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_STARTUP_WAIT.VALUE_SRC {DEFAULT} \
CONFIG.OVERRIDE_MMCM.VALUE_SRC {DEFAULT} \
CONFIG.OVERRIDE_PLL.VALUE_SRC {DEFAULT} \
CONFIG.PHASE_DUTY_CONFIG.VALUE_SRC {DEFAULT} \
CONFIG.PLATFORM.VALUE_SRC {DEFAULT} \
CONFIG.PLL_BANDWIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKFBOUT_MULT.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKFBOUT_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKIN_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT0_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT0_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT0_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT1_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT1_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT1_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT2_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT2_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT2_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT3_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT3_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT3_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT4_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT4_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT4_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT5_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT5_DUTY_CYCLE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLKOUT5_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_CLK_FEEDBACK.VALUE_SRC {DEFAULT} \
CONFIG.PLL_COMPENSATION.VALUE_SRC {DEFAULT} \
CONFIG.PLL_DIVCLK_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.PLL_NOTES.VALUE_SRC {DEFAULT} \
CONFIG.PLL_REF_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.POWER_DOWN_PORT.VALUE_SRC {DEFAULT} \
CONFIG.PRIMARY_PORT.VALUE_SRC {DEFAULT} \
CONFIG.PRIMITIVE.VALUE_SRC {DEFAULT} \
CONFIG.PRIMTYPE_SEL.VALUE_SRC {DEFAULT} \
CONFIG.PRIM_IN_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.PRIM_IN_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.PRIM_SOURCE.VALUE_SRC {DEFAULT} \
CONFIG.PSCLK_PORT.VALUE_SRC {DEFAULT} \
CONFIG.PSDONE_PORT.VALUE_SRC {DEFAULT} \
CONFIG.PSEN_PORT.VALUE_SRC {DEFAULT} \
CONFIG.PSINCDEC_PORT.VALUE_SRC {DEFAULT} \
CONFIG.RELATIVE_INCLK.VALUE_SRC {DEFAULT} \
CONFIG.RESET_BOARD_INTERFACE.VALUE_SRC {DEFAULT} \
CONFIG.RESET_PORT.VALUE_SRC {DEFAULT} \
CONFIG.RESET_TYPE.VALUE_SRC {DEFAULT} \
CONFIG.SECONDARY_IN_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.SECONDARY_IN_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.SECONDARY_PORT.VALUE_SRC {DEFAULT} \
CONFIG.SECONDARY_SOURCE.VALUE_SRC {DEFAULT} \
CONFIG.SS_MODE.VALUE_SRC {DEFAULT} \
CONFIG.SS_MOD_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.STATUS_PORT.VALUE_SRC {DEFAULT} \
CONFIG.SUMMARY_STRINGS.VALUE_SRC {DEFAULT} \
CONFIG.USE_BOARD_FLOW.VALUE_SRC {DEFAULT} \
CONFIG.USE_CLKFB_STOPPED.VALUE_SRC {DEFAULT} \
CONFIG.USE_CLK_VALID.VALUE_SRC {DEFAULT} \
CONFIG.USE_CLOCK_SEQUENCING.VALUE_SRC {DEFAULT} \
CONFIG.USE_DYN_PHASE_SHIFT.VALUE_SRC {DEFAULT} \
CONFIG.USE_DYN_RECONFIG.VALUE_SRC {DEFAULT} \
CONFIG.USE_FREEZE.VALUE_SRC {DEFAULT} \
CONFIG.USE_FREQ_SYNTH.VALUE_SRC {DEFAULT} \
CONFIG.USE_INCLK_STOPPED.VALUE_SRC {DEFAULT} \
CONFIG.USE_INCLK_SWITCHOVER.VALUE_SRC {DEFAULT} \
CONFIG.USE_MAX_I_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.USE_MIN_O_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.USE_MIN_POWER.VALUE_SRC {DEFAULT} \
CONFIG.USE_PHASE_ALIGNMENT.VALUE_SRC {DEFAULT} \
CONFIG.USE_POWER_DOWN.VALUE_SRC {DEFAULT} \
CONFIG.USE_SAFE_CLOCK_STARTUP.VALUE_SRC {DEFAULT} \
CONFIG.USE_SPREAD_SPECTRUM.VALUE_SRC {DEFAULT} \
CONFIG.USE_STATUS.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_0

  # Create instance: debounce_0, and set properties
  set debounce_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:debounce:1.0 debounce_0 ]

  # Create instance: ov7725_regData_0, and set properties
  set ov7725_regData_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:ov7725_regData:1.0 ov7725_regData_0 ]

  # Create instance: ram_read_0, and set properties
  set ram_read_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:ram_read:1.0 ram_read_0 ]

  # Create instance: region_cut_0, and set properties
  set region_cut_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:region_cut:1.0 region_cut_0 ]

  # Create instance: rgb565_rgb888_0, and set properties
  set rgb565_rgb888_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:rgb565_rgb888:1.0 rgb565_rgb888_0 ]

  # Create instance: rgb888_rgb565_0, and set properties
  set rgb888_rgb565_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:rgb888_rgb565:1.0 rgb888_rgb565_0 ]

  # Create instance: sobel_0, and set properties
  set sobel_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:sobel:1.0 sobel_0 ]

  # Create instance: vga_0, and set properties
  set vga_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:vga:1.0 vga_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create port connections
  connect_bd_net -net IICctrl_0_I2C_SCLK [get_bd_ports OV7725_SIOC] [get_bd_pins IICctrl_0/I2C_SCLK]
  connect_bd_net -net IICctrl_0_LUT_INDEX [get_bd_pins IICctrl_0/LUT_INDEX] [get_bd_pins ov7725_regData_0/LUT_INDEX]
  connect_bd_net -net Net [get_bd_ports OV7725_SIOD] [get_bd_pins IICctrl_0/I2C_SDAT]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins blk_mem_gen_0/doutb] [get_bd_pins rgb565_rgb888_0/rgb565]
  connect_bd_net -net cam_ov7670_ov7725_0_addr [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins cam_ov7670_ov7725_0/addr]
  connect_bd_net -net cam_ov7670_ov7725_0_dout [get_bd_pins blk_mem_gen_0/dina] [get_bd_pins cam_ov7670_ov7725_0/dout]
  connect_bd_net -net cam_ov7670_ov7725_0_wclk [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins cam_ov7670_ov7725_0/wclk]
  connect_bd_net -net cam_ov7670_ov7725_0_we [get_bd_pins blk_mem_gen_0/wea] [get_bd_pins cam_ov7670_ov7725_0/we]
  connect_bd_net -net clk_in1_1 [get_bd_ports clk100] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins debounce_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_ports OV7725_XCLK] [get_bd_pins IICctrl_0/iCLK] [get_bd_pins blk_mem_gen_0/clkb] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins ram_read_0/clk] [get_bd_pins sobel_0/pclk] [get_bd_pins vga_0/vga_pclk]
  connect_bd_net -net d_1 [get_bd_ports OV7725_D] [get_bd_pins cam_ov7670_ov7725_0/d]
  connect_bd_net -net debounce_0_o [get_bd_pins IICctrl_0/rst] [get_bd_pins debounce_0/o] [get_bd_pins vga_0/vga_rst]
  connect_bd_net -net href_1 [get_bd_ports OV7725_HREF] [get_bd_pins cam_ov7670_ov7725_0/href]
  connect_bd_net -net i_1 [get_bd_ports rst] [get_bd_pins debounce_0/i]
  connect_bd_net -net ov7725_regData_0_LUT_DATA [get_bd_pins IICctrl_0/LUT_DATA] [get_bd_pins ov7725_regData_0/LUT_DATA]
  connect_bd_net -net ov7725_regData_0_Slave_Addr [get_bd_pins IICctrl_0/Slave_Addr] [get_bd_pins ov7725_regData_0/Slave_Addr]
  connect_bd_net -net pclk_1 [get_bd_ports OV7725_PCLK] [get_bd_pins cam_ov7670_ov7725_0/pclk]
  connect_bd_net -net ram_read_0_address [get_bd_pins blk_mem_gen_0/addrb] [get_bd_pins ram_read_0/address]
  connect_bd_net -net ram_read_0_vga_blue [get_bd_ports vga_blue] [get_bd_pins ram_read_0/vga_blue]
  connect_bd_net -net ram_read_0_vga_green [get_bd_ports vga_green] [get_bd_pins ram_read_0/vga_green]
  connect_bd_net -net ram_read_0_vga_red [get_bd_ports vga_red] [get_bd_pins ram_read_0/vga_red]
  connect_bd_net -net region_cut_0_valid_h_cnt [get_bd_pins region_cut_0/valid_h_cnt] [get_bd_pins sobel_0/h_cnt]
  connect_bd_net -net region_cut_0_valid_v_cnt [get_bd_pins region_cut_0/valid_v_cnt] [get_bd_pins sobel_0/v_cnt]
  connect_bd_net -net rgb565_rgb888_0_rgb888 [get_bd_pins rgb565_rgb888_0/rgb888] [get_bd_pins sobel_0/rgb]
  connect_bd_net -net rgb888_rgb565_0_rgb565 [get_bd_pins ram_read_0/din] [get_bd_pins rgb888_rgb565_0/rgb565]
  connect_bd_net -net sobel_0_sobel [get_bd_pins rgb888_rgb565_0/rgb888] [get_bd_pins sobel_0/sobel]
  connect_bd_net -net vga_0_vga_h_cnt [get_bd_pins ram_read_0/vga_h_cnt] [get_bd_pins region_cut_0/vga_h_cnt] [get_bd_pins vga_0/vga_h_cnt]
  connect_bd_net -net vga_0_vga_hsync [get_bd_ports vga_hsync] [get_bd_pins vga_0/vga_hsync]
  connect_bd_net -net vga_0_vga_v_cnt [get_bd_pins ram_read_0/vga_v_cnt] [get_bd_pins region_cut_0/vga_v_cnt] [get_bd_pins vga_0/vga_v_cnt]
  connect_bd_net -net vga_0_vga_valid [get_bd_pins ram_read_0/valid] [get_bd_pins vga_0/vga_valid]
  connect_bd_net -net vga_0_vga_vsync [get_bd_ports vga_vsync] [get_bd_pins vga_0/vga_vsync]
  connect_bd_net -net vsync_1 [get_bd_ports OV7725_VSYNC] [get_bd_pins cam_ov7670_ov7725_0/vsync]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins debounce_0/clr] [get_bd_pins xlconstant_0/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.4.10  2014-10-02 bk=1.3207 VDI=35 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port vga_hsync -pg 1 -y 120 -defaultsOSRD
preplace port OV7725_SIOC -pg 1 -y 20 -defaultsOSRD
preplace port OV7725_SIOD -pg 1 -y 40 -defaultsOSRD
preplace port OV7725_PCLK -pg 1 -y 60 -defaultsOSRD
preplace port clk100 -pg 1 -y 100 -defaultsOSRD
preplace port rst -pg 1 -y 120 -defaultsOSRD
preplace port OV7725_VSYNC -pg 1 -y 80 -defaultsOSRD
preplace port OV7725_XCLK -pg 1 -y 60 -defaultsOSRD
preplace port OV7725_HREF -pg 1 -y 40 -defaultsOSRD
preplace port vga_vsync -pg 1 -y 160 -defaultsOSRD
preplace portBus vga_green -pg 1 -y 100 -defaultsOSRD
preplace portBus vga_red -pg 1 -y 140 -defaultsOSRD
preplace portBus OV7725_D -pg 1 -y 20 -defaultsOSRD
preplace portBus vga_blue -pg 1 -y 80 -defaultsOSRD
preplace inst debounce_0 -pg 1 -lvl 1 -y 580 -defaultsOSRD
preplace inst blk_mem_gen_0 -pg 1 -lvl 1 -y 370 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -y 470 -defaultsOSRD
preplace inst IICctrl_0 -pg 1 -lvl 1 -y 70 -defaultsOSRD
preplace inst ram_read_0 -pg 1 -lvl 1 -y 820 -defaultsOSRD
preplace inst ov7725_regData_0 -pg 1 -lvl 1 -y 690 -defaultsOSRD
preplace inst cam_ov7670_ov7725_0 -pg 1 -lvl 1 -y 230 -defaultsOSRD
levelinfo -pg 1 130 290 450
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################


common::send_msg_id "BD_TCL-2000" "CRITICAL WARNING" "This Tcl script was generated from a block design that is out-of-date/locked. It is possible that design <$design_name> may result in errors during construction."

create_root_design ""


common::send_msg_id "BD_TCL-1000" "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

