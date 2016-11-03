
################################################################
# This is a generated script based on design: Priority_Encoder
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
# source Priority_Encoder_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1


# CHANGE DESIGN NAME HERE
set design_name Priority_Encoder

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
  set EI [ create_bd_port -dir I EI ]
  set EO [ create_bd_port -dir O EO ]
  set GS [ create_bd_port -dir O GS ]
  set I0 [ create_bd_port -dir I I0 ]
  set I1 [ create_bd_port -dir I I1 ]
  set I2 [ create_bd_port -dir I I2 ]
  set I3 [ create_bd_port -dir I I3 ]
  set I4 [ create_bd_port -dir I I4 ]
  set I5 [ create_bd_port -dir I I5 ]
  set I6 [ create_bd_port -dir I I6 ]
  set I7 [ create_bd_port -dir I I7 ]
  set Qa [ create_bd_port -dir O Qa ]
  set Qb [ create_bd_port -dir O Qb ]
  set Qc [ create_bd_port -dir O Qc ]

  # Create instance: encoder_8_to_3_0, and set properties
  set encoder_8_to_3_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:encoder_8_to_3:1.0 encoder_8_to_3_0 ]

  # Create port connections
  connect_bd_net -net EI_1 [get_bd_ports EI] [get_bd_pins encoder_8_to_3_0/EI]
  connect_bd_net -net I0_1 [get_bd_ports I0] [get_bd_pins encoder_8_to_3_0/I0]
  connect_bd_net -net I1_1 [get_bd_ports I1] [get_bd_pins encoder_8_to_3_0/I1]
  connect_bd_net -net I2_1 [get_bd_ports I2] [get_bd_pins encoder_8_to_3_0/I2]
  connect_bd_net -net I3_1 [get_bd_ports I3] [get_bd_pins encoder_8_to_3_0/I3]
  connect_bd_net -net I4_1 [get_bd_ports I4] [get_bd_pins encoder_8_to_3_0/I4]
  connect_bd_net -net I5_1 [get_bd_ports I5] [get_bd_pins encoder_8_to_3_0/I5]
  connect_bd_net -net I6_1 [get_bd_ports I6] [get_bd_pins encoder_8_to_3_0/I6]
  connect_bd_net -net I7_1 [get_bd_ports I7] [get_bd_pins encoder_8_to_3_0/I7]
  connect_bd_net -net encoder_8_to_3_0_EO [get_bd_ports EO] [get_bd_pins encoder_8_to_3_0/EO]
  connect_bd_net -net encoder_8_to_3_0_GS [get_bd_ports GS] [get_bd_pins encoder_8_to_3_0/GS]
  connect_bd_net -net encoder_8_to_3_0_Qa [get_bd_ports Qa] [get_bd_pins encoder_8_to_3_0/Qa]
  connect_bd_net -net encoder_8_to_3_0_Qb [get_bd_ports Qb] [get_bd_pins encoder_8_to_3_0/Qb]
  connect_bd_net -net encoder_8_to_3_0_Qc [get_bd_ports Qc] [get_bd_pins encoder_8_to_3_0/Qc]

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


