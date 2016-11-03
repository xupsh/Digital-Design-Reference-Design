
################################################################
# This is a generated script based on design: Comparator
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
# source Comparator_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name Comparator

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
  set A3 [ create_bd_port -dir I A3 ]
  set B0 [ create_bd_port -dir I B0 ]
  set B1 [ create_bd_port -dir I B1 ]
  set B2 [ create_bd_port -dir I B2 ]
  set B3 [ create_bd_port -dir I B3 ]
  set Ieq [ create_bd_port -dir I Ieq ]
  set Igt [ create_bd_port -dir I Igt ]
  set Ilt [ create_bd_port -dir I Ilt ]
  set Oeq [ create_bd_port -dir O Oeq ]
  set Ogt [ create_bd_port -dir O Ogt ]
  set Olt [ create_bd_port -dir O Olt ]

  # Create instance: magnitude_comparator_4bits_0, and set properties
  set magnitude_comparator_4bits_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:magnitude_comparator_4bits:1.0 magnitude_comparator_4bits_0 ]

  # Create port connections
  connect_bd_net -net A0_1 [get_bd_ports A0] [get_bd_pins magnitude_comparator_4bits_0/A0]
  connect_bd_net -net A1_1 [get_bd_ports A1] [get_bd_pins magnitude_comparator_4bits_0/A1]
  connect_bd_net -net A2_1 [get_bd_ports A2] [get_bd_pins magnitude_comparator_4bits_0/A2]
  connect_bd_net -net A3_1 [get_bd_ports A3] [get_bd_pins magnitude_comparator_4bits_0/A3]
  connect_bd_net -net B0_1 [get_bd_ports B0] [get_bd_pins magnitude_comparator_4bits_0/B0]
  connect_bd_net -net B1_1 [get_bd_ports B1] [get_bd_pins magnitude_comparator_4bits_0/B1]
  connect_bd_net -net B2_1 [get_bd_ports B2] [get_bd_pins magnitude_comparator_4bits_0/B2]
  connect_bd_net -net B3_1 [get_bd_ports B3] [get_bd_pins magnitude_comparator_4bits_0/B3]
  connect_bd_net -net Ieq_1 [get_bd_ports Ieq] [get_bd_pins magnitude_comparator_4bits_0/Ieq]
  connect_bd_net -net Igt_1 [get_bd_ports Igt] [get_bd_pins magnitude_comparator_4bits_0/Igt]
  connect_bd_net -net Ilt_1 [get_bd_ports Ilt] [get_bd_pins magnitude_comparator_4bits_0/Ilt]
  connect_bd_net -net magnitude_comparator_4bits_0_Oeq [get_bd_ports Oeq] [get_bd_pins magnitude_comparator_4bits_0/Oeq]
  connect_bd_net -net magnitude_comparator_4bits_0_Ogt [get_bd_ports Ogt] [get_bd_pins magnitude_comparator_4bits_0/Ogt]
  connect_bd_net -net magnitude_comparator_4bits_0_Olt [get_bd_ports Olt] [get_bd_pins magnitude_comparator_4bits_0/Olt]

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

