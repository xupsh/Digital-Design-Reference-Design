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
  set_property webtalk.parent_dir e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.cache/wt [current_project]
  set_property parent.project_path e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.xpr [current_project]
  set_property ip_repo_paths e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.cache/ip [current_project]
  set_property ip_output_repo e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.cache/ip [current_project]
  add_files -quiet e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.runs/synth_1/Basys3_Abacus_Top.dcp
  read_xdc e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.srcs/constrs_1/imports/Constraint/Basys3_Master.xdc
  link_design -top Basys3_Abacus_Top -part xc7a35tcpg236-1
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
  write_checkpoint -force Basys3_Abacus_Top_opt.dcp
  catch {report_drc -file Basys3_Abacus_Top_drc_opted.rpt}
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
  write_checkpoint -force Basys3_Abacus_Top_placed.dcp
  catch { report_io -file Basys3_Abacus_Top_io_placed.rpt }
  catch { report_clock_utilization -file Basys3_Abacus_Top_clock_utilization_placed.rpt }
  catch { report_utilization -file Basys3_Abacus_Top_utilization_placed.rpt -pb Basys3_Abacus_Top_utilization_placed.pb }
  catch { report_control_sets -verbose -file Basys3_Abacus_Top_control_sets_placed.rpt }
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
  write_checkpoint -force Basys3_Abacus_Top_routed.dcp
  catch { report_drc -file Basys3_Abacus_Top_drc_routed.rpt -pb Basys3_Abacus_Top_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Basys3_Abacus_Top_timing_summary_routed.rpt -rpx Basys3_Abacus_Top_timing_summary_routed.rpx }
  catch { report_power -file Basys3_Abacus_Top_power_routed.rpt -pb Basys3_Abacus_Top_power_summary_routed.pb }
  catch { report_route_status -file Basys3_Abacus_Top_route_status.rpt -pb Basys3_Abacus_Top_route_status.pb }
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
  write_bitstream -force Basys3_Abacus_Top.bit 
  if { [file exists e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.runs/synth_1/Basys3_Abacus_Top.hwdef] } {
    catch { write_sysdef -hwdef e:/Basys3/Projects/1_Logic_Design/2_SN_Design/Digilent_Abacus_Design/Src/prj/Digilent_Abacus_Design.runs/synth_1/Basys3_Abacus_Top.hwdef -bitfile Basys3_Abacus_Top.bit -meminfo Basys3_Abacus_Top.mmi -file Basys3_Abacus_Top.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

