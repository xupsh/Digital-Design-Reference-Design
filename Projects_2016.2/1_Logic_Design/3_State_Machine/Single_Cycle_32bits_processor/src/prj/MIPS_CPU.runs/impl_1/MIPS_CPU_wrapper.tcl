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
  set_property webtalk.parent_dir e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.cache/wt [current_project]
  set_property parent.project_path e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.xpr [current_project]
  set_property ip_repo_paths {
  e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.cache/ip
  e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/IPCatalog
} [current_project]
  set_property ip_output_repo e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.cache/ip [current_project]
  add_files -quiet e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.runs/synth_1/MIPS_CPU_wrapper.dcp
  read_xdc -prop_thru_buffers -ref MIPS_CPU_clk_wiz_0_0 -cells inst e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.srcs/sources_1/bd/MIPS_CPU/ip/MIPS_CPU_clk_wiz_0_0/MIPS_CPU_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.srcs/sources_1/bd/MIPS_CPU/ip/MIPS_CPU_clk_wiz_0_0/MIPS_CPU_clk_wiz_0_0_board.xdc]
  read_xdc -ref MIPS_CPU_clk_wiz_0_0 -cells inst e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.srcs/sources_1/bd/MIPS_CPU/ip/MIPS_CPU_clk_wiz_0_0/MIPS_CPU_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.srcs/sources_1/bd/MIPS_CPU/ip/MIPS_CPU_clk_wiz_0_0/MIPS_CPU_clk_wiz_0_0.xdc]
  read_xdc e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.srcs/constrs_1/imports/Constraint/MIPS_CPU.xdc
  link_design -top MIPS_CPU_wrapper -part xc7a35tcpg236-1
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
  write_checkpoint -force MIPS_CPU_wrapper_opt.dcp
  catch {report_drc -file MIPS_CPU_wrapper_drc_opted.rpt}
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
  write_checkpoint -force MIPS_CPU_wrapper_placed.dcp
  catch { report_io -file MIPS_CPU_wrapper_io_placed.rpt }
  catch { report_clock_utilization -file MIPS_CPU_wrapper_clock_utilization_placed.rpt }
  catch { report_utilization -file MIPS_CPU_wrapper_utilization_placed.rpt -pb MIPS_CPU_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file MIPS_CPU_wrapper_control_sets_placed.rpt }
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
  write_checkpoint -force MIPS_CPU_wrapper_routed.dcp
  catch { report_drc -file MIPS_CPU_wrapper_drc_routed.rpt -pb MIPS_CPU_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file MIPS_CPU_wrapper_timing_summary_routed.rpt -rpx MIPS_CPU_wrapper_timing_summary_routed.rpx }
  catch { report_power -file MIPS_CPU_wrapper_power_routed.rpt -pb MIPS_CPU_wrapper_power_summary_routed.pb }
  catch { report_route_status -file MIPS_CPU_wrapper_route_status.rpt -pb MIPS_CPU_wrapper_route_status.pb }
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
  write_bitstream -force MIPS_CPU_wrapper.bit 
  if { [file exists e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.runs/synth_1/MIPS_CPU_wrapper.hwdef] } {
    catch { write_sysdef -hwdef e:/Github/xupsh/Basys3-Git/Projects_2016.2/1_Logic_Design/3_State_Machine/Single_Cycle_32bits_processor/src/prj/MIPS_CPU.runs/synth_1/MIPS_CPU_wrapper.hwdef -bitfile MIPS_CPU_wrapper.bit -meminfo MIPS_CPU_wrapper.mmi -file MIPS_CPU_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

