set prj_name "digital_clock_ip"
set prj_path "./prj"

create_project $prj_name $prj_path -part xc7a35tcpg236-1 -force

set_property ip_repo_paths ./IP_Catalog [current_fileset]
update_ip_catalog

create_bd_design "clock"
source clock.tcl

generate_target {synthesis implementation} [get_files $prj_path/$prj_name.srcs/sources_1/bd/clock/clock.bd]

make_wrapper -files [get_files $prj_path/$prj_name.srcs/sources_1/bd/clock/clock.bd] -top
import_files -force -norecurse -fileset sources_1 $prj_path/$prj_name.srcs/sources_1/bd/clock/hdl/clock_wrapper.v
import_files -force -norecurse -fileset constrs_1 ./constraint/clock_wrapper.xdc
set_property top clock_wrapper [current_fileset]


launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
open_run impl_1



