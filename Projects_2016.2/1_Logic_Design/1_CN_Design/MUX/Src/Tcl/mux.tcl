
################################################################
# This is a generated script based on design: mux
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
# source mux_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name mux

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
  set A0 [ create_bd_port -dir I A0 ]
  set A1 [ create_bd_port -dir I A1 ]
  set A2 [ create_bd_port -dir I A2 ]
  set D0 [ create_bd_port -dir I D0 ]
  set D1 [ create_bd_port -dir I D1 ]
  set D2 [ create_bd_port -dir I D2 ]
  set D3 [ create_bd_port -dir I D3 ]
  set D4 [ create_bd_port -dir I D4 ]
  set D5 [ create_bd_port -dir I D5 ]
  set D6 [ create_bd_port -dir I D6 ]
  set D7 [ create_bd_port -dir I D7 ]
  set Q [ create_bd_port -dir O Q ]
  set Q_n [ create_bd_port -dir O Q_n ]
  set S_n [ create_bd_port -dir I S_n ]

  # Create instance: mux_8_to_1_0, and set properties
  set mux_8_to_1_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_0 ]

  # Create port connections
  connect_bd_net -net A0_1 [get_bd_ports A0] [get_bd_pins mux_8_to_1_0/A0]
  connect_bd_net -net A1_1 [get_bd_ports A1] [get_bd_pins mux_8_to_1_0/A1]
  connect_bd_net -net A2_1 [get_bd_ports A2] [get_bd_pins mux_8_to_1_0/A2]
  connect_bd_net -net D0_1 [get_bd_ports D0] [get_bd_pins mux_8_to_1_0/D0]
  connect_bd_net -net D1_1 [get_bd_ports D1] [get_bd_pins mux_8_to_1_0/D1]
  connect_bd_net -net D2_1 [get_bd_ports D2] [get_bd_pins mux_8_to_1_0/D2]
  connect_bd_net -net D3_1 [get_bd_ports D3] [get_bd_pins mux_8_to_1_0/D3]
  connect_bd_net -net D4_1 [get_bd_ports D4] [get_bd_pins mux_8_to_1_0/D4]
  connect_bd_net -net D5_1 [get_bd_ports D5] [get_bd_pins mux_8_to_1_0/D5]
  connect_bd_net -net D6_1 [get_bd_ports D6] [get_bd_pins mux_8_to_1_0/D6]
  connect_bd_net -net D7_1 [get_bd_ports D7] [get_bd_pins mux_8_to_1_0/D7]
  connect_bd_net -net S_n_1 [get_bd_ports S_n] [get_bd_pins mux_8_to_1_0/S_n]
  connect_bd_net -net mux_8_to_1_0_Q [get_bd_ports Q] [get_bd_pins mux_8_to_1_0/Q]
  connect_bd_net -net mux_8_to_1_0_Q_n [get_bd_ports Q_n] [get_bd_pins mux_8_to_1_0/Q_n]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.4.10  2014-10-02 bk=1.3207 VDI=35 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
levelinfo -pg 1 0 30
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

