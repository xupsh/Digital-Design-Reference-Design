
################################################################
# This is a generated script based on design: design_1
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
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1


# CHANGE DESIGN NAME HERE
set design_name design_1

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
  set I2C_SCLK [ create_bd_port -dir O I2C_SCLK ]
  set I2C_SDAT [ create_bd_port -dir IO I2C_SDAT ]
  set clk_in1 [ create_bd_port -dir I -type clk clk_in1 ]
  set d [ create_bd_port -dir I -from 7 -to 0 d ]
  set href [ create_bd_port -dir I href ]
  set pclk [ create_bd_port -dir I pclk ]
  set vga_blue [ create_bd_port -dir O -from 3 -to 0 vga_blue ]
  set vga_green [ create_bd_port -dir O -from 3 -to 0 vga_green ]
  set vga_hsync [ create_bd_port -dir O vga_hsync ]
  set vga_red [ create_bd_port -dir O -from 3 -to 0 vga_red ]
  set vga_vsync [ create_bd_port -dir O vga_vsync ]
  set vsync [ create_bd_port -dir I vsync ]
  set xclk [ create_bd_port -dir O xclk ]

  # Create instance: IICctrl_0, and set properties
  set IICctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:IICctrl:1.0 IICctrl_0 ]

  # Create instance: bram_0, and set properties
  set bram_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:bram:1.0 bram_0 ]

  # Create instance: cam_ov7725_0, and set properties
  set cam_ov7725_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:cam_ov7725:1.0 cam_ov7725_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25.000} CONFIG.USE_LOCKED {false} CONFIG.USE_RESET {false}  ] $clk_wiz_0

  # Create instance: vga_readBRAM_0, and set properties
  set vga_readBRAM_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:vga_readBRAM:1.0 vga_readBRAM_0 ]

  # Create port connections
  connect_bd_net -net IICctrl_0_I2C_SCLK [get_bd_ports I2C_SCLK] [get_bd_pins IICctrl_0/I2C_SCLK]
  connect_bd_net -net Net [get_bd_ports I2C_SDAT] [get_bd_pins IICctrl_0/I2C_SDAT]
  connect_bd_net -net bram_0_doutb [get_bd_pins bram_0/doutb] [get_bd_pins vga_readBRAM_0/frame_pixel]
  connect_bd_net -net cam_ov7725_0_addr [get_bd_pins bram_0/addra] [get_bd_pins cam_ov7725_0/addr]
  connect_bd_net -net cam_ov7725_0_dout [get_bd_pins bram_0/dina] [get_bd_pins cam_ov7725_0/dout]
  connect_bd_net -net cam_ov7725_0_wclk [get_bd_pins bram_0/clka] [get_bd_pins cam_ov7725_0/wclk]
  connect_bd_net -net cam_ov7725_0_we [get_bd_pins bram_0/wea] [get_bd_pins cam_ov7725_0/we]
  connect_bd_net -net clk_in1_1 [get_bd_ports clk_in1] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_ports xclk] [get_bd_pins IICctrl_0/iCLK] [get_bd_pins bram_0/clkb] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins vga_readBRAM_0/clk25]
  connect_bd_net -net d_1 [get_bd_ports d] [get_bd_pins cam_ov7725_0/d]
  connect_bd_net -net href_1 [get_bd_ports href] [get_bd_pins cam_ov7725_0/href]
  connect_bd_net -net pclk_1 [get_bd_ports pclk] [get_bd_pins cam_ov7725_0/pclk]
  connect_bd_net -net vga_readBRAM_0_frame_addr [get_bd_pins bram_0/addrb] [get_bd_pins vga_readBRAM_0/frame_addr]
  connect_bd_net -net vga_readBRAM_0_vga_blue [get_bd_ports vga_blue] [get_bd_pins vga_readBRAM_0/vga_blue]
  connect_bd_net -net vga_readBRAM_0_vga_green [get_bd_ports vga_green] [get_bd_pins vga_readBRAM_0/vga_green]
  connect_bd_net -net vga_readBRAM_0_vga_hsync [get_bd_ports vga_hsync] [get_bd_pins vga_readBRAM_0/vga_hsync]
  connect_bd_net -net vga_readBRAM_0_vga_red [get_bd_ports vga_red] [get_bd_pins vga_readBRAM_0/vga_red]
  connect_bd_net -net vga_readBRAM_0_vga_vsync [get_bd_ports vga_vsync] [get_bd_pins vga_readBRAM_0/vga_vsync]
  connect_bd_net -net vsync_1 [get_bd_ports vsync] [get_bd_pins cam_ov7725_0/vsync]

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


