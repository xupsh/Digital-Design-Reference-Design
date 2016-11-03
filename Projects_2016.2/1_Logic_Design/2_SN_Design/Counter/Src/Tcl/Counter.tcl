
################################################################
# This is a generated script based on design: Counter
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
# source Counter_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name Counter

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
  set R0 [ create_bd_port -dir I R0 ]
  set R9 [ create_bd_port -dir I R9 ]
  set a_to_g [ create_bd_port -dir O -from 6 -to 0 a_to_g ]
  set an [ create_bd_port -dir O -from 3 -to 0 an ]
  set clk_in [ create_bd_port -dir I clk_in ]
  set dp [ create_bd_port -dir O dp ]

  # Create instance: clk_div_0, and set properties
  set clk_div_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_0 ]

  # Create instance: decimal_counter_0, and set properties
  set decimal_counter_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_0 ]

  # Create instance: decimal_counter_1, and set properties
  set decimal_counter_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_1 ]

  # Create instance: decimal_counter_2, and set properties
  set decimal_counter_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_2 ]

  # Create instance: decimal_counter_3, and set properties
  set decimal_counter_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_3 ]

  # Create instance: seg7decimal_0, and set properties
  set seg7decimal_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:seg7decimal:1.0 seg7decimal_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {16} \
 ] $xlconcat_0

  # Create port connections
  connect_bd_net -net R0_1_1 [get_bd_ports R0] [get_bd_pins decimal_counter_0/R0_1] [get_bd_pins decimal_counter_0/R0_2] [get_bd_pins decimal_counter_1/R0_1] [get_bd_pins decimal_counter_1/R0_2] [get_bd_pins decimal_counter_2/R0_1] [get_bd_pins decimal_counter_2/R0_2] [get_bd_pins decimal_counter_3/R0_1] [get_bd_pins decimal_counter_3/R0_2] [get_bd_pins seg7decimal_0/clr]
  connect_bd_net -net R9_1_1 [get_bd_ports R9] [get_bd_pins decimal_counter_0/R9_1] [get_bd_pins decimal_counter_0/R9_2] [get_bd_pins decimal_counter_1/R9_1] [get_bd_pins decimal_counter_1/R9_2] [get_bd_pins decimal_counter_2/R9_1] [get_bd_pins decimal_counter_2/R9_2] [get_bd_pins decimal_counter_3/R9_1] [get_bd_pins decimal_counter_3/R9_2]
  connect_bd_net -net clk_div_0_clk_out [get_bd_pins clk_div_0/clk_out] [get_bd_pins decimal_counter_0/CP1_n]
  connect_bd_net -net clk_in_1 [get_bd_ports clk_in] [get_bd_pins clk_div_0/clk_in] [get_bd_pins seg7decimal_0/clk]
  connect_bd_net -net decimal_counter_0_Qa [get_bd_pins decimal_counter_0/CP2_n] [get_bd_pins decimal_counter_0/Qa] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net decimal_counter_0_Qb [get_bd_pins decimal_counter_0/Qb] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net decimal_counter_0_Qc [get_bd_pins decimal_counter_0/Qc] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net decimal_counter_0_Qd [get_bd_pins decimal_counter_0/Qd] [get_bd_pins decimal_counter_1/CP1_n] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net decimal_counter_1_Qa [get_bd_pins decimal_counter_1/CP2_n] [get_bd_pins decimal_counter_1/Qa] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net decimal_counter_1_Qb [get_bd_pins decimal_counter_1/Qb] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net decimal_counter_1_Qc [get_bd_pins decimal_counter_1/Qc] [get_bd_pins xlconcat_0/In6]
  connect_bd_net -net decimal_counter_1_Qd [get_bd_pins decimal_counter_1/Qd] [get_bd_pins decimal_counter_2/CP1_n] [get_bd_pins xlconcat_0/In7]
  connect_bd_net -net decimal_counter_2_Qa [get_bd_pins decimal_counter_2/CP2_n] [get_bd_pins decimal_counter_2/Qa] [get_bd_pins xlconcat_0/In8]
  connect_bd_net -net decimal_counter_2_Qb [get_bd_pins decimal_counter_2/Qb] [get_bd_pins xlconcat_0/In9]
  connect_bd_net -net decimal_counter_2_Qc [get_bd_pins decimal_counter_2/Qc] [get_bd_pins xlconcat_0/In10]
  connect_bd_net -net decimal_counter_2_Qd [get_bd_pins decimal_counter_2/Qd] [get_bd_pins decimal_counter_3/CP1_n] [get_bd_pins xlconcat_0/In11]
  connect_bd_net -net decimal_counter_3_Qa [get_bd_pins decimal_counter_3/CP2_n] [get_bd_pins decimal_counter_3/Qa] [get_bd_pins xlconcat_0/In12]
  connect_bd_net -net decimal_counter_3_Qb [get_bd_pins decimal_counter_3/Qb] [get_bd_pins xlconcat_0/In13]
  connect_bd_net -net decimal_counter_3_Qc [get_bd_pins decimal_counter_3/Qc] [get_bd_pins xlconcat_0/In14]
  connect_bd_net -net decimal_counter_3_Qd [get_bd_pins decimal_counter_3/Qd] [get_bd_pins xlconcat_0/In15]
  connect_bd_net -net seg7decimal_0_a_to_g [get_bd_ports a_to_g] [get_bd_pins seg7decimal_0/a_to_g]
  connect_bd_net -net seg7decimal_0_an [get_bd_ports an] [get_bd_pins seg7decimal_0/an]
  connect_bd_net -net seg7decimal_0_dp [get_bd_ports dp] [get_bd_pins seg7decimal_0/dp]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins seg7decimal_0/x] [get_bd_pins xlconcat_0/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port clk_in -pg 1 -y 60 -defaultsOSRD
preplace port dp -pg 1 -y 60 -defaultsOSRD
preplace port R9 -pg 1 -y 40 -defaultsOSRD
preplace port R0 -pg 1 -y 20 -defaultsOSRD
preplace portBus a_to_g -pg 1 -y 20 -defaultsOSRD
preplace portBus an -pg 1 -y 40 -defaultsOSRD
preplace inst decimal_counter_0 -pg 1 -lvl 1 -y 90 -defaultsOSRD
preplace inst decimal_counter_1 -pg 1 -lvl 1 -y 300 -defaultsOSRD
preplace inst decimal_counter_2 -pg 1 -lvl 1 -y 520 -defaultsOSRD
preplace inst decimal_counter_3 -pg 1 -lvl 1 -y 720 -defaultsOSRD
preplace inst seg7decimal_0 -pg 1 -lvl 3 -y 40 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 2 -y 480 -defaultsOSRD
preplace inst clk_div_0 -pg 1 -lvl 1 -y 850 -defaultsOSRD
preplace netloc decimal_counter_2_Qb 1 1 1 N
preplace netloc decimal_counter_1_Qb 1 1 1 260
preplace netloc seg7decimal_0_a_to_g 1 3 1 N
preplace netloc decimal_counter_2_Qc 1 1 1 N
preplace netloc decimal_counter_1_Qc 1 1 1 250
preplace netloc decimal_counter_3_Qa 1 0 2 70 920 300
preplace netloc decimal_counter_2_Qd 1 0 2 60 910 260
preplace netloc decimal_counter_1_Qd 1 0 2 40 620 240
preplace netloc decimal_counter_0_Qa 1 0 2 70 -10 310
preplace netloc R0_1_1 1 0 3 30 -50 NJ -50 520
preplace netloc decimal_counter_3_Qb 1 1 1 250
preplace netloc decimal_counter_0_Qb 1 1 1 300
preplace netloc seg7decimal_0_an 1 3 1 N
preplace netloc decimal_counter_3_Qc 1 1 1 290
preplace netloc decimal_counter_0_Qc 1 1 1 290
preplace netloc seg7decimal_0_dp 1 3 1 N
preplace netloc decimal_counter_3_Qd 1 1 1 310
preplace netloc decimal_counter_0_Qd 1 0 2 50 190 280
preplace netloc clk_in_1 1 0 3 20 -40 NJ -40 510
preplace netloc R9_1_1 1 0 1 10
preplace netloc xlconcat_0_dout 1 2 1 530
preplace netloc clk_div_0_clk_out 1 0 2 50 -20 230
preplace netloc decimal_counter_2_Qa 1 0 2 50 900 270
preplace netloc decimal_counter_1_Qa 1 0 2 70 200 270
levelinfo -pg 1 -10 150 420 620 730 -top -60 -bot 940
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


