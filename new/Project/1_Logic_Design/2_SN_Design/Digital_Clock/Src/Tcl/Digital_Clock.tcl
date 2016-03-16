
################################################################
# This is a generated script based on design: clock
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
# source clock_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1


# CHANGE DESIGN NAME HERE
set design_name clock

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
  set GND [ create_bd_port -dir I GND ]
  set an [ create_bd_port -dir O -from 3 -to 0 an ]
  set clk [ create_bd_port -dir I clk ]
  set clr [ create_bd_port -dir I clr ]
  set dp [ create_bd_port -dir O dp ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]

  # Create instance: clk_div_1, and set properties
  set clk_div_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_1 ]
  set_property -dict [ list CONFIG.N {99999999}  ] $clk_div_1

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT2_USED {true} CONFIG.PRIMITIVE {PLL} CONFIG.USE_LOCKED {false} CONFIG.USE_RESET {false}  ] $clk_wiz_0

  # Create instance: decimal_counter_0, and set properties
  set decimal_counter_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_0 ]

  # Create instance: decimal_counter_1, and set properties
  set decimal_counter_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_1 ]

  # Create instance: decimal_counter_2, and set properties
  set decimal_counter_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_2 ]

  # Create instance: decimal_counter_3, and set properties
  set decimal_counter_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_3 ]

  # Create instance: four_2_input_and_gate_0, and set properties
  set four_2_input_and_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_and_gate:1.0 four_2_input_and_gate_0 ]

  # Create instance: seg7decimal_0, and set properties
  set seg7decimal_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:seg7decimal:1.0 seg7decimal_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list CONFIG.NUM_PORTS {16}  ] $xlconcat_0

  # Create port connections
  connect_bd_net -net GND_1 [get_bd_ports GND] [get_bd_pins decimal_counter_0/R9_1] [get_bd_pins decimal_counter_0/R9_2] [get_bd_pins decimal_counter_1/R9_1] [get_bd_pins decimal_counter_1/R9_2] [get_bd_pins decimal_counter_2/R9_1] [get_bd_pins decimal_counter_2/R9_2] [get_bd_pins decimal_counter_3/R9_1] [get_bd_pins decimal_counter_3/R9_2] [get_bd_pins four_2_input_and_gate_0/A3] [get_bd_pins four_2_input_and_gate_0/A4] [get_bd_pins four_2_input_and_gate_0/B3] [get_bd_pins four_2_input_and_gate_0/B4]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_div_1_clk_out [get_bd_pins clk_div_1/clk_out] [get_bd_pins decimal_counter_0/CP1_n]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins seg7decimal_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins clk_div_1/clk_in] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clr_1 [get_bd_ports clr] [get_bd_pins seg7decimal_0/clr]
  connect_bd_net -net decimal_counter_0_Qa [get_bd_pins decimal_counter_0/CP2_n] [get_bd_pins decimal_counter_0/Qa] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net decimal_counter_0_Qb [get_bd_pins decimal_counter_0/Qb] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net decimal_counter_0_Qc [get_bd_pins decimal_counter_0/Qc] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net decimal_counter_0_Qd [get_bd_pins decimal_counter_0/Qd] [get_bd_pins decimal_counter_1/CP1_n] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net decimal_counter_1_Qa [get_bd_pins decimal_counter_1/CP2_n] [get_bd_pins decimal_counter_1/Qa] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net decimal_counter_1_Qb [get_bd_pins decimal_counter_1/Qb] [get_bd_pins four_2_input_and_gate_0/A1] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net decimal_counter_1_Qc [get_bd_pins decimal_counter_1/Qc] [get_bd_pins four_2_input_and_gate_0/B1] [get_bd_pins xlconcat_0/In6]
  connect_bd_net -net decimal_counter_1_Qd [get_bd_pins decimal_counter_1/Qd] [get_bd_pins xlconcat_0/In7]
  connect_bd_net -net decimal_counter_2_Qa [get_bd_pins decimal_counter_2/CP2_n] [get_bd_pins decimal_counter_2/Qa] [get_bd_pins xlconcat_0/In8]
  connect_bd_net -net decimal_counter_2_Qb [get_bd_pins decimal_counter_2/Qb] [get_bd_pins xlconcat_0/In9]
  connect_bd_net -net decimal_counter_2_Qc [get_bd_pins decimal_counter_2/Qc] [get_bd_pins xlconcat_0/In10]
  connect_bd_net -net decimal_counter_2_Qd [get_bd_pins decimal_counter_2/Qd] [get_bd_pins decimal_counter_3/CP1_n] [get_bd_pins xlconcat_0/In11]
  connect_bd_net -net decimal_counter_3_Qa [get_bd_pins decimal_counter_3/CP2_n] [get_bd_pins decimal_counter_3/Qa] [get_bd_pins xlconcat_0/In12]
  connect_bd_net -net decimal_counter_3_Qb [get_bd_pins decimal_counter_3/Qb] [get_bd_pins four_2_input_and_gate_0/A2] [get_bd_pins xlconcat_0/In13]
  connect_bd_net -net decimal_counter_3_Qc [get_bd_pins decimal_counter_3/Qc] [get_bd_pins four_2_input_and_gate_0/B2] [get_bd_pins xlconcat_0/In14]
  connect_bd_net -net decimal_counter_3_Qd [get_bd_pins decimal_counter_3/Qd] [get_bd_pins xlconcat_0/In15]
  connect_bd_net -net four_2_input_and_gate_0_Y1 [get_bd_pins decimal_counter_0/R0_1] [get_bd_pins decimal_counter_0/R0_2] [get_bd_pins decimal_counter_1/R0_1] [get_bd_pins decimal_counter_1/R0_2] [get_bd_pins decimal_counter_2/CP1_n] [get_bd_pins four_2_input_and_gate_0/Y1]
  connect_bd_net -net four_2_input_and_gate_0_Y2 [get_bd_pins decimal_counter_2/R0_1] [get_bd_pins decimal_counter_2/R0_2] [get_bd_pins decimal_counter_3/R0_1] [get_bd_pins decimal_counter_3/R0_2] [get_bd_pins four_2_input_and_gate_0/Y2]
  connect_bd_net -net seg7decimal_0_a_to_g [get_bd_ports seg] [get_bd_pins seg7decimal_0/a_to_g]
  connect_bd_net -net seg7decimal_0_an [get_bd_ports an] [get_bd_pins seg7decimal_0/an]
  connect_bd_net -net seg7decimal_0_dp [get_bd_ports dp] [get_bd_pins seg7decimal_0/dp]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins seg7decimal_0/x] [get_bd_pins xlconcat_0/dout]

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


