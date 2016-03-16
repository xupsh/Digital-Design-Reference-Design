
################################################################
# This is a generated script based on design: bin_to_BCD
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source bin_to_BCD_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1


# CHANGE DESIGN NAME HERE
set design_name bin_to_BCD

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set A [ create_bd_port -dir I A ]
  set B [ create_bd_port -dir I B ]
  set C [ create_bd_port -dir I C ]
  set D [ create_bd_port -dir I D ]
  set E [ create_bd_port -dir I E ]
  set F [ create_bd_port -dir I F ]
  set G [ create_bd_port -dir I G ]
  set Y0 [ create_bd_port -dir O Y0 ]
  set Y1 [ create_bd_port -dir O Y1 ]
  set Y2 [ create_bd_port -dir O Y2 ]
  set Y3 [ create_bd_port -dir O Y3 ]
  set Y4 [ create_bd_port -dir O Y4 ]
  set Y5 [ create_bd_port -dir O Y5 ]
  set Y6 [ create_bd_port -dir O Y6 ]

  # Create instance: bin2BCD_0, and set properties
  set bin2BCD_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:bin2BCD:1.0 bin2BCD_0 ]

  # Create port connections
  connect_bd_net -net A_1 [get_bd_ports B] [get_bd_pins bin2BCD_0/A]
  connect_bd_net -net A_2 [get_bd_ports A] [get_bd_ports Y0]
  connect_bd_net -net B_1 [get_bd_ports C] [get_bd_pins bin2BCD_0/B]
  connect_bd_net -net C_1 [get_bd_ports D] [get_bd_pins bin2BCD_0/C]
  connect_bd_net -net D_1 [get_bd_ports E] [get_bd_pins bin2BCD_0/D]
  connect_bd_net -net E_1 [get_bd_ports F] [get_bd_pins bin2BCD_0/E]
  connect_bd_net -net G_1 [get_bd_ports G] [get_bd_pins bin2BCD_0/G]
  connect_bd_net -net bin2BCD_0_Y1 [get_bd_ports Y1] [get_bd_pins bin2BCD_0/Y1]
  connect_bd_net -net bin2BCD_0_Y2 [get_bd_ports Y2] [get_bd_pins bin2BCD_0/Y2]
  connect_bd_net -net bin2BCD_0_Y3 [get_bd_ports Y3] [get_bd_pins bin2BCD_0/Y3]
  connect_bd_net -net bin2BCD_0_Y4 [get_bd_ports Y4] [get_bd_pins bin2BCD_0/Y4]
  connect_bd_net -net bin2BCD_0_Y5 [get_bd_ports Y5] [get_bd_pins bin2BCD_0/Y5]
  connect_bd_net -net bin2BCD_0_Y6 [get_bd_ports Y6] [get_bd_pins bin2BCD_0/Y6]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


