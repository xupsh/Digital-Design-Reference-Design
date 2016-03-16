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
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.cache/wt [current_project]
  set_property parent.project_path c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.xpr [current_project]
  set_property ip_repo_paths {
  c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.cache/ip
  c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/HDL_source/IP_Catalog
} [current_project]
  set_property ip_output_repo c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.cache/ip [current_project]
  add_files -quiet c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.runs/synth_1/OSC_top.dcp
  add_files -quiet c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/debounce_0/debounce_0.dcp
  set_property netlist_only true [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/debounce_0/debounce_0.dcp]
  add_files -quiet c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/vga_0/vga_0.dcp
  set_property netlist_only true [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/vga_0/vga_0.dcp]
  add_files -quiet c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/xadc_0.dcp
  set_property netlist_only true [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/xadc_0.dcp]
  add_files -quiet c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.runs/clock_synth_1/clock.dcp
  set_property netlist_only true [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.runs/clock_synth_1/clock.dcp]
  read_xdc -ref xadc_wiz_0 -cells inst c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/ip/xadc_wiz_0/xadc_wiz_0.xdc
  set_property processing_order EARLY [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/ip/xadc_wiz_0/xadc_wiz_0.xdc]
  read_xdc -mode out_of_context -ref clock -cells inst c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/clock/clock_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/clock/clock_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clock -cells inst c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/clock/clock_board.xdc
  set_property processing_order EARLY [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/clock/clock_board.xdc]
  read_xdc -ref clock -cells inst c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/clock/clock.xdc
  set_property processing_order EARLY [get_files c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/clock/clock.xdc]
  read_xdc c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/constrs_1/imports/Constraint/oscilloscope.xdc
  link_design -top OSC_top -part xc7a35tcpg236-1
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
  write_checkpoint -force OSC_top_opt.dcp
  catch {report_drc -file OSC_top_drc_opted.rpt}
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
  write_checkpoint -force OSC_top_placed.dcp
  catch { report_io -file OSC_top_io_placed.rpt }
  catch { report_clock_utilization -file OSC_top_clock_utilization_placed.rpt }
  catch { report_utilization -file OSC_top_utilization_placed.rpt -pb OSC_top_utilization_placed.pb }
  catch { report_control_sets -verbose -file OSC_top_control_sets_placed.rpt }
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
  write_checkpoint -force OSC_top_routed.dcp
  catch { report_drc -file OSC_top_drc_routed.rpt -pb OSC_top_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file OSC_top_timing_summary_routed.rpt -rpx OSC_top_timing_summary_routed.rpx }
  catch { report_power -file OSC_top_power_routed.rpt -pb OSC_top_power_summary_routed.pb }
  catch { report_route_status -file OSC_top_route_status.rpt -pb OSC_top_route_status.pb }
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
  write_bitstream -force OSC_top.bit 
  if { [file exists c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.runs/synth_1/OSC_top.hwdef] } {
    catch { write_sysdef -hwdef c:/Users/zhehengt/Desktop/XUP_drafts_V1.2/program/Basys3_Git/B3_Git_Release/Projects/4_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.runs/synth_1/OSC_top.hwdef -bitfile OSC_top.bit -meminfo OSC_top.mmi -file OSC_top.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

