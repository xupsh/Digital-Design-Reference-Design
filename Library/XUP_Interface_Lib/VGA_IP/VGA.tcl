set prj_name "VGA"
set prj_path "./prj"
set prj_src "./src"

create_project $prj_name $prj_path -part xc7a35tcpg236-1 -force

import_files [glob $prj_src/source/*.v]

set_property top vga_1440x900 [current_fileset]

launch_runs synth_1
wait_on_run synth_1



