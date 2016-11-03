set prj_name "taxi"
set prj_path "../prj"
set prj_source "../HDL_source"
set prj_constraint "../Constraint"

create_project $prj_name $prj_path -part xc7a35tcpg236-1 -force


import_files -force -norecurse -fileset sources_1 $prj_source/bcd.v
import_files -force -norecurse -fileset sources_1 $prj_source/taxi.v
import_files -force -norecurse -fileset sources_1 $prj_source/top.v
import_files -force -norecurse -fileset sources_1 $prj_source/seg_display.v

import_files -force -norecurse -fileset constrs_1 $prj_constraint/taxi.xdc
set_property top example_top [current_fileset]


launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
open_run impl_1