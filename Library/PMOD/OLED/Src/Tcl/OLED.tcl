set prj_name "OLED"
set prj_path "../prj"
set prj_source "../HDL_source"
set prj_constraint "../Constraint"

create_project $prj_name $prj_path -part xc7a35tcpg236-1 -force










import_files -force -norecurse -fileset sources_1 $prj_source/oled.v
import_files -force -norecurse -fileset sources_1 $prj_source/oled_clear.v
import_files -force -norecurse -fileset sources_1 $prj_source/oled_top.v
import_files -force -norecurse -fileset sources_1 $prj_source/oled_write_data.v
import_files -force -norecurse -fileset sources_1 $prj_source/spi_master.v
import_files -force -norecurse -fileset constrs_1 $prj_constraint/PIN.xdc



launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
open_run impl_1



