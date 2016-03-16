
################################################################
# This is a generated script based on design: shifter
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
# source shifter_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1


# CHANGE DESIGN NAME HERE
set design_name shifter

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
  set MR_n [ create_bd_port -dir I MR_n ]
  set Q0 [ create_bd_port -dir O Q0 ]
  set Q1 [ create_bd_port -dir O Q1 ]
  set Q2 [ create_bd_port -dir O Q2 ]
  set Q3 [ create_bd_port -dir O Q3 ]
  set Q4 [ create_bd_port -dir O Q4 ]
  set Q5 [ create_bd_port -dir O Q5 ]
  set Q6 [ create_bd_port -dir O Q6 ]
  set Q7 [ create_bd_port -dir O Q7 ]
  set clk_in [ create_bd_port -dir I clk_in ]
  set din [ create_bd_port -dir I din ]

  # Create instance: clk_div_0, and set properties
  set clk_div_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_0 ]
  set_property -dict [ list CONFIG.N {99999999}  ] $clk_div_0

  # Create instance: shift_register_8bit_0, and set properties
  set shift_register_8bit_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:shift_register_8bit:1.0 shift_register_8bit_0 ]

  # Create port connections
  connect_bd_net -net DSA_1 [get_bd_ports din] [get_bd_pins shift_register_8bit_0/DSA] [get_bd_pins shift_register_8bit_0/DSB]
  connect_bd_net -net MR_n_1 [get_bd_ports MR_n] [get_bd_pins shift_register_8bit_0/MR_n]
  connect_bd_net -net clk_div_0_clk_out [get_bd_pins clk_div_0/clk_out] [get_bd_pins shift_register_8bit_0/CP]
  connect_bd_net -net clk_in_1 [get_bd_ports clk_in] [get_bd_pins clk_div_0/clk_in]
  connect_bd_net -net shift_register_8bit_0_Q0 [get_bd_ports Q0] [get_bd_pins shift_register_8bit_0/Q0]
  connect_bd_net -net shift_register_8bit_0_Q1 [get_bd_ports Q1] [get_bd_pins shift_register_8bit_0/Q1]
  connect_bd_net -net shift_register_8bit_0_Q2 [get_bd_ports Q2] [get_bd_pins shift_register_8bit_0/Q2]
  connect_bd_net -net shift_register_8bit_0_Q3 [get_bd_ports Q3] [get_bd_pins shift_register_8bit_0/Q3]
  connect_bd_net -net shift_register_8bit_0_Q4 [get_bd_ports Q4] [get_bd_pins shift_register_8bit_0/Q4]
  connect_bd_net -net shift_register_8bit_0_Q5 [get_bd_ports Q5] [get_bd_pins shift_register_8bit_0/Q5]
  connect_bd_net -net shift_register_8bit_0_Q6 [get_bd_ports Q6] [get_bd_pins shift_register_8bit_0/Q6]
  connect_bd_net -net shift_register_8bit_0_Q7 [get_bd_ports Q7] [get_bd_pins shift_register_8bit_0/Q7]

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


