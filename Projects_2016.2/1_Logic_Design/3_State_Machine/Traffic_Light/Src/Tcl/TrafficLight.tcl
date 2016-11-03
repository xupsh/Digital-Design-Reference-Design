
################################################################
# This is a generated script based on design: TrafficLight
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
# source TrafficLight_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name TrafficLight

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
  set GND [ create_bd_port -dir I GND ]
  set ans [ create_bd_port -dir O -from 3 -to 0 ans ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set dp [ create_bd_port -dir O dp ]
  set reset [ create_bd_port -dir I reset ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]
  set tf0 [ create_bd_port -dir O -from 2 -to 0 tf0 ]
  set tf1 [ create_bd_port -dir O -from 2 -to 0 tf1 ]

  # Create instance: bin2bcd_8bits_0, and set properties
  set bin2bcd_8bits_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:bin2bcd_8bits:1.0 bin2bcd_8bits_0 ]

  # Create instance: seg7decimal_0, and set properties
  set seg7decimal_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:seg7decimal:1.0 seg7decimal_0 ]

  # Create instance: trafficLights_controller_0, and set properties
  set trafficLights_controller_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:trafficLights_controller:1.0 trafficLights_controller_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {10} \
CONFIG.IN1_WIDTH {1} \
CONFIG.NUM_PORTS {7} \
 ] $xlconcat_0

  # Create port connections
  connect_bd_net -net GND_1 [get_bd_ports GND] [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconcat_0/In3] [get_bd_pins xlconcat_0/In4] [get_bd_pins xlconcat_0/In5] [get_bd_pins xlconcat_0/In6]
  connect_bd_net -net bin2bcd_8bits_0_bcd [get_bd_pins bin2bcd_8bits_0/bcd] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins seg7decimal_0/clk] [get_bd_pins trafficLights_controller_0/tclk]
  connect_bd_net -net clr_1 [get_bd_ports reset] [get_bd_pins seg7decimal_0/clr] [get_bd_pins trafficLights_controller_0/rst]
  connect_bd_net -net seg7decimal_0_a_to_g [get_bd_ports seg] [get_bd_pins seg7decimal_0/a_to_g]
  connect_bd_net -net seg7decimal_0_an [get_bd_ports ans] [get_bd_pins seg7decimal_0/an]
  connect_bd_net -net seg7decimal_0_dp [get_bd_ports dp] [get_bd_pins seg7decimal_0/dp]
  connect_bd_net -net trafficLights_controller_0_count [get_bd_pins bin2bcd_8bits_0/bin] [get_bd_pins trafficLights_controller_0/count]
  connect_bd_net -net trafficLights_controller_0_tf0 [get_bd_ports tf0] [get_bd_pins trafficLights_controller_0/tf0]
  connect_bd_net -net trafficLights_controller_0_tf1 [get_bd_ports tf1] [get_bd_pins trafficLights_controller_0/tf1]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins seg7decimal_0/x] [get_bd_pins xlconcat_0/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port GND -pg 1 -y 230 -defaultsOSRD
preplace port dp -pg 1 -y 80 -defaultsOSRD
preplace port clk -pg 1 -y 60 -defaultsOSRD
preplace port reset -pg 1 -y 80 -defaultsOSRD
preplace portBus tf0 -pg 1 -y 180 -defaultsOSRD
preplace portBus tf1 -pg 1 -y 200 -defaultsOSRD
preplace portBus ans -pg 1 -y 60 -defaultsOSRD
preplace portBus seg -pg 1 -y 40 -defaultsOSRD
preplace inst trafficLights_controller_0 -pg 1 -lvl 3 -y 200 -defaultsOSRD
preplace inst seg7decimal_0 -pg 1 -lvl 3 -y 60 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 2 -y 240 -defaultsOSRD
preplace inst bin2bcd_8bits_0 -pg 1 -lvl 1 -y 180 -defaultsOSRD
preplace netloc clr_1 1 0 3 NJ 80 NJ 80 380
preplace netloc seg7decimal_0_a_to_g 1 3 1 NJ
preplace netloc trafficLights_controller_0_count 1 0 4 20 130 NJ 130 NJ 130 590
preplace netloc bin2bcd_8bits_0_bcd 1 1 1 NJ
preplace netloc seg7decimal_0_an 1 3 1 NJ
preplace netloc GND_1 1 0 2 NJ 230 190
preplace netloc seg7decimal_0_dp 1 3 1 NJ
preplace netloc xlconcat_0_dout 1 2 1 390
preplace netloc clk_1 1 0 3 NJ 60 NJ 60 400
preplace netloc trafficLights_controller_0_tf0 1 3 1 NJ
preplace netloc trafficLights_controller_0_tf1 1 3 1 NJ
levelinfo -pg 1 0 110 290 500 620 -top 0 -bot 350
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

create_root_design ""


common::send_msg_id "BD_TCL-1000" "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

