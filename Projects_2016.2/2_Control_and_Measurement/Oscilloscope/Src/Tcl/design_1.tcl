
################################################################
# This is a generated script based on design: design_1
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
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name design_1

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
  set OV7725_D [ create_bd_port -dir I -from 7 -to 0 OV7725_D ]
  set OV7725_HREF [ create_bd_port -dir I OV7725_HREF ]
  set OV7725_PCLK [ create_bd_port -dir I OV7725_PCLK ]
  set OV7725_SIOC [ create_bd_port -dir O OV7725_SIOC ]
  set OV7725_SIOD [ create_bd_port -dir IO OV7725_SIOD ]
  set OV7725_VSYNC [ create_bd_port -dir I OV7725_VSYNC ]
  set OV7725_XCLK [ create_bd_port -dir O OV7725_XCLK ]
  set clk100 [ create_bd_port -dir I -type clk clk100 ]
  set rst [ create_bd_port -dir I rst ]
  set sw_ColorClear [ create_bd_port -dir I sw_ColorClear ]
  set vga_blue [ create_bd_port -dir O -from 3 -to 0 vga_blue ]
  set vga_green [ create_bd_port -dir O -from 3 -to 0 vga_green ]
  set vga_hsync [ create_bd_port -dir O vga_hsync ]
  set vga_red [ create_bd_port -dir O -from 3 -to 0 vga_red ]
  set vga_vsync [ create_bd_port -dir O vga_vsync ]

  # Create instance: IICctrl_0, and set properties
  set IICctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:IICctrl:1.0 IICctrl_0 ]

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_0 ]
  set_property -dict [ list \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_A {Always_Enabled} \
CONFIG.Enable_B {Always_Enabled} \
CONFIG.Memory_Type {Simple_Dual_Port_RAM} \
CONFIG.Operating_Mode_A {NO_CHANGE} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Read_Width_B {16} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Write_Depth_A {76800} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_0

  # Create instance: cam_ov7670_ov7725_0, and set properties
  set cam_ov7670_ov7725_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:cam_ov7670_ov7725:1.0 cam_ov7670_ov7725_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {151.636} \
CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
CONFIG.CLKOUT2_JITTER {175.402} \
CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} \
CONFIG.MMCM_CLKOUT1_DIVIDE {40} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_0

  # Create instance: debounce_0, and set properties
  set debounce_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:debounce:1.0 debounce_0 ]

  # Create instance: ov7725_regData_0, and set properties
  set ov7725_regData_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:ov7725_regData:1.0 ov7725_regData_0 ]

  # Create instance: ram_read_0, and set properties
  set ram_read_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:ram_read:1.0 ram_read_0 ]

  # Create instance: rgb565_rgb888_0, and set properties
  set rgb565_rgb888_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:rgb565_rgb888:1.0 rgb565_rgb888_0 ]

  # Create instance: rgb888_rgb565_0, and set properties
  set rgb888_rgb565_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:rgb888_rgb565:1.0 rgb888_rgb565_0 ]

  # Create instance: sobel_filter_0, and set properties
  set sobel_filter_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:sobel_filter:1.0 sobel_filter_0 ]

  # Create instance: two2one_mux_0, and set properties
  set two2one_mux_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:two2one_mux:1.1 two2one_mux_0 ]
  set_property -dict [ list \
CONFIG.width {24} \
 ] $two2one_mux_0

  # Create instance: vga_0, and set properties
  set vga_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:vga:1.0 vga_0 ]
  set_property -dict [ list \
CONFIG.HA {16} \
CONFIG.HB {96} \
CONFIG.HD {640} \
CONFIG.HF {48} \
CONFIG.HT {800} \
CONFIG.VA {10} \
CONFIG.VB {2} \
CONFIG.VD {480} \
CONFIG.VF {33} \
CONFIG.VT {525} \
 ] $vga_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_680, and set properties
  set xlconstant_680 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_680 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {480} \
CONFIG.CONST_WIDTH {32} \
 ] $xlconstant_680

  # Create instance: xlconstant_800, and set properties
  set xlconstant_800 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_800 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {640} \
CONFIG.CONST_WIDTH {32} \
 ] $xlconstant_800

  # Create port connections
  connect_bd_net -net IICctrl_0_I2C_SCLK [get_bd_ports OV7725_SIOC] [get_bd_pins IICctrl_0/I2C_SCLK]
  connect_bd_net -net IICctrl_0_LUT_INDEX [get_bd_pins IICctrl_0/LUT_INDEX] [get_bd_pins ov7725_regData_0/LUT_INDEX]
  connect_bd_net -net Net [get_bd_ports OV7725_SIOD] [get_bd_pins IICctrl_0/I2C_SDAT]
  connect_bd_net -net OV7725_D_1 [get_bd_ports OV7725_D] [get_bd_pins cam_ov7670_ov7725_0/d]
  connect_bd_net -net OV7725_HREF_1 [get_bd_ports OV7725_HREF] [get_bd_pins cam_ov7670_ov7725_0/href]
  connect_bd_net -net OV7725_PCLK_1 [get_bd_ports OV7725_PCLK] [get_bd_pins cam_ov7670_ov7725_0/pclk]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins blk_mem_gen_0/doutb] [get_bd_pins rgb565_rgb888_0/rgb565]
  connect_bd_net -net cam_ov7670_ov7725_0_addr [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins cam_ov7670_ov7725_0/addr]
  connect_bd_net -net cam_ov7670_ov7725_0_dout [get_bd_pins blk_mem_gen_0/dina] [get_bd_pins cam_ov7670_ov7725_0/dout]
  connect_bd_net -net cam_ov7670_ov7725_0_wclk [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins cam_ov7670_ov7725_0/wclk]
  connect_bd_net -net cam_ov7670_ov7725_0_we [get_bd_pins blk_mem_gen_0/wea] [get_bd_pins cam_ov7670_ov7725_0/we]
  connect_bd_net -net clk_in1_1 [get_bd_ports clk100] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_ports OV7725_XCLK] [get_bd_pins IICctrl_0/iCLK] [get_bd_pins blk_mem_gen_0/clkb] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins debounce_0/clk] [get_bd_pins ram_read_0/clk] [get_bd_pins sobel_filter_0/ap_clk] [get_bd_pins vga_0/vga_pclk]
  connect_bd_net -net debounce_0_o [get_bd_pins IICctrl_0/rst] [get_bd_pins debounce_0/o] [get_bd_pins vga_0/vga_rst]
  connect_bd_net -net ov7725_regData_0_LUT_DATA [get_bd_pins IICctrl_0/LUT_DATA] [get_bd_pins ov7725_regData_0/LUT_DATA]
  connect_bd_net -net ov7725_regData_0_Slave_Addr [get_bd_pins IICctrl_0/Slave_Addr] [get_bd_pins ov7725_regData_0/Slave_Addr]
  connect_bd_net -net ram_read_0_address [get_bd_pins blk_mem_gen_0/addrb] [get_bd_pins ram_read_0/address]
  connect_bd_net -net ram_read_0_vga_blue [get_bd_ports vga_blue] [get_bd_pins ram_read_0/vga_blue]
  connect_bd_net -net ram_read_0_vga_green [get_bd_ports vga_green] [get_bd_pins ram_read_0/vga_green]
  connect_bd_net -net ram_read_0_vga_red [get_bd_ports vga_red] [get_bd_pins ram_read_0/vga_red]
  connect_bd_net -net rgb565_rgb888_0_rgb888 [get_bd_pins rgb565_rgb888_0/rgb888] [get_bd_pins sobel_filter_0/inter_pix_V_q0] [get_bd_pins two2one_mux_0/din_1]
  connect_bd_net -net rgb888_rgb565_0_rgb565 [get_bd_pins ram_read_0/din] [get_bd_pins rgb888_rgb565_0/rgb565]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins debounce_0/i]
  connect_bd_net -net sobel_filter_0_out_pix_V_d0 [get_bd_pins sobel_filter_0/out_pix_V_d0] [get_bd_pins two2one_mux_0/din_0]
  connect_bd_net -net sw_ColorClear_1 [get_bd_ports sw_ColorClear] [get_bd_pins sobel_filter_0/ap_rst] [get_bd_pins two2one_mux_0/sel]
  connect_bd_net -net two2one_mux_0_mux_out [get_bd_pins rgb888_rgb565_0/rgb888] [get_bd_pins two2one_mux_0/mux_out]
  connect_bd_net -net vga_0_vga_h_cnt [get_bd_pins ram_read_0/vga_h_cnt] [get_bd_pins vga_0/vga_h_cnt]
  connect_bd_net -net vga_0_vga_hsync [get_bd_ports vga_hsync] [get_bd_pins vga_0/vga_hsync]
  connect_bd_net -net vga_0_vga_v_cnt [get_bd_pins ram_read_0/vga_v_cnt] [get_bd_pins vga_0/vga_v_cnt]
  connect_bd_net -net vga_0_vga_valid [get_bd_pins ram_read_0/valid] [get_bd_pins vga_0/vga_valid]
  connect_bd_net -net vga_0_vga_vsync [get_bd_ports vga_vsync] [get_bd_pins vga_0/vga_vsync]
  connect_bd_net -net vsync_1 [get_bd_ports OV7725_VSYNC] [get_bd_pins cam_ov7670_ov7725_0/vsync]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins debounce_0/clr] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_680_dout [get_bd_pins sobel_filter_0/rows] [get_bd_pins xlconstant_680/dout]
  connect_bd_net -net xlconstant_800_dout [get_bd_pins sobel_filter_0/cols] [get_bd_pins xlconstant_800/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port vga_hsync -pg 1 -y 120 -defaultsOSRD
preplace port OV7725_SIOC -pg 1 -y 20 -defaultsOSRD
preplace port sw_ColorClear -pg 1 -y 140 -defaultsOSRD
preplace port OV7725_SIOD -pg 1 -y 40 -defaultsOSRD
preplace port OV7725_PCLK -pg 1 -y 60 -defaultsOSRD
preplace port clk100 -pg 1 -y 100 -defaultsOSRD
preplace port OV7725_VSYNC -pg 1 -y 80 -defaultsOSRD
preplace port rst -pg 1 -y 120 -defaultsOSRD
preplace port OV7725_XCLK -pg 1 -y 60 -defaultsOSRD
preplace port OV7725_HREF -pg 1 -y 40 -defaultsOSRD
preplace port vga_vsync -pg 1 -y 160 -defaultsOSRD
preplace portBus vga_green -pg 1 -y 100 -defaultsOSRD
preplace portBus vga_red -pg 1 -y 140 -defaultsOSRD
preplace portBus OV7725_D -pg 1 -y 20 -defaultsOSRD
preplace portBus vga_blue -pg 1 -y 80 -defaultsOSRD
preplace inst two2one_mux_0 -pg 1 -lvl 1 -y 310 -defaultsOSRD
preplace inst xlconstant_680 -pg 1 -lvl 1 -y 700 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 1 -y 620 -defaultsOSRD
preplace inst vga_0 -pg 1 -lvl 1 -y 450 -defaultsOSRD
preplace inst rgb565_rgb888_0 -pg 1 -lvl 2 -y 1140 -defaultsOSRD
preplace inst blk_mem_gen_0 -pg 1 -lvl 2 -y 290 -defaultsOSRD
preplace inst debounce_0 -pg 1 -lvl 2 -y 750 -defaultsOSRD
preplace inst rgb888_rgb565_0 -pg 1 -lvl 2 -y 1250 -defaultsOSRD
preplace inst xlconstant_800 -pg 1 -lvl 1 -y 810 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 2 -y 640 -defaultsOSRD
preplace inst IICctrl_0 -pg 1 -lvl 2 -y 70 -defaultsOSRD
preplace inst sobel_filter_0 -pg 1 -lvl 1 -y 90 -defaultsOSRD
preplace inst ram_read_0 -pg 1 -lvl 2 -y 920 -defaultsOSRD
preplace inst ov7725_regData_0 -pg 1 -lvl 2 -y 1050 -defaultsOSRD
preplace inst cam_ov7670_ov7725_0 -pg 1 -lvl 2 -y 500 -defaultsOSRD
preplace netloc vga_0_vga_h_cnt 1 1 1 610
preplace netloc ram_read_0_vga_red 1 2 1 1200
preplace netloc ov7725_regData_0_Slave_Addr 1 1 2 720 1330 1070
preplace netloc rgb888_rgb565_0_rgb565 1 1 2 760 1340 1060
preplace netloc ram_read_0_vga_blue 1 2 1 1180
preplace netloc ram_read_0_address 1 1 2 740 1360 1130
preplace netloc cam_ov7670_ov7725_0_wclk 1 1 2 750 1310 1110
preplace netloc sw_ColorClear_1 1 0 1 90
preplace netloc cam_ov7670_ov7725_0_we 1 1 2 730 1350 1150
preplace netloc IICctrl_0_LUT_INDEX 1 1 2 790 1300 1140
preplace netloc vga_0_vga_v_cnt 1 1 1 580
preplace netloc rst_1 1 0 2 NJ 760 600
preplace netloc ov7725_regData_0_LUT_DATA 1 1 2 710 1320 1080
preplace netloc clk_in1_1 1 0 2 NJ 220 660
preplace netloc OV7725_PCLK_1 1 0 2 NJ 210 680
preplace netloc IICctrl_0_I2C_SCLK 1 2 1 1060
preplace netloc two2one_mux_0_mux_out 1 1 1 590
preplace netloc OV7725_HREF_1 1 0 2 NJ 200 690
preplace netloc xlconstant_0_dout 1 1 1 620
preplace netloc OV7725_D_1 1 0 2 NJ 190 700
preplace netloc vga_0_vga_vsync 1 1 2 630 160 NJ
preplace netloc vga_0_vga_hsync 1 1 2 610 150 NJ
preplace netloc rgb565_rgb888_0_rgb888 1 0 3 120 1370 NJ 1370 1120
preplace netloc debounce_0_o 1 0 3 160 550 640 1200 1060
preplace netloc cam_ov7670_ov7725_0_addr 1 1 2 760 820 1100
preplace netloc vga_0_vga_valid 1 1 1 630
preplace netloc sobel_filter_0_out_pix_V_d0 1 0 2 160 240 590
preplace netloc ram_read_0_vga_green 1 2 1 1190
preplace netloc clk_wiz_0_clk_out2 1 0 3 130 230 670 830 1160
preplace netloc cam_ov7670_ov7725_0_dout 1 1 2 770 1190 1090
preplace netloc blk_mem_gen_0_doutb 1 1 1 780
preplace netloc Net 1 2 1 1140
preplace netloc xlconstant_800_dout 1 0 2 150 570 560
preplace netloc xlconstant_680_dout 1 0 2 140 560 570
preplace netloc vsync_1 1 0 2 NJ 540 650
levelinfo -pg 1 30 360 930 1220 -top 0 -bot 1400
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


