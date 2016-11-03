set prj_name "MB_Uart"
set prj_path "../prj"
set prj_constraint "../Constraint"

create_project $prj_name $prj_path -part xc7a35tcpg236-1 -force

update_ip_catalog

create_bd_design "design_1"
source design_1.tcl

generate_target {synthesis implementation} [get_files $prj_path/$prj_name.srcs/sources_1/bd/design_1/design_1.bd]

make_wrapper -files [get_files $prj_path/$prj_name.srcs/sources_1/bd/design_1/design_1.bd] -top
import_files -force -norecurse -fileset sources_1 $prj_path/$prj_name.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
import_files -force -norecurse -fileset constrs_1 $prj_constraint/B3_MB_uart.xdc
set_property top design_1_wrapper [current_fileset]


launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
open_run impl_1



