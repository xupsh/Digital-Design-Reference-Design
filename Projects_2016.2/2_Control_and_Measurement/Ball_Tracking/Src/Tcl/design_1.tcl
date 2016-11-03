
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
  set Config_Done [ create_bd_port -dir O Config_Done ]
  set Move_EN [ create_bd_port -dir I Move_EN ]
  set OV7725_D [ create_bd_port -dir I -from 7 -to 0 OV7725_D ]
  set OV7725_HREF [ create_bd_port -dir I OV7725_HREF ]
  set OV7725_PCLK [ create_bd_port -dir I OV7725_PCLK ]
  set OV7725_SIOC [ create_bd_port -dir O OV7725_SIOC ]
  set OV7725_SIOD [ create_bd_port -dir IO OV7725_SIOD ]
  set OV7725_VSYNC [ create_bd_port -dir I OV7725_VSYNC ]
  set OV7725_XCLK [ create_bd_port -dir O OV7725_XCLK ]
  set btn_ColorExtract [ create_bd_port -dir I btn_ColorExtract ]
  set clk100 [ create_bd_port -dir I -type clk clk100 ]
  set pwm_out_x [ create_bd_port -dir O pwm_out_x ]
  set pwm_out_y [ create_bd_port -dir O pwm_out_y ]
  set rst [ create_bd_port -dir I rst ]
  set sw_ColorClear [ create_bd_port -dir I sw_ColorClear ]
  set vauxn6 [ create_bd_port -dir I vauxn6 ]
  set vauxn7 [ create_bd_port -dir I vauxn7 ]
  set vauxn14 [ create_bd_port -dir I vauxn14 ]
  set vauxn15 [ create_bd_port -dir I vauxn15 ]
  set vauxp6 [ create_bd_port -dir I vauxp6 ]
  set vauxp7 [ create_bd_port -dir I vauxp7 ]
  set vauxp14 [ create_bd_port -dir I vauxp14 ]
  set vauxp15 [ create_bd_port -dir I vauxp15 ]
  set vga_blue [ create_bd_port -dir O -from 3 -to 0 vga_blue ]
  set vga_green [ create_bd_port -dir O -from 3 -to 0 vga_green ]
  set vga_hsync [ create_bd_port -dir O vga_hsync ]
  set vga_red [ create_bd_port -dir O -from 3 -to 0 vga_red ]
  set vga_vsync [ create_bd_port -dir O vga_vsync ]

  # Create instance: IICctrl_0, and set properties
  set IICctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:IICctrl:1.0 IICctrl_0 ]

  # Create instance: PWM_gen_0, and set properties
  set PWM_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:PWM_gen:1.0 PWM_gen_0 ]

  # Create instance: PWM_gen_1, and set properties
  set PWM_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:PWM_gen:1.0 PWM_gen_1 ]

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_0 ]
  set_property -dict [ list \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_A {Always_Enabled} \
CONFIG.Enable_B {Always_Enabled} \
CONFIG.MEM_FILE {NONE} \
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

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MEM_FILE.VALUE_SRC {DEFAULT} \
 ] $blk_mem_gen_0

  # Create instance: cam_ov7670_ov7725_0, and set properties
  set cam_ov7670_ov7725_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:cam_ov7670_ov7725:1.0 cam_ov7670_ov7725_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {130.958} \
CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT2_JITTER {175.402} \
CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
CONFIG.MMCM_CLKOUT1_DIVIDE {40} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CLKOUT1_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_0

  # Create instance: colorDetect_0, and set properties
  set colorDetect_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:colorDetect:1.0 colorDetect_0 ]

  # Create instance: debounce_0, and set properties
  set debounce_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:debounce:1.0 debounce_0 ]

  # Create instance: dilate_0, and set properties
  set dilate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:dilate:1.0 dilate_0 ]

  # Create instance: erode_0, and set properties
  set erode_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:erode:1.0 erode_0 ]

  # Create instance: move_en_0, and set properties
  set move_en_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:move_en:1.0 move_en_0 ]

  # Create instance: move_en_1, and set properties
  set move_en_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:move_en:1.0 move_en_1 ]

  # Create instance: ov7725_regData_0, and set properties
  set ov7725_regData_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:ov7725_regData:1.0 ov7725_regData_0 ]

  # Create instance: ram_read_0, and set properties
  set ram_read_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:ram_read:1.0 ram_read_0 ]

  # Create instance: region_cut_0, and set properties
  set region_cut_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:region_cut:1.0 region_cut_0 ]

  # Create instance: rgb2hsv_top_0, and set properties
  set rgb2hsv_top_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:rgb2hsv_top:1.0 rgb2hsv_top_0 ]

  # Create instance: rgb565_rgb888_0, and set properties
  set rgb565_rgb888_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:rgb565_rgb888:1.0 rgb565_rgb888_0 ]

  # Create instance: rgb888_rgb565_0, and set properties
  set rgb888_rgb565_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:rgb888_rgb565:1.0 rgb888_rgb565_0 ]

  # Create instance: servo_ctrl_0, and set properties
  set servo_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:servo_ctrl:1.0 servo_ctrl_0 ]

  # Create instance: vga_0, and set properties
  set vga_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:vga:1.0 vga_0 ]

  # Create instance: xadc_0, and set properties
  set xadc_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:xadc:1.0 xadc_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create port connections
  connect_bd_net -net IICctrl_0_I2C_SCLK [get_bd_ports OV7725_SIOC] [get_bd_pins IICctrl_0/I2C_SCLK]
  connect_bd_net -net IICctrl_0_LUT_INDEX [get_bd_pins IICctrl_0/LUT_INDEX] [get_bd_pins ov7725_regData_0/LUT_INDEX]
  connect_bd_net -net Move_EN_2 [get_bd_ports Move_EN] [get_bd_pins move_en_0/Move_EN] [get_bd_pins move_en_1/Move_EN]
  connect_bd_net -net Net [get_bd_ports OV7725_SIOD] [get_bd_pins IICctrl_0/I2C_SDAT]
  connect_bd_net -net OV7725_D_1 [get_bd_ports OV7725_D] [get_bd_pins cam_ov7670_ov7725_0/d]
  connect_bd_net -net OV7725_HREF_1 [get_bd_ports OV7725_HREF] [get_bd_pins cam_ov7670_ov7725_0/href]
  connect_bd_net -net PWM_gen_0_PWM [get_bd_pins PWM_gen_0/PWM] [get_bd_pins move_en_0/pwm_i]
  connect_bd_net -net PWM_gen_1_PWM [get_bd_pins PWM_gen_1/PWM] [get_bd_pins move_en_1/pwm_i]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins blk_mem_gen_0/doutb] [get_bd_pins rgb565_rgb888_0/rgb565]
  connect_bd_net -net btn_ColorExtract_1 [get_bd_ports btn_ColorExtract] [get_bd_pins colorDetect_0/btn_ColorExtract]
  connect_bd_net -net cam_ov7670_ov7725_0_addr [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins cam_ov7670_ov7725_0/addr]
  connect_bd_net -net cam_ov7670_ov7725_0_dout [get_bd_pins blk_mem_gen_0/dina] [get_bd_pins cam_ov7670_ov7725_0/dout]
  connect_bd_net -net cam_ov7670_ov7725_0_wclk [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins cam_ov7670_ov7725_0/wclk]
  connect_bd_net -net cam_ov7670_ov7725_0_we [get_bd_pins blk_mem_gen_0/wea] [get_bd_pins cam_ov7670_ov7725_0/we]
  connect_bd_net -net clk_in1_1 [get_bd_ports clk100] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins PWM_gen_0/clk_pwm] [get_bd_pins PWM_gen_1/clk_pwm] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins xadc_0/clk100]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_ports OV7725_XCLK] [get_bd_pins IICctrl_0/iCLK] [get_bd_pins blk_mem_gen_0/clkb] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins colorDetect_0/PClk] [get_bd_pins debounce_0/clk] [get_bd_pins dilate_0/PCLK] [get_bd_pins erode_0/PCLK] [get_bd_pins ram_read_0/clk] [get_bd_pins rgb2hsv_top_0/pclk] [get_bd_pins vga_0/vga_pclk]
  connect_bd_net -net colorDetect_0_Binary_PreProcess [get_bd_pins colorDetect_0/Binary_PreProcess] [get_bd_pins erode_0/pix_i]
  connect_bd_net -net colorDetect_0_RGB24_dis [get_bd_pins colorDetect_0/RGB24_dis] [get_bd_pins rgb888_rgb565_0/rgb888]
  connect_bd_net -net colorDetect_0_center_h [get_bd_pins colorDetect_0/center_h] [get_bd_pins servo_ctrl_0/x]
  connect_bd_net -net colorDetect_0_center_v [get_bd_pins colorDetect_0/center_v] [get_bd_pins servo_ctrl_0/y]
  connect_bd_net -net debounce_0_o [get_bd_pins IICctrl_0/rst] [get_bd_pins PWM_gen_0/clr_pwm] [get_bd_pins PWM_gen_1/clr_pwm] [get_bd_pins debounce_0/o] [get_bd_pins vga_0/vga_rst] [get_bd_pins xadc_0/rst]
  connect_bd_net -net dilate_0_pix_o [get_bd_pins colorDetect_0/Binary_PostProcess] [get_bd_pins dilate_0/pix_o]
  connect_bd_net -net erode_0_pix_o [get_bd_pins dilate_0/pix_i] [get_bd_pins erode_0/pix_o]
  connect_bd_net -net move_en_0_pwm_o [get_bd_ports pwm_out_x] [get_bd_pins move_en_0/pwm_o]
  connect_bd_net -net move_en_1_pwm_o [get_bd_ports pwm_out_y] [get_bd_pins move_en_1/pwm_o]
  connect_bd_net -net ov7725_regData_0_LUT_DATA [get_bd_pins IICctrl_0/LUT_DATA] [get_bd_pins ov7725_regData_0/LUT_DATA]
  connect_bd_net -net ov7725_regData_0_Slave_Addr [get_bd_pins IICctrl_0/Slave_Addr] [get_bd_pins ov7725_regData_0/Slave_Addr]
  connect_bd_net -net pclk_1 [get_bd_ports OV7725_PCLK] [get_bd_pins cam_ov7670_ov7725_0/pclk]
  connect_bd_net -net ram_read_0_address [get_bd_pins blk_mem_gen_0/addrb] [get_bd_pins ram_read_0/address]
  connect_bd_net -net ram_read_0_vga_blue [get_bd_ports vga_blue] [get_bd_pins ram_read_0/vga_blue]
  connect_bd_net -net ram_read_0_vga_green [get_bd_ports vga_green] [get_bd_pins ram_read_0/vga_green]
  connect_bd_net -net ram_read_0_vga_red [get_bd_ports vga_red] [get_bd_pins ram_read_0/vga_red]
  connect_bd_net -net rgb2hsv_top_0_HSV24 [get_bd_pins colorDetect_0/HSV24] [get_bd_pins rgb2hsv_top_0/HSV24]
  connect_bd_net -net rgb565_rgb888_0_rgb888 [get_bd_pins colorDetect_0/RGB24] [get_bd_pins rgb2hsv_top_0/RGB24] [get_bd_pins rgb565_rgb888_0/rgb888]
  connect_bd_net -net rgb888_rgb565_0_rgb565 [get_bd_pins ram_read_0/din] [get_bd_pins rgb888_rgb565_0/rgb565]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins debounce_0/i]
  connect_bd_net -net servo_ctrl_0_duty_x [get_bd_pins PWM_gen_0/duty] [get_bd_pins servo_ctrl_0/duty_x]
  connect_bd_net -net servo_ctrl_0_duty_y [get_bd_pins PWM_gen_1/duty] [get_bd_pins servo_ctrl_0/duty_y]
  connect_bd_net -net sw_ColorClear_1 [get_bd_ports sw_ColorClear] [get_bd_pins colorDetect_0/sw_ColorClear]
  connect_bd_net -net vauxn14_1 [get_bd_ports vauxn14] [get_bd_pins xadc_0/vauxn14]
  connect_bd_net -net vauxn15_1 [get_bd_ports vauxn15] [get_bd_pins xadc_0/vauxn15]
  connect_bd_net -net vauxn6_1 [get_bd_ports vauxn6] [get_bd_pins xadc_0/vauxn6]
  connect_bd_net -net vauxn7_1 [get_bd_ports vauxn7] [get_bd_pins xadc_0/vauxn7]
  connect_bd_net -net vauxp14_1 [get_bd_ports vauxp14] [get_bd_pins xadc_0/vauxp14]
  connect_bd_net -net vauxp15_1 [get_bd_ports vauxp15] [get_bd_pins xadc_0/vauxp15]
  connect_bd_net -net vauxp6_1 [get_bd_ports vauxp6] [get_bd_pins xadc_0/vauxp6]
  connect_bd_net -net vauxp7_1 [get_bd_ports vauxp7] [get_bd_pins xadc_0/vauxp7]
  connect_bd_net -net vga_0_Hcnt_signal [get_bd_pins colorDetect_0/VtcHCnt] [get_bd_pins dilate_0/VtcHCnt] [get_bd_pins erode_0/VtcHCnt] [get_bd_pins region_cut_0/valid_h_cnt]
  connect_bd_net -net vga_0_Vcnt_signal [get_bd_pins colorDetect_0/VtcVCnt] [get_bd_pins dilate_0/VtcVCnt] [get_bd_pins erode_0/VtcVCnt] [get_bd_pins region_cut_0/valid_v_cnt]
  connect_bd_net -net vga_0_vga_h_cnt [get_bd_pins ram_read_0/vga_h_cnt] [get_bd_pins region_cut_0/vga_h_cnt] [get_bd_pins vga_0/vga_h_cnt]
  connect_bd_net -net vga_0_vga_hsync [get_bd_ports vga_hsync] [get_bd_pins vga_0/vga_hsync]
  connect_bd_net -net vga_0_vga_v_cnt [get_bd_pins ram_read_0/vga_v_cnt] [get_bd_pins region_cut_0/vga_v_cnt] [get_bd_pins vga_0/vga_v_cnt]
  connect_bd_net -net vga_0_vga_valid [get_bd_pins ram_read_0/valid] [get_bd_pins vga_0/vga_valid]
  connect_bd_net -net vga_0_vga_vsync [get_bd_ports vga_vsync] [get_bd_pins vga_0/vga_vsync]
  connect_bd_net -net vsync_1 [get_bd_ports OV7725_VSYNC] [get_bd_pins cam_ov7670_ov7725_0/vsync] [get_bd_pins servo_ctrl_0/vsync_in]
  connect_bd_net -net xadc_0_aux_out_6 [get_bd_pins servo_ctrl_0/ad_data_y] [get_bd_pins xadc_0/aux_out_6]
  connect_bd_net -net xadc_0_aux_out_7 [get_bd_pins servo_ctrl_0/ad_data_x] [get_bd_pins xadc_0/aux_out_7]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins debounce_0/clr] [get_bd_pins xlconstant_0/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port vga_hsync -pg 1 -y 120 -defaultsOSRD
preplace port OV7725_SIOC -pg 1 -y 820 -defaultsOSRD
preplace port sw_ColorClear -pg 1 -y 80 -defaultsOSRD
preplace port btn_ColorExtract -pg 1 -y 380 -defaultsOSRD
preplace port OV7725_SIOD -pg 1 -y 840 -defaultsOSRD
preplace port OV7725_PCLK -pg 1 -y 20 -defaultsOSRD
preplace port Config_Done -pg 1 -y 20 -defaultsOSRD
preplace port vauxp6 -pg 1 -y 220 -defaultsOSRD
preplace port vauxp7 -pg 1 -y 240 -defaultsOSRD
preplace port clk100 -pg 1 -y 980 -defaultsOSRD
preplace port OV7725_VSYNC -pg 1 -y 40 -defaultsOSRD
preplace port vauxp14 -pg 1 -y 260 -defaultsOSRD
preplace port rst -pg 1 -y 60 -defaultsOSRD
preplace port vauxp15 -pg 1 -y 280 -defaultsOSRD
preplace port vauxn6 -pg 1 -y 140 -defaultsOSRD
preplace port vauxn14 -pg 1 -y 180 -defaultsOSRD
preplace port pwm_out_x -pg 1 -y 40 -defaultsOSRD
preplace port OV7725_XCLK -pg 1 -y 310 -defaultsOSRD
preplace port OV7725_HREF -pg 1 -y 100 -defaultsOSRD
preplace port vauxn7 -pg 1 -y 160 -defaultsOSRD
preplace port vauxn15 -pg 1 -y 200 -defaultsOSRD
preplace port pwm_out_y -pg 1 -y 60 -defaultsOSRD
preplace port Move_EN -pg 1 -y 400 -defaultsOSRD
preplace port vga_vsync -pg 1 -y 160 -defaultsOSRD
preplace portBus vga_green -pg 1 -y 100 -defaultsOSRD
preplace portBus vga_red -pg 1 -y 140 -defaultsOSRD
preplace portBus OV7725_D -pg 1 -y 120 -defaultsOSRD
preplace portBus vga_blue -pg 1 -y 80 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 4 -y 1310 -defaultsOSRD
preplace inst move_en_0 -pg 1 -lvl 2 -y 460 -defaultsOSRD
preplace inst rgb2hsv_top_0 -pg 1 -lvl 3 -y 1580 -defaultsOSRD
preplace inst move_en_1 -pg 1 -lvl 2 -y 660 -defaultsOSRD
preplace inst vga_0 -pg 1 -lvl 3 -y 1740 -defaultsOSRD
preplace inst PWM_gen_0 -pg 1 -lvl 1 -y 450 -defaultsOSRD
preplace inst rgb565_rgb888_0 -pg 1 -lvl 3 -y 260 -defaultsOSRD
preplace inst dilate_0 -pg 1 -lvl 3 -y 1020 -defaultsOSRD
preplace inst PWM_gen_1 -pg 1 -lvl 1 -y 880 -defaultsOSRD
preplace inst blk_mem_gen_0 -pg 1 -lvl 3 -y 100 -defaultsOSRD
preplace inst debounce_0 -pg 1 -lvl 3 -y 660 -defaultsOSRD
preplace inst colorDetect_0 -pg 1 -lvl 3 -y 490 -defaultsOSRD
preplace inst xadc_0 -pg 1 -lvl 1 -y 660 -defaultsOSRD
preplace inst rgb888_rgb565_0 -pg 1 -lvl 4 -y 1040 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 2 -y 980 -defaultsOSRD
preplace inst servo_ctrl_0 -pg 1 -lvl 4 -y 1160 -defaultsOSRD
preplace inst region_cut_0 -pg 1 -lvl 4 -y 900 -defaultsOSRD
preplace inst IICctrl_0 -pg 1 -lvl 2 -y 810 -defaultsOSRD
preplace inst ram_read_0 -pg 1 -lvl 3 -y 1390 -defaultsOSRD
preplace inst ov7725_regData_0 -pg 1 -lvl 3 -y 860 -defaultsOSRD
preplace inst erode_0 -pg 1 -lvl 3 -y 1240 -defaultsOSRD
preplace inst cam_ov7670_ov7725_0 -pg 1 -lvl 2 -y 90 -defaultsOSRD
preplace netloc vga_0_vga_h_cnt 1 2 2 870 1490 1390
preplace netloc vauxp7_1 1 0 1 60
preplace netloc vauxp14_1 1 0 1 30
preplace netloc vauxn15_1 1 0 1 40
preplace netloc servo_ctrl_0_duty_y 1 0 5 120 320 NJ 320 NJ 320 NJ 320 1680
preplace netloc ram_read_0_vga_red 1 3 2 NJ 140 N
preplace netloc ov7725_regData_0_Slave_Addr 1 1 3 430 890 NJ 780 1180
preplace netloc colorDetect_0_RGB24_dis 1 3 1 1350
preplace netloc PWM_gen_1_PWM 1 1 1 420
preplace netloc xadc_0_aux_out_6 1 1 3 400 600 NJ 1150 NJ
preplace netloc vga_0_Vcnt_signal 1 2 3 850 940 NJ 960 1660
preplace netloc rgb888_rgb565_0_rgb565 1 2 3 860 1480 NJ 1480 1660
preplace netloc ram_read_0_vga_blue 1 3 2 NJ 80 N
preplace netloc ram_read_0_address 1 2 2 860 370 1240
preplace netloc cam_ov7670_ov7725_0_wclk 1 2 1 830
preplace netloc Move_EN_2 1 0 2 NJ 520 440
preplace netloc xadc_0_aux_out_7 1 1 3 400 1160 NJ 1160 NJ
preplace netloc vauxp6_1 1 0 1 90
preplace netloc sw_ColorClear_1 1 0 3 NJ 200 NJ 200 760
preplace netloc move_en_1_pwm_o 1 2 3 NJ 350 NJ 60 N
preplace netloc colorDetect_0_center_h 1 3 1 1360
preplace netloc colorDetect_0_Binary_PreProcess 1 2 2 880 1140 1230
preplace netloc cam_ov7670_ov7725_0_we 1 2 1 840
preplace netloc IICctrl_0_LUT_INDEX 1 2 1 740
preplace netloc vga_0_vga_v_cnt 1 2 2 880 1500 1400
preplace netloc rst_1 1 0 3 NJ 190 NJ 190 770
preplace netloc ov7725_regData_0_LUT_DATA 1 1 3 440 730 NJ 750 1190
preplace netloc dilate_0_pix_o 1 2 2 880 740 1210
preplace netloc colorDetect_0_center_v 1 3 1 1310
preplace netloc clk_in1_1 1 0 2 NJ 980 N
preplace netloc erode_0_pix_o 1 2 2 880 1100 1180
preplace netloc IICctrl_0_I2C_SCLK 1 2 3 N 790 NJ 790 NJ
preplace netloc vauxp15_1 1 0 1 20
preplace netloc move_en_0_pwm_o 1 2 3 NJ 340 NJ 40 N
preplace netloc OV7725_HREF_1 1 0 2 NJ 100 N
preplace netloc xlconstant_0_dout 1 2 3 870 930 NJ 970 1670
preplace netloc vauxn14_1 1 0 1 70
preplace netloc rgb2hsv_top_0_HSV24 1 2 2 860 920 1220
preplace netloc PWM_gen_0_PWM 1 1 1 400
preplace netloc OV7725_D_1 1 0 2 NJ 120 N
preplace netloc vga_0_vga_vsync 1 3 2 1380 160 NJ
preplace netloc vga_0_vga_hsync 1 3 2 1320 120 NJ
preplace netloc rgb565_rgb888_0_rgb888 1 2 2 830 730 1210
preplace netloc debounce_0_o 1 0 4 150 800 410 900 800 760 1200
preplace netloc clk_wiz_0_clk_out1 1 0 3 140 380 NJ 380 730
preplace netloc cam_ov7670_ov7725_0_addr 1 2 1 760
preplace netloc vga_0_vga_valid 1 2 2 850 1510 1180
preplace netloc ram_read_0_vga_green 1 3 2 NJ 100 N
preplace netloc pclk_1 1 0 2 NJ 20 400
preplace netloc clk_wiz_0_clk_out2 1 1 4 430 720 790 330 NJ 300 NJ
preplace netloc cam_ov7670_ov7725_0_dout 1 2 1 790
preplace netloc blk_mem_gen_0_doutb 1 2 1 880
preplace netloc Net 1 2 3 820 800 NJ 800 NJ
preplace netloc vsync_1 1 0 4 NJ 40 440 -10 NJ 360 NJ
preplace netloc vga_0_Hcnt_signal 1 2 3 840 770 NJ 770 1660
preplace netloc vauxn7_1 1 0 1 100
preplace netloc vauxn6_1 1 0 1 110
preplace netloc servo_ctrl_0_duty_x 1 0 5 130 310 NJ 310 NJ 310 NJ 310 1690
preplace netloc btn_ColorExtract_1 1 0 3 NJ 370 NJ 370 750
levelinfo -pg 1 0 280 600 1040 1530 1730 -top -20 -bot 1830
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


common::send_msg_id "BD_TCL-2000" "CRITICAL WARNING" "This Tcl script was generated from a block design that is out-of-date/locked. It is possible that design <$design_name> may result in errors during construction."

create_root_design ""


common::send_msg_id "BD_TCL-1000" "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

