proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir E:/Basys3/Microblaze/oled/MB_Uart.cache/wt [current_project]
  set_property parent.project_path E:/Basys3/Microblaze/oled/MB_Uart.xpr [current_project]
  set_property ip_repo_paths e:/Basys3/Microblaze/oled/MB_Uart.cache/ip [current_project]
  set_property ip_output_repo e:/Basys3/Microblaze/oled/MB_Uart.cache/ip [current_project]
  add_files -quiet E:/Basys3/Microblaze/oled/MB_Uart.runs/synth_1/design_1_wrapper.dcp
  add_files E:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/design_1.bmm
  set_property SCOPED_TO_REF design_1 [get_files -all E:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/design_1.bmm]
  set_property SCOPED_TO_CELLS {} [get_files -all E:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/design_1.bmm]
  add_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_4/e11bcbd5/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF design_1 [get_files -all e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_4/e11bcbd5/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_4/e11bcbd5/data/mb_bootloop_le.elf]
  read_xdc -prop_thru_buffers -ref design_1_clk_wiz_0_0 -cells inst e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc]
  read_xdc -ref design_1_clk_wiz_0_0 -cells inst e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc]
  read_xdc -ref design_1_mdm_1_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/design_1_mdm_1_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/design_1_mdm_1_0.xdc]
  read_xdc -ref design_1_microblaze_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/design_1_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/design_1_microblaze_0_0.xdc]
  read_xdc -ref design_1_dlmb_v10_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_0/design_1_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_0/design_1_dlmb_v10_0.xdc]
  read_xdc -ref design_1_ilmb_v10_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_0/design_1_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_0/design_1_ilmb_v10_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_rst_clk_wiz_1_100M_0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0_board.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0_board.xdc]
  read_xdc -ref design_1_rst_clk_wiz_1_100M_0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/design_1_rst_clk_wiz_1_100M_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_axi_quad_spi_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_quad_spi_0_0/design_1_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_quad_spi_0_0/design_1_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref design_1_axi_quad_spi_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_quad_spi_0_0/design_1_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_quad_spi_0_0/design_1_axi_quad_spi_0_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_axi_gpio_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0_board.xdc]
  read_xdc -ref design_1_axi_gpio_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_axi_gpio_1_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/design_1_axi_gpio_1_0_board.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/design_1_axi_gpio_1_0_board.xdc]
  read_xdc -ref design_1_axi_gpio_1_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/design_1_axi_gpio_1_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/design_1_axi_gpio_1_0.xdc]
  read_xdc -prop_thru_buffers -ref design_1_axi_gpio_0_1 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1_board.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1_board.xdc]
  read_xdc -ref design_1_axi_gpio_0_1 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_1/design_1_axi_gpio_0_1.xdc]
  read_xdc -prop_thru_buffers -ref design_1_axi_gpio_0_2 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_2/design_1_axi_gpio_0_2_board.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_2/design_1_axi_gpio_0_2_board.xdc]
  read_xdc -ref design_1_axi_gpio_0_2 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_2/design_1_axi_gpio_0_2.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_2/design_1_axi_gpio_0_2.xdc]
  read_xdc -ref design_1_axi_intc_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_intc_0_0/design_1_axi_intc_0_0.xdc
  set_property processing_order EARLY [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_intc_0_0/design_1_axi_intc_0_0.xdc]
  read_xdc E:/Basys3/Microblaze/oled/MB_Uart.srcs/constrs_1/imports/Constraint/B3_MB_uart.xdc
  read_xdc -ref design_1_axi_quad_spi_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_quad_spi_0_0/design_1_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_quad_spi_0_0/design_1_axi_quad_spi_0_0_clocks.xdc]
  read_xdc -ref design_1_axi_intc_0_0 -cells U0 e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_intc_0_0/design_1_axi_intc_0_0_clocks.xdc
  set_property processing_order LATE [get_files e:/Basys3/Microblaze/oled/MB_Uart.srcs/sources_1/bd/design_1/ip/design_1_axi_intc_0_0/design_1_axi_intc_0_0_clocks.xdc]
  link_design -top design_1_wrapper -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force design_1_wrapper_opt.dcp
  catch {report_drc -file design_1_wrapper_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force design_1_wrapper_placed.dcp
  catch { report_io -file design_1_wrapper_io_placed.rpt }
  catch { report_clock_utilization -file design_1_wrapper_clock_utilization_placed.rpt }
  catch { report_utilization -file design_1_wrapper_utilization_placed.rpt -pb design_1_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file design_1_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force design_1_wrapper_routed.dcp
  catch { report_drc -file design_1_wrapper_drc_routed.rpt -pb design_1_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file design_1_wrapper_timing_summary_routed.rpt -rpx design_1_wrapper_timing_summary_routed.rpx }
  catch { report_power -file design_1_wrapper_power_routed.rpt -pb design_1_wrapper_power_summary_routed.pb }
  catch { report_route_status -file design_1_wrapper_route_status.rpt -pb design_1_wrapper_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force design_1_wrapper.mmi }
  catch { write_bmm -force design_1_wrapper_bd.bmm }
  write_bitstream -force design_1_wrapper.bit 
  if { [file exists E:/Basys3/Microblaze/oled/MB_Uart.runs/synth_1/design_1_wrapper.hwdef] } {
    catch { write_sysdef -hwdef E:/Basys3/Microblaze/oled/MB_Uart.runs/synth_1/design_1_wrapper.hwdef -bitfile design_1_wrapper.bit -meminfo design_1_wrapper.mmi -file design_1_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

