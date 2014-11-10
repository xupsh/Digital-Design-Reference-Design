
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
set scripts_vivado_version 2014.2
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

if { ${design_name} ne "" && ${cur_design} eq ${design_name} } {

   # Checks if design is empty or not
   if { $list_cells ne "" } {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 1
   } else {
      puts "INFO: Constructing design in IPI design <$design_name>..."
   }
} elseif { ${cur_design} ne "" && ${cur_design} ne ${design_name} } {

   if { $list_cells eq "" } {
      puts "INFO: You have an empty design <${cur_design}>. Will go ahead and create design..."
   } else {
      set errMsg "ERROR: Design <${cur_design}> is not empty! Please do not source this script on non-empty designs."
      set nRet 1
   }
} else {

   if { [get_files -quiet ${design_name}.bd] eq "" } {
      puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

      create_bd_design $design_name

      puts "INFO: Making design <$design_name> as current_bd_design."
      current_bd_design $design_name

   } else {
      set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
      set nRet 3
   }

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
  set AN0 [ create_bd_port -dir O AN0 ]
  set AN1 [ create_bd_port -dir O AN1 ]
  set AN2 [ create_bd_port -dir O AN2 ]
  set AN3 [ create_bd_port -dir O AN3 ]
  set BI_RBO_n_H0 [ create_bd_port -dir IO BI_RBO_n_H0 ]
  set BI_RBO_n_H1 [ create_bd_port -dir IO BI_RBO_n_H1 ]
  set BI_RBO_n_M0 [ create_bd_port -dir IO BI_RBO_n_M0 ]
  set BI_RBO_n_M1 [ create_bd_port -dir IO BI_RBO_n_M1 ]
  set BI_RBO_n_S0 [ create_bd_port -dir IO BI_RBO_n_S0 ]
  set BI_RBO_n_S1 [ create_bd_port -dir IO BI_RBO_n_S1 ]
  set GND [ create_bd_port -dir I GND ]
  set LT_n [ create_bd_port -dir I LT_n ]
  set MR_n [ create_bd_port -dir I MR_n ]
  set Qa [ create_bd_port -dir O Qa ]
  set Qb [ create_bd_port -dir O Qb ]
  set Qc [ create_bd_port -dir O Qc ]
  set RBI_n [ create_bd_port -dir I RBI_n ]
  set a [ create_bd_port -dir O a ]
  set b [ create_bd_port -dir O b ]
  set c [ create_bd_port -dir O c ]
  set clk [ create_bd_port -dir I clk ]
  set d [ create_bd_port -dir O d ]
  set e [ create_bd_port -dir O e ]
  set f [ create_bd_port -dir O f ]
  set g [ create_bd_port -dir O g ]

  # Create instance: BCD2SEG7_H0, and set properties
  set BCD2SEG7_H0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_H0 ]

  # Create instance: BCD2SEG7_H1, and set properties
  set BCD2SEG7_H1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_H1 ]

  # Create instance: BCD2SEG7_M0, and set properties
  set BCD2SEG7_M0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_M0 ]

  # Create instance: BCD2SEG7_M1, and set properties
  set BCD2SEG7_M1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_M1 ]

  # Create instance: BCD2SEG7_S0, and set properties
  set BCD2SEG7_S0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_S0 ]

  # Create instance: BCD2SEG7_S1, and set properties
  set BCD2SEG7_S1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_S1 ]

  # Create instance: clk_div_0, and set properties
  set clk_div_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_0 ]
  set_property -dict [ list CONFIG.N {499999}  ] $clk_div_0

  # Create instance: clk_div_1, and set properties
  set clk_div_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_1 ]
  set_property -dict [ list CONFIG.N {59999999}  ] $clk_div_1

  # Create instance: clk_div_2, and set properties
  set clk_div_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_2 ]
  set_property -dict [ list CONFIG.N {399999}  ] $clk_div_2

  # Create instance: decimal_counter_0, and set properties
  set decimal_counter_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_0 ]

  # Create instance: decimal_counter_1, and set properties
  set decimal_counter_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_1 ]

  # Create instance: decimal_counter_2, and set properties
  set decimal_counter_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_2 ]

  # Create instance: decimal_counter_3, and set properties
  set decimal_counter_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_3 ]

  # Create instance: decimal_counter_4, and set properties
  set decimal_counter_4 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_4 ]

  # Create instance: decimal_counter_5, and set properties
  set decimal_counter_5 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_5 ]

  # Create instance: encoder_8_to_3_0, and set properties
  set encoder_8_to_3_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:encoder_8_to_3:1.0 encoder_8_to_3_0 ]

  # Create instance: four_2_input_and_gate_0, and set properties
  set four_2_input_and_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_and_gate:1.0 four_2_input_and_gate_0 ]

  # Create instance: inv_6bits_0, and set properties
  set inv_6bits_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:inv_6bits:1.0 inv_6bits_0 ]

  # Create instance: mux_8_to_1_a, and set properties
  set mux_8_to_1_a [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_a ]

  # Create instance: mux_8_to_1_b, and set properties
  set mux_8_to_1_b [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_b ]

  # Create instance: mux_8_to_1_c, and set properties
  set mux_8_to_1_c [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_c ]

  # Create instance: mux_8_to_1_d, and set properties
  set mux_8_to_1_d [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_d ]

  # Create instance: mux_8_to_1_e, and set properties
  set mux_8_to_1_e [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_e ]

  # Create instance: mux_8_to_1_f, and set properties
  set mux_8_to_1_f [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_f ]

  # Create instance: mux_8_to_1_g, and set properties
  set mux_8_to_1_g [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_g ]

  # Create instance: shift_register_8bit_0, and set properties
  set shift_register_8bit_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:shift_register_8bit:1.0 shift_register_8bit_0 ]

  # Create port connections
  connect_bd_net -net BCD2SEG7_M0_a [get_bd_pins BCD2SEG7_M0/a] [get_bd_pins mux_8_to_1_a/D2]
  connect_bd_net -net BCD2SEG7_M0_b [get_bd_pins BCD2SEG7_M0/b] [get_bd_pins mux_8_to_1_b/D2]
  connect_bd_net -net BCD2SEG7_M0_c [get_bd_pins BCD2SEG7_M0/c] [get_bd_pins mux_8_to_1_c/D2]
  connect_bd_net -net BCD2SEG7_M0_d [get_bd_pins BCD2SEG7_M0/d] [get_bd_pins mux_8_to_1_d/D2]
  connect_bd_net -net BCD2SEG7_M0_e [get_bd_pins BCD2SEG7_M0/e] [get_bd_pins mux_8_to_1_e/D2]
  connect_bd_net -net BCD2SEG7_M0_f [get_bd_pins BCD2SEG7_M0/f] [get_bd_pins mux_8_to_1_f/D2]
  connect_bd_net -net BCD2SEG7_M0_g [get_bd_pins BCD2SEG7_M0/g] [get_bd_pins mux_8_to_1_g/D2]
  connect_bd_net -net BCD2SEG7_M1_a [get_bd_pins BCD2SEG7_M1/a] [get_bd_pins mux_8_to_1_a/D3]
  connect_bd_net -net BCD2SEG7_M1_b [get_bd_pins BCD2SEG7_M1/b] [get_bd_pins mux_8_to_1_b/D3]
  connect_bd_net -net BCD2SEG7_M1_c [get_bd_pins BCD2SEG7_M1/c] [get_bd_pins mux_8_to_1_c/D3]
  connect_bd_net -net BCD2SEG7_M1_d [get_bd_pins BCD2SEG7_M1/d] [get_bd_pins mux_8_to_1_d/D3]
  connect_bd_net -net BCD2SEG7_M1_e [get_bd_pins BCD2SEG7_M1/e] [get_bd_pins mux_8_to_1_e/D3]
  connect_bd_net -net BCD2SEG7_M1_f [get_bd_pins BCD2SEG7_M1/f] [get_bd_pins mux_8_to_1_f/D3]
  connect_bd_net -net BCD2SEG7_M1_g [get_bd_pins BCD2SEG7_M1/g] [get_bd_pins mux_8_to_1_g/D3]
  connect_bd_net -net BCD2SEG7_S0_a [get_bd_pins BCD2SEG7_S0/a] [get_bd_pins mux_8_to_1_a/D0]
  connect_bd_net -net BCD2SEG7_S0_b [get_bd_pins BCD2SEG7_S0/b] [get_bd_pins mux_8_to_1_b/D0]
  connect_bd_net -net BCD2SEG7_S0_c [get_bd_pins BCD2SEG7_S0/c] [get_bd_pins mux_8_to_1_c/D0]
  connect_bd_net -net BCD2SEG7_S0_d [get_bd_pins BCD2SEG7_S0/d] [get_bd_pins mux_8_to_1_d/D0]
  connect_bd_net -net BCD2SEG7_S0_e [get_bd_pins BCD2SEG7_S0/e] [get_bd_pins mux_8_to_1_e/D0]
  connect_bd_net -net BCD2SEG7_S0_f [get_bd_pins BCD2SEG7_S0/f] [get_bd_pins mux_8_to_1_f/D0]
  connect_bd_net -net BCD2SEG7_S0_g [get_bd_pins BCD2SEG7_S0/g] [get_bd_pins mux_8_to_1_g/D0]
  connect_bd_net -net BCD2SEG7_S1_a [get_bd_pins BCD2SEG7_S1/a] [get_bd_pins mux_8_to_1_a/D1]
  connect_bd_net -net BCD2SEG7_S1_b [get_bd_pins BCD2SEG7_S1/b] [get_bd_pins mux_8_to_1_b/D1]
  connect_bd_net -net BCD2SEG7_S1_c [get_bd_pins BCD2SEG7_S1/c] [get_bd_pins mux_8_to_1_c/D1]
  connect_bd_net -net BCD2SEG7_S1_d [get_bd_pins BCD2SEG7_S1/d] [get_bd_pins mux_8_to_1_d/D1]
  connect_bd_net -net BCD2SEG7_S1_e [get_bd_pins BCD2SEG7_S1/e] [get_bd_pins mux_8_to_1_e/D1]
  connect_bd_net -net BCD2SEG7_S1_f [get_bd_pins BCD2SEG7_S1/f] [get_bd_pins mux_8_to_1_f/D1]
  connect_bd_net -net BCD2SEG7_S1_g [get_bd_pins BCD2SEG7_S1/g] [get_bd_pins mux_8_to_1_g/D1]
  connect_bd_net -net GND_1 [get_bd_ports GND] [get_bd_pins decimal_counter_0/R9_1] [get_bd_pins decimal_counter_0/R9_2] [get_bd_pins decimal_counter_1/R9_1] [get_bd_pins decimal_counter_1/R9_2] [get_bd_pins decimal_counter_2/R9_1] [get_bd_pins decimal_counter_2/R9_2] [get_bd_pins decimal_counter_3/R9_1] [get_bd_pins decimal_counter_3/R9_2] [get_bd_pins decimal_counter_4/R9_1] [get_bd_pins decimal_counter_4/R9_2] [get_bd_pins decimal_counter_5/R9_1] [get_bd_pins decimal_counter_5/R9_2] [get_bd_pins encoder_8_to_3_0/EI] [get_bd_pins four_2_input_and_gate_0/A3] [get_bd_pins four_2_input_and_gate_0/A4] [get_bd_pins four_2_input_and_gate_0/B3] [get_bd_pins four_2_input_and_gate_0/B4] [get_bd_pins inv_6bits_0/A5] [get_bd_pins inv_6bits_0/A6] [get_bd_pins mux_8_to_1_a/S_n] [get_bd_pins mux_8_to_1_b/S_n] [get_bd_pins mux_8_to_1_c/S_n] [get_bd_pins mux_8_to_1_d/S_n] [get_bd_pins mux_8_to_1_e/S_n] [get_bd_pins mux_8_to_1_f/S_n] [get_bd_pins mux_8_to_1_g/S_n]
  connect_bd_net -net LT_n_1 [get_bd_ports LT_n] [get_bd_pins BCD2SEG7_H0/LT_n] [get_bd_pins BCD2SEG7_H1/LT_n] [get_bd_pins BCD2SEG7_M0/LT_n] [get_bd_pins BCD2SEG7_M1/LT_n] [get_bd_pins BCD2SEG7_S0/LT_n] [get_bd_pins BCD2SEG7_S1/LT_n] [get_bd_pins mux_8_to_1_a/D4] [get_bd_pins mux_8_to_1_a/D5] [get_bd_pins mux_8_to_1_a/D6] [get_bd_pins mux_8_to_1_a/D7] [get_bd_pins mux_8_to_1_b/D4] [get_bd_pins mux_8_to_1_b/D5] [get_bd_pins mux_8_to_1_b/D6] [get_bd_pins mux_8_to_1_b/D7] [get_bd_pins mux_8_to_1_c/D4] [get_bd_pins mux_8_to_1_c/D5] [get_bd_pins mux_8_to_1_c/D6] [get_bd_pins mux_8_to_1_c/D7] [get_bd_pins mux_8_to_1_d/D4] [get_bd_pins mux_8_to_1_d/D5] [get_bd_pins mux_8_to_1_d/D6] [get_bd_pins mux_8_to_1_d/D7] [get_bd_pins mux_8_to_1_e/D4] [get_bd_pins mux_8_to_1_e/D5] [get_bd_pins mux_8_to_1_e/D6] [get_bd_pins mux_8_to_1_e/D7] [get_bd_pins mux_8_to_1_f/D4] [get_bd_pins mux_8_to_1_f/D5] [get_bd_pins mux_8_to_1_f/D6] [get_bd_pins mux_8_to_1_f/D7] [get_bd_pins mux_8_to_1_g/D4] [get_bd_pins mux_8_to_1_g/D5] [get_bd_pins mux_8_to_1_g/D6] [get_bd_pins mux_8_to_1_g/D7]
  connect_bd_net -net MR_n_1 [get_bd_ports MR_n] [get_bd_pins inv_6bits_0/A2] [get_bd_pins shift_register_8bit_0/MR_n]
  connect_bd_net -net Net [get_bd_ports BI_RBO_n_S0] [get_bd_pins BCD2SEG7_S0/BI_RBO_n]
  connect_bd_net -net Net1 [get_bd_ports BI_RBO_n_M1] [get_bd_pins BCD2SEG7_M1/BI_RBO_n]
  connect_bd_net -net Net2 [get_bd_ports BI_RBO_n_M0] [get_bd_pins BCD2SEG7_M0/BI_RBO_n]
  connect_bd_net -net Net3 [get_bd_ports BI_RBO_n_H1] [get_bd_pins BCD2SEG7_H1/BI_RBO_n]
  connect_bd_net -net Net4 [get_bd_ports BI_RBO_n_H0] [get_bd_pins BCD2SEG7_H0/BI_RBO_n]
  connect_bd_net -net Net5 [get_bd_ports BI_RBO_n_S1] [get_bd_pins BCD2SEG7_S1/BI_RBO_n]
  connect_bd_net -net RBI_n_1 [get_bd_ports RBI_n] [get_bd_pins BCD2SEG7_H0/RBI_n] [get_bd_pins BCD2SEG7_H1/RBI_n] [get_bd_pins BCD2SEG7_M0/RBI_n] [get_bd_pins BCD2SEG7_M1/RBI_n] [get_bd_pins BCD2SEG7_S0/RBI_n] [get_bd_pins BCD2SEG7_S1/RBI_n]
  connect_bd_net -net clk_1s_1 [get_bd_ports clk] [get_bd_pins clk_div_0/clk_in] [get_bd_pins clk_div_1/clk_in] [get_bd_pins clk_div_2/clk_in]
  connect_bd_net -net clk_div_0_clk_out [get_bd_pins clk_div_0/clk_out] [get_bd_pins shift_register_8bit_0/CP]
  connect_bd_net -net clk_div_1_clk_out [get_bd_pins clk_div_1/clk_out] [get_bd_pins decimal_counter_0/CP1_n]
  connect_bd_net -net clk_div_2_clk_out [get_bd_pins inv_6bits_0/Y1] [get_bd_pins shift_register_8bit_0/DSA] [get_bd_pins shift_register_8bit_0/DSB]
  connect_bd_net -net clk_div_2_clk_out1 [get_bd_pins clk_div_2/clk_out] [get_bd_pins inv_6bits_0/A1]
  connect_bd_net -net decimal_counter_0_Qa [get_bd_pins BCD2SEG7_S0/BCD_A] [get_bd_pins decimal_counter_0/CP2_n] [get_bd_pins decimal_counter_0/Qa]
  connect_bd_net -net decimal_counter_0_Qb [get_bd_pins BCD2SEG7_S0/BCD_B] [get_bd_pins decimal_counter_0/Qb]
  connect_bd_net -net decimal_counter_0_Qc [get_bd_pins BCD2SEG7_S0/BCD_C] [get_bd_pins decimal_counter_0/Qc]
  connect_bd_net -net decimal_counter_0_Qd [get_bd_pins BCD2SEG7_S0/BCD_D] [get_bd_pins decimal_counter_0/Qd] [get_bd_pins decimal_counter_1/CP1_n]
  connect_bd_net -net decimal_counter_1_Qa [get_bd_pins BCD2SEG7_S1/BCD_A] [get_bd_pins decimal_counter_1/CP2_n] [get_bd_pins decimal_counter_1/Qa]
  connect_bd_net -net decimal_counter_1_Qb [get_bd_pins BCD2SEG7_S1/BCD_B] [get_bd_pins decimal_counter_1/Qb] [get_bd_pins four_2_input_and_gate_0/B1]
  connect_bd_net -net decimal_counter_1_Qc [get_bd_pins BCD2SEG7_S1/BCD_C] [get_bd_pins decimal_counter_1/Qc] [get_bd_pins four_2_input_and_gate_0/A1]
  connect_bd_net -net decimal_counter_1_Qd [get_bd_pins BCD2SEG7_S1/BCD_D] [get_bd_pins decimal_counter_1/Qd]
  connect_bd_net -net decimal_counter_2_Qa [get_bd_pins BCD2SEG7_M0/BCD_A] [get_bd_pins decimal_counter_2/CP2_n] [get_bd_pins decimal_counter_2/Qa]
  connect_bd_net -net decimal_counter_2_Qb [get_bd_pins BCD2SEG7_M0/BCD_B] [get_bd_pins decimal_counter_2/Qb]
  connect_bd_net -net decimal_counter_2_Qc [get_bd_pins BCD2SEG7_M0/BCD_C] [get_bd_pins decimal_counter_2/Qc]
  connect_bd_net -net decimal_counter_2_Qd [get_bd_pins BCD2SEG7_M0/BCD_D] [get_bd_pins decimal_counter_2/Qd] [get_bd_pins decimal_counter_3/CP1_n]
  connect_bd_net -net decimal_counter_3_Qa [get_bd_pins BCD2SEG7_M1/BCD_A] [get_bd_pins decimal_counter_3/CP2_n] [get_bd_pins decimal_counter_3/Qa]
  connect_bd_net -net decimal_counter_3_Qb [get_bd_pins BCD2SEG7_M1/BCD_B] [get_bd_pins decimal_counter_3/Qb] [get_bd_pins four_2_input_and_gate_0/B2]
  connect_bd_net -net decimal_counter_3_Qc [get_bd_pins BCD2SEG7_M1/BCD_C] [get_bd_pins decimal_counter_3/Qc] [get_bd_pins four_2_input_and_gate_0/A2]
  connect_bd_net -net decimal_counter_3_Qd [get_bd_pins BCD2SEG7_M1/BCD_D] [get_bd_pins decimal_counter_3/Qd]
  connect_bd_net -net decimal_counter_4_Qa [get_bd_pins BCD2SEG7_H0/BCD_A] [get_bd_pins decimal_counter_4/CP2_n] [get_bd_pins decimal_counter_4/Qa]
  connect_bd_net -net decimal_counter_4_Qb [get_bd_pins BCD2SEG7_H0/BCD_B] [get_bd_pins decimal_counter_4/Qb]
  connect_bd_net -net decimal_counter_4_Qc [get_bd_pins BCD2SEG7_H0/BCD_C] [get_bd_pins decimal_counter_4/Qc] [get_bd_pins decimal_counter_4/R0_1] [get_bd_pins decimal_counter_5/R0_1]
  connect_bd_net -net decimal_counter_4_Qd [get_bd_pins BCD2SEG7_H0/BCD_D] [get_bd_pins decimal_counter_4/Qd] [get_bd_pins decimal_counter_5/CP1_n]
  connect_bd_net -net decimal_counter_5_Qa [get_bd_pins BCD2SEG7_H1/BCD_A] [get_bd_pins decimal_counter_5/CP2_n] [get_bd_pins decimal_counter_5/Qa]
  connect_bd_net -net decimal_counter_5_Qb [get_bd_pins BCD2SEG7_H1/BCD_B] [get_bd_pins decimal_counter_4/R0_2] [get_bd_pins decimal_counter_5/Qb] [get_bd_pins decimal_counter_5/R0_2]
  connect_bd_net -net decimal_counter_5_Qc [get_bd_pins BCD2SEG7_H1/BCD_C] [get_bd_pins decimal_counter_5/Qc]
  connect_bd_net -net decimal_counter_5_Qd [get_bd_pins BCD2SEG7_H1/BCD_D] [get_bd_pins decimal_counter_5/Qd]
  connect_bd_net -net encoder_8_to_3_0_Qa [get_bd_ports Qa] [get_bd_pins encoder_8_to_3_0/Qa] [get_bd_pins inv_6bits_0/A4]
  connect_bd_net -net encoder_8_to_3_0_Qb [get_bd_ports Qb] [get_bd_pins encoder_8_to_3_0/Qb] [get_bd_pins inv_6bits_0/A3]
  connect_bd_net -net encoder_8_to_3_0_Qc [get_bd_ports Qc] [get_bd_pins encoder_8_to_3_0/Qc]
  connect_bd_net -net four_2_input_and_gate_0_Y1 [get_bd_pins decimal_counter_0/R0_1] [get_bd_pins decimal_counter_0/R0_2] [get_bd_pins decimal_counter_1/R0_1] [get_bd_pins decimal_counter_1/R0_2] [get_bd_pins decimal_counter_2/CP1_n] [get_bd_pins four_2_input_and_gate_0/Y1]
  connect_bd_net -net four_2_input_and_gate_0_Y2 [get_bd_pins decimal_counter_2/R0_1] [get_bd_pins decimal_counter_2/R0_2] [get_bd_pins decimal_counter_3/R0_1] [get_bd_pins decimal_counter_3/R0_2] [get_bd_pins decimal_counter_4/CP1_n] [get_bd_pins four_2_input_and_gate_0/Y2]
  connect_bd_net -net inv_6bits_0_Y2 [get_bd_pins inv_6bits_0/Y2] [get_bd_pins mux_8_to_1_a/A2] [get_bd_pins mux_8_to_1_b/A2] [get_bd_pins mux_8_to_1_c/A2] [get_bd_pins mux_8_to_1_d/A2] [get_bd_pins mux_8_to_1_e/A2] [get_bd_pins mux_8_to_1_f/A2] [get_bd_pins mux_8_to_1_g/A2]
  connect_bd_net -net inv_6bits_0_Y3 [get_bd_pins inv_6bits_0/Y3] [get_bd_pins mux_8_to_1_a/A1] [get_bd_pins mux_8_to_1_b/A1] [get_bd_pins mux_8_to_1_c/A1] [get_bd_pins mux_8_to_1_d/A1] [get_bd_pins mux_8_to_1_e/A1] [get_bd_pins mux_8_to_1_f/A1] [get_bd_pins mux_8_to_1_g/A1]
  connect_bd_net -net inv_6bits_0_Y4 [get_bd_pins inv_6bits_0/Y4] [get_bd_pins mux_8_to_1_a/A0] [get_bd_pins mux_8_to_1_b/A0] [get_bd_pins mux_8_to_1_c/A0] [get_bd_pins mux_8_to_1_d/A0] [get_bd_pins mux_8_to_1_e/A0] [get_bd_pins mux_8_to_1_f/A0] [get_bd_pins mux_8_to_1_g/A0]
  connect_bd_net -net mux_8_to_1_a_Q [get_bd_ports a] [get_bd_pins mux_8_to_1_a/Q]
  connect_bd_net -net mux_8_to_1_b_Q [get_bd_ports b] [get_bd_pins mux_8_to_1_b/Q]
  connect_bd_net -net mux_8_to_1_c_Q [get_bd_ports c] [get_bd_pins mux_8_to_1_c/Q]
  connect_bd_net -net mux_8_to_1_d_Q [get_bd_ports d] [get_bd_pins mux_8_to_1_d/Q]
  connect_bd_net -net mux_8_to_1_e_Q [get_bd_ports e] [get_bd_pins mux_8_to_1_e/Q]
  connect_bd_net -net mux_8_to_1_f_Q [get_bd_ports f] [get_bd_pins mux_8_to_1_f/Q]
  connect_bd_net -net mux_8_to_1_g_Q [get_bd_ports g] [get_bd_pins mux_8_to_1_g/Q]
  connect_bd_net -net shift_register_8bit_0_Q0 [get_bd_ports AN0] [get_bd_pins encoder_8_to_3_0/I0] [get_bd_pins shift_register_8bit_0/Q0]
  connect_bd_net -net shift_register_8bit_0_Q1 [get_bd_ports AN1] [get_bd_pins encoder_8_to_3_0/I1] [get_bd_pins shift_register_8bit_0/Q1]
  connect_bd_net -net shift_register_8bit_0_Q2 [get_bd_ports AN2] [get_bd_pins encoder_8_to_3_0/I2] [get_bd_pins shift_register_8bit_0/Q2]
  connect_bd_net -net shift_register_8bit_0_Q3 [get_bd_ports AN3] [get_bd_pins encoder_8_to_3_0/I3] [get_bd_pins shift_register_8bit_0/Q3]
  connect_bd_net -net shift_register_8bit_0_Q4 [get_bd_pins encoder_8_to_3_0/I4] [get_bd_pins shift_register_8bit_0/Q4]
  connect_bd_net -net shift_register_8bit_0_Q5 [get_bd_pins encoder_8_to_3_0/I5] [get_bd_pins shift_register_8bit_0/Q5]
  connect_bd_net -net shift_register_8bit_0_Q6 [get_bd_pins encoder_8_to_3_0/I6] [get_bd_pins shift_register_8bit_0/Q6]
  connect_bd_net -net shift_register_8bit_0_Q7 [get_bd_pins encoder_8_to_3_0/I7] [get_bd_pins shift_register_8bit_0/Q7]

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


